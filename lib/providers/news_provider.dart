import 'package:news_app/repositories/news_repo.dart';
import 'package:news_app/state/news_state.dart';
import 'package:riverpod/riverpod.dart';

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier(NewsState.initial());
});

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(NewsState state) : super(state) {
    loadNews();
  }

  void loadNews() async {
    state = state.copyWith(isLoading: true);

    state = await NewsRepository.fetch(state.page + 1);
  }
}
