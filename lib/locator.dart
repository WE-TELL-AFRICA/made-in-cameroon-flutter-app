import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:madeincameroon/category/logic/category_cubit.dart';
import 'package:madeincameroon/product/data/repository/product_repository.dart';
import 'package:madeincameroon/product/logic/product_cubit.dart';
import 'package:madeincameroon/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'category/data/repository/category_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingletonAsync(
    () => SharedPreferences.getInstance(),
  );
  getIt.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: '$BASE_URL/api',
    ),
  ));

  getIt.registerSingleton<CategoryRepository>(
    CategoryRepository(
      dio: getIt.get<Dio>(),
    ),
  );
  getIt.registerSingleton<CategoryCubit>(
    CategoryCubit(
      categoryRepository: getIt.get<CategoryRepository>(),
    )..getCategories(),
  );
  getIt.registerSingleton<ProductRepository>(
    ProductRepository(
      dio: getIt.get<Dio>(),
    ),
  );
  getIt.registerSingleton<ProductCubit>(
      ProductCubit(productRepository: getIt<ProductRepository>())
        ..getProducts(index: 1));
}
