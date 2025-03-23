import 'package:apple_shop/data/datasource/comment_data_source.dart';
import 'package:apple_shop/model/comment_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

abstract class ICommentRepositroy {
  Future<Either<String, List<CommentModel>>> getComment(String productId);
  Future<Either<String, String>> postComment(String productId, String comment);
}

class CommentRepositroy extends ICommentRepositroy {
  final ICommentDataSource dataSource = locator.get();
  @override
  Future<Either<String, List<CommentModel>>> getComment(
      String productId) async {
    try {
      var response = await dataSource.getComment(productId);
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, String>> postComment(
      String productId, String comment) async {
    try {
      await dataSource.postComment(productId, comment);
      return right('نظر شما اضافه شد');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
