import 'package:apple_shop/data/datasource/auth_datasource.dart';
import 'package:apple_shop/data/repository/auth_repositroy.dart';
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

  //Repositroy
  locator.registerFactory<IAuthRepositroy>(
    () => AuthRepositroy(),
  );
}
