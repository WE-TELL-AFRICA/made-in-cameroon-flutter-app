import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:madeincameroon/category/data/repositories/category_repository.dart';
import 'package:madeincameroon/category/logic/category_cubit.dart';
import 'package:madeincameroon/shared/data/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    ),
  );
}
