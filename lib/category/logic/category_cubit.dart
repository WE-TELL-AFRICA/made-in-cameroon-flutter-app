import 'package:bloc/bloc.dart';
import 'package:madeincameroon/category/logic/category_state.dart';
import '../../shared/utils/Utils.dart';
import '../data/repository/category_repository.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit({required this.categoryRepository})
      : super(
          CategoryState(),
        );

  getCategories() async {
    emit(
      state.copyWith(
        isLoadingCategory: true,
        successLoadingCategory: false,
        errorLoadingCategory: false,
      ),
    );

    try {
      var categories = await categoryRepository.getAll();

      emit(
        state.copyWith(
          categories: categories,
          isLoadingCategory: false,
          successLoadingCategory: true,
          errorLoadingCategory: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingCategory: false,
          successLoadingCategory: false,
          errorLoadingCategory: true,
          message: Utils.extracMessage(e),
        ),
      );
    }
  }
}
