import 'package:news_app/model/news.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/repositories/news_repo.dart';
import 'package:news_app/state/news_state.dart';
import 'package:riverpod/riverpod.dart';

final breakingNewsProvider = FutureProvider<List<News>>((ref) async {
  return NewsRepository.fetchBreakingNews();
});

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  final categoryState = ref.watch(categoryProvider);
  final firstCategory = categoryState.categories.first;

  return NewsNotifier(NewsState.initial(), firstCategory.id);
});

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(NewsState state, int categoryId) : super(state) {
    loadNews(page: 1, category: categoryId);
  }

  void loadNews({required int page, required int category}) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, page: page);

    var newState = await NewsRepository.fetch(page, category);

    if (page == 1) {
      state = newState;
      return;
    }

    newState = newState.copyWith(news: [...state.news, ...newState.news]);
    state = newState;
  }
}
