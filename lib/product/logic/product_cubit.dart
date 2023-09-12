import 'package:bloc/bloc.dart';
import 'package:madeincameroon/product/logic/product_state.dart';
import '../../shared/utils/Utils.dart';
import '../data/repository/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepository productRepository;
  int? numberNextPage;

  ProductCubit({required this.productRepository, this.numberNextPage})
      : super(
          const ProductState(),
        );

  getProducts() async {
    emit(const ProductLoading());
    try {
      var products;
      int? number;

      if (numberNextPage != null) {
        await productRepository
            .getPaginateProduct(numberNextPage: numberNextPage)
            .then((response) {
          products = response.productList;
          number = response.numberNextPage;
        });
      } else {
        await productRepository
            .getPaginateProduct(numberNextPage: numberNextPage)
            .then((response) {
          products = response.productList;
          number = response.numberNextPage;
        });
      }
      emit(
        ProductSuccess(listProducts: products, numberNextPage: number),
      );
    } catch (e) {
      String? message = Utils.extracMessage(e);
      print("message : $message");
      emit(
        ProductFailure(message: message),
      );
    }
  }
}
