import 'package:apple_shop/data/datasource/auth_datasource.dart';
import 'package:apple_shop/data/datasource/banner_dataSorce.dart';
import 'package:apple_shop/data/datasource/category_datasource.dart';
import 'package:apple_shop/data/datasource/product_datasource.dart';
import 'package:apple_shop/data/repository/auth_repositroy.dart';
import 'package:apple_shop/data/repository/banner_repositroy.dart';
import 'package:apple_shop/data/repository/category_repositroy.dart';
import 'package:apple_shop/data/repository/prodoct_repositroy.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //Conponents
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: 'https://startflutter.ir/api/collections/'),
  ));
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  // dataSporce
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
}
