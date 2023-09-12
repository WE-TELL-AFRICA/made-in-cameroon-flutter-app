// ignore_for_file: must_be_immutable
import 'package:madeincameroon/category/data/models/category_model.dart';

class CategoryState {
  List<CategoryModel>? categories;
  bool isLoadingCategory;
  bool successLoadingCategory;
  bool errorLoadingCategory;

  String? message;

  CategoryState(
      {this.categories,
      this.isLoadingCategory = false,
      this.successLoadingCategory = false,
      this.errorLoadingCategory = false,
      this.message});

  CategoryState copyWith({
    List<CategoryModel>? categories,
    bool? isLoadingCategory,
    bool? successLoadingCategory,
    bool? errorLoadingCategory,
    String? message,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      isLoadingCategory: isLoadingCategory ?? this.isLoadingCategory,
      successLoadingCategory:
          successLoadingCategory ?? this.successLoadingCategory,
      errorLoadingCategory: errorLoadingCategory ?? this.errorLoadingCategory,
      message: message ?? this.message,
    );
  }
}
