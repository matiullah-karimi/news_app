import 'package:news_app/model/category.dart';

class CategoryState {
  final List<Category> categories;
  final bool isLoading;
  final bool isError;

  CategoryState({
    required this.categories,
    this.isLoading = false,
    this.isError = false,
  });

  factory CategoryState.initial() {
    return CategoryState(
      categories: [],
      isLoading: false,
      isError: false,
    );
  }

  CategoryState copyWith({
    List<Category>? categories,
    bool? isLoading,
    bool? isError,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
