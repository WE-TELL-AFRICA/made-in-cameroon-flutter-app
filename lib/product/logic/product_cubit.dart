import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:madeincameroon/product/logic/product_state.dart';
import '../../shared/utils/Utils.dart';
import '../data/model/product.dart';
import '../data/repository/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepository productRepository;

  List<Product> allProducts = [];

  ProductCubit({required this.productRepository})
      : super(
          ProductInitial(),
        );

  getProducts({required int index}) async {
    emit(const ProductLoading());
    try {
      int? number;

      await productRepository
          .getPaginateProduct(numberNextPage: index)
          .then((response) {
        allProducts.addAll(response.productList);
        number = response.numberNextPage;
      });
      emit(
        ProductSuccess(listProducts: allProducts, numberNextPage: number),
      );
    } catch (e) {
      emit(
        ProductFailure(message: Utils.extracMessage(e)),
      );
    }
  }
}
