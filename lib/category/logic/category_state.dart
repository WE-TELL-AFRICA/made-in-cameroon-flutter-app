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









}
