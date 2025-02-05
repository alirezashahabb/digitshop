import 'package:apple_shop/data/datasource/product_datasource.dart';
import 'package:apple_shop/model/product_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepositroy {
  Future<Either<String, List<ProductModel>>> getHotesstProduct();
  Future<Either<String, List<ProductModel>>> getBasetSeller();
}

class ProductRepositroy extends IProductRepositroy {
  final IProductDataSource dataSource = locator.get();
  @override
  Future<Either<String, List<ProductModel>>> getHotesstProduct() async {
    try {
      var response = await dataSource.getHotesstProduct();
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getBasetSeller() async {
    try {
      var response = await dataSource.getBestSellerProduct();
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }
}
