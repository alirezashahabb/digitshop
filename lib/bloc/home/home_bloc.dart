import 'package:apple_shop/data/repository/banner_repositroy.dart';
import 'package:apple_shop/data/repository/category_repositroy.dart';
import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepositroy homeRepositroy = locator.get();
  final IcategoryRepositroy categoryRepositroy = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        emit(HomeLoadingState());
        var banner = await homeRepositroy.getBanner();
        var category = await categoryRepositroy.getCategory();
        emit(
          HomeSuccesState(banner: banner, category: category),
        );
      }
    });
  }
}
