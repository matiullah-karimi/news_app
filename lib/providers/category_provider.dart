import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/repositories/news_repo.dart';
import 'package:news_app/state/category_state.dart';

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier(CategoryState.initial());
});

class CategoryNotifier extends StateNotifier<CategoryState> {
  CategoryNotifier(CategoryState state) : super(state) {
    fetch();
  }

  void fetch() async {
    state = state.copyWith(isLoading: true);

    final categories = await NewsRepository.fetchCategories();

    state = state.copyWith(
      isLoading: false,
      categories: categories,
    );
  }
}
