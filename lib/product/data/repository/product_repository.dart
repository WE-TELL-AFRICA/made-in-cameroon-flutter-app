import 'dart:io';

import 'package:dio/dio.dart';
import 'package:madeincameroon/product/data/model/product.dart';

class ProductRepository {
  late final Dio dio;

  ProductRepository({required this.dio});

  Future<CustomResponseData> getPaginateProduct(
      {required int numberNextPage}) async {
    List<Product> listProducts = [];
    var getPage = "";
    getPage = "?page=$numberNextPage";

    Response response = await dio.get(
      '/products$getPage',
    );
    String? nextPageUrl = response.data["list_products"]["next_page_url"];
    int? nextPageNumber;
    if (nextPageUrl != null) {
      nextPageNumber = int.parse(nextPageUrl.split("=")[1]);
    }
    dynamic list = response.data["list_products"]["data"];
    for (dynamic product in list) {
      final productValue = Product.fromJson(product);
      listProducts.add(productValue);
    }
    return CustomResponseData(listProducts, nextPageNumber);
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required int categoryId,
    required bool isApprove,
    required String information,
    required File fileImage,
  }) async {
    Response response = await dio.post('/products', data: {
      'name': name,
      'description': description,
      'category_id': categoryId,
      'is_approve': isApprove,
      'information': information,
      'image[]': fileImage,
    });
  }
}

class CustomResponseData {
  List<Product>
      productList; // Remplace Product par ton propre modèle de données
  int? numberNextPage;

  CustomResponseData(this.productList, this.numberNextPage);
}
