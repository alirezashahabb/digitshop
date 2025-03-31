import 'package:apple_shop/model/comment_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/auth_manager.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

abstract class ICommentDataSource {
  Future<List<CommentModel>> getComment(String productId);
  Future<void> postComment(String productId, String comment);
}

class CommentRemoteDataSource extends ICommentDataSource {
  final Dio httpClinet = locator.get();
  final String userId = AuthManager.getId();
  @override
  Future<List<CommentModel>> getComment(String productId) async {
    try {
      Response response =
          await httpClinet.get('comment/records', queryParameters: {
        "filter": 'product_id="$productId"',
        "expand": "user_id",
        'perPage': 100,
      });

      return response.data['items']
          .map<CommentModel>(
            (json) => CommentModel.fromMapJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

  @override
  Future<void> postComment(String productId, String comment) async {
    try {
      await httpClinet.post('comment/records', data: {
        'text': productId,
        'user_id': userId,
        'product_id': comment,
      });
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
