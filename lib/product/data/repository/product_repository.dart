import 'package:dio/dio.dart';
import 'package:madeincameroon/product/data/model/product.dart';

class ProductRepository {
  late final Dio dio;

  ProductRepository({required this.dio});

  Future<CustomResponseData> getPaginateProduct({int? numberNextPage}) async {
    List<Product> listProducts = [];
    var getPage = "";
    if (numberNextPage != null) {
      getPage = "?page=$numberNextPage";
    }
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
    print("listProducts : ${listProducts.map((e) => e.name.toString())}");
    return CustomResponseData(listProducts, nextPageNumber);
  }
}

class CustomResponseData {
  List<Product>
      productList; // Remplace Product par ton propre modèle de données
  int? numberNextPage;

  CustomResponseData(this.productList, this.numberNextPage);
}
