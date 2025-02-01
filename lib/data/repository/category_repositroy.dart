import 'package:apple_shop/data/datasource/category_datasource.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

abstract class IcategoryRepositroy {
  Future<Either<String, List<CategoryItemsModel>>> getCategory();
}

class CategoryRepositroy extends IcategoryRepositroy {
  final ICategoryDataSource dataSource = locator.get();
  @override
  Future<Either<String, List<CategoryItemsModel>>> getCategory() async {
    try {
      var response = await dataSource.getCategory();
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }
}
