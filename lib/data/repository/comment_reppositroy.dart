import 'package:apple_shop/data/datasource/comment_data_source.dart';
import 'package:apple_shop/model/comment_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

abstract class ICommentRepositroy {
  Future<Either<String, List<CommentModel>>> getComment(String productId);
}

class CommentRepositroy extends ICommentRepositroy {
  @override
  Future<Either<String, List<CommentModel>>> getComment(
      String productId) async {
    final ICommentDataSource dataSource = locator.get();
    try {
      var response = await dataSource.getComment(productId);
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }
}
