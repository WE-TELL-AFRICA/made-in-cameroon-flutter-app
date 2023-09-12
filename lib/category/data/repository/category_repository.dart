import 'package:dio/dio.dart';
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
    //bout de code qui permet d'associer les catégories aux sous catégories...
    List<CategoryModel> listCategoriesParent = listCategories
        .where((value) => value.parendId == null)
        .toList();
    List<CategoryModel> listCategoriesChild = listCategories
        .where((value) => value.parendId != null)
        .toList();
    for(CategoryModel categoryModel in listCategoriesParent){
      categoryModel.listSubCategories = listCategoriesChild
          .where((value) => value.parendId == categoryModel.id)
          .toList();
    }
    return listCategoriesParent;
  }
}
