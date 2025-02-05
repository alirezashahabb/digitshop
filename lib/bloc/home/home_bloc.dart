import 'package:apple_shop/data/repository/banner_repositroy.dart';
import 'package:apple_shop/data/repository/category_repositroy.dart';
import 'package:apple_shop/data/repository/prodoct_repositroy.dart';
import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/model/product_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepositroy homeRepositroy = locator.get();
  final IcategoryRepositroy categoryRepositroy = locator.get();
  final IProductRepositroy productRepositroy = locator.get();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        emit(HomeLoadingState());
        var banner = await homeRepositroy.getBanner();
        var category = await categoryRepositroy.getCategory();
        var hottestProduct = await productRepositroy.getHotesstProduct();
        var bsetSellerProducts = await productRepositroy.getBasetSeller();
        emit(
          HomeSuccesState(
            banner: banner,
            category: category,
            hottestProduct: hottestProduct,
            bsetSellerProducts: bsetSellerProducts,
          ),
        );
      }
    });
  }
}
