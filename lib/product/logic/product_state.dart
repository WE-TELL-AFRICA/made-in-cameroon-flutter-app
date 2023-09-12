import 'package:flutter/cupertino.dart';
import '../data/model/product.dart';

@immutable
class ProductState {
  final List<Product>? listProducts;
  final String? message;
  final int? numberNextPage;

  const ProductState({this.listProducts, this.message, this.numberNextPage});
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {
  const ProductLoading({List<Product>? listProducts}) : super(listProducts: listProducts);
}

class ProductSuccess extends ProductState {
  const ProductSuccess({List<Product>? listProducts, int? numberNextPage}) : super(listProducts: listProducts, numberNextPage: numberNextPage);
}

class ProductFailure extends ProductState {
  const ProductFailure({List<Product>? listProducts, String? message})
      : super(listProducts: listProducts, message: message);
}
