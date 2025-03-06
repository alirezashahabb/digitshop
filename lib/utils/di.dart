import 'package:apple_shop/bloc/cart/cart_bloc.dart';
import 'package:apple_shop/data/datasource/auth_datasource.dart';
import 'package:apple_shop/data/datasource/banner_dataSorce.dart';
import 'package:apple_shop/data/datasource/cart_item_dataSource.dart';
import 'package:apple_shop/data/datasource/category_datasource.dart';
import 'package:apple_shop/data/datasource/product_datasource.dart';
import 'package:apple_shop/data/datasource/single_product_dataSource.dart';
import 'package:apple_shop/data/repository/auth_repositroy.dart';
import 'package:apple_shop/data/repository/banner_repositroy.dart';
import 'package:apple_shop/data/repository/cart_item_repository.dart';
import 'package:apple_shop/data/repository/category_repositroy.dart';
import 'package:apple_shop/data/repository/prodoct_repositroy.dart';
import 'package:apple_shop/data/repository/singleProduct_repositroy.dart';
import 'package:apple_shop/utils/payment_handler.dart';
import 'package:apple_shop/utils/url_handler.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //utils
  locator.registerSingleton<UrlHandler>(UrlLauncher());
  locator.registerSingleton<PaymentHandler>(ZarinpalPaymentHandler(
    locator.get(),
  ));

  //Conponents
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: 'https://startflutter.ir/api/collections/'),
  ));
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  // dataSorce
  locator.registerFactory<IAuthRemoteDataSorce>(
    () => AuthremoteDataSource(),
  );
  locator.registerFactory<ICategoryDataSource>(
    () => CategoryRemoteDataSorce(),
  );
  locator.registerFactory<IBannerDataSorce>(
    () => BannerRemoteDataSorce(),
  );
  locator.registerFactory<IProductDataSource>(
    () => ProductRemoteDataSource(),
  );
  locator.registerFactory<ISingleProductDataSource>(
    () => SingleProductRemoteDataSourc(),
  );
  locator.registerFactory<ICartItemeDataSorce>(
    () => CartItemLocalDataSource(),
  );

  //Repositroy
  locator.registerFactory<IAuthRepositroy>(
    () => AuthRepositroy(),
  );
  locator.registerFactory<IcategoryRepositroy>(
    () => CategoryRepositroy(),
  );
  locator.registerFactory<IBannerRepositroy>(
    () => BannerRipositroy(),
  );
  locator.registerFactory<IProductRepositroy>(
    () => ProductRepositroy(),
  );
  locator.registerFactory<ISingleProductRepositroy>(
    () => SingleProductRepositroy(),
  );
  locator.registerFactory<ICartItemRepositroy>(
    () => CartItemRepository(),
  );

  // bloc
  locator.registerSingleton<CartBloc>(
    CartBloc(locator.get(), locator.get()),
  );
}
