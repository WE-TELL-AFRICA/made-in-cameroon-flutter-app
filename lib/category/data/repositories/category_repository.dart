import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:madeincameroon/shared/data/settings.dart';

import '../models/category_model.dart';

class CategoryRepository {
  late final Dio dio;

  CategoryRepository({required this.dio});

  Future<List<CategoryModel>> getAll() async {
    List<CategoryModel> listCategories = [];
    Response response = await dio.get(
      '/categories',
    );
    dynamic list = response.data["list_categories"];
    for (dynamic category in list) {
      final categoryModel = CategoryModel.fromJson(category);
      listCategories.add(categoryModel);
    }
    return listCategories;
  }
}
