import 'package:apple_shop/data/repository/banner_repositroy.dart';
import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepositroy homeRepositroy = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        emit(HomeLoadingState());
        var res = await homeRepositroy.getBanner();
        emit(HomeSuccesState(banner: res));
      }
    });
  }
}
