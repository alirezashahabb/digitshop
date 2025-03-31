import 'package:apple_shop/data/datasource/auth_datasource.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/auth_manager.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepositroy {
  Future<Either<String, String>> register(
    String userName,
    String password,
    String confirmePassword,
  );
  Future<Either<String, String>> login(
    String userName,
    String password,
  );
}

class AuthRepositroy extends IAuthRepositroy {
  final IAuthRemoteDataSorce authremoteDataSource = locator.get();
  final SharedPreferences sharedPreferences = locator.get();

  @override
  Future<Either<String, String>> register(
    String userName,
    String password,
    String confirmePassword,
  ) async {
    try {
      await authremoteDataSource.register(
        userName,
        password,
        confirmePassword,
      );
      return right('ثبت نام انجام شد');
    } on ApiException catch (e) {
      return left(e.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, String>> login(String userName, String password) async {
    try {
      String token = await authremoteDataSource.login(
        userName,
        password,
      );
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('به اپل شاپ خوش آمدید');
      } else {
        return left('در ورود خطایی رخ داده هست');
      }
    } on ApiException catch (e) {
      return left(e.message ?? 'خطایی رخ داده هست');
    }
  }
}
