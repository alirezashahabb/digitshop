import 'package:apple_shop/data/datasource/auth_datasource.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

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
      await authremoteDataSource.login(
        userName,
        password,
      );
      return right('شما با موفقیت وارد شدید');
    } on ApiException catch (e) {
      return left(e.message ?? 'خطایی رخ داده هست');
    }
  }
}
