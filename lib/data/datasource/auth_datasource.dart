import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/auth_manager.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

abstract class IAuthRemoteDataSorce {
  Future<void> register(
    String userName,
    String password,
    String confirmePassword,
  );
  Future<String> login(
    String userName,
    String password,
  );
}

class AuthremoteDataSource extends IAuthRemoteDataSorce {
  final Dio httpClient = locator.get();
  @override
  Future<void> register(
      String userName, String password, String confirmePassword) async {
    try {
      Response response = await httpClient.post(
        'users/records',
        data: {
          'username': userName,
          'password': password,
          'passwordConfirm': confirmePassword,
          'name': userName,
        },
      );
      if (response.statusCode == 200) {
        login(
          userName,
          password,
        );
      }
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
        response: ex.response,
      );
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

  // login
  @override
  Future<String> login(String userName, String password) async {
    try {
      Response response = await httpClient.post(
        'users/auth-with-password',
        data: {
          'identity': userName,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        AuthManager.saveId(response.data?['record']['id']);
        AuthManager.saveToken(response.data?['token']);
        return response.data?['token'];
      }
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
    return '';
  }
}
