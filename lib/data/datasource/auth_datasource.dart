import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

class AuthremoteDataSource {
  final Dio httpClient = locator.get();
  Future<void> register(
      String userName, String password, String confirmePassword) async {
    try {
      await httpClient.post(
        'users/records',
        data: {
          'username': userName,
          'password': password,
          'passwordConfirm': confirmePassword,
        },
      );
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex);
    }
  }
}
