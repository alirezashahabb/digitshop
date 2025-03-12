import 'package:apple_shop/model/comment_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

abstract class ICommentDataSource {
  Future<List<CommentModel>> getComment(String productId);
}

class CommentRemoteDataSource extends ICommentDataSource {
  final Dio httpClinet = locator.get();
  @override
  Future<List<CommentModel>> getComment(String productId) async {
    try {
      Response response = await httpClinet.get('comment/records',
          queryParameters: {"filter": "product_id =\"$productId\""});

      return response.data['items']
          .map<CommentModel>(
            (json) => CommentModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }
}
