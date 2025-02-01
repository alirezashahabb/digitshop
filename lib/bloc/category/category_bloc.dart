import 'package:apple_shop/data/repository/category_repositroy.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final IcategoryRepositroy repositroy = locator.get();
  CategoryBloc()
      : super(
          CategoryLoadingState(),
        ) {
    on<CategoryEvent>((event, emit) async {
      if (event is CategoryInitEvent) {
        emit(CategoryLoadingState());
        var response = await repositroy.getCategory();
        emit(CategoryRepoanseState(items: response));
      }
    });
  }
}
