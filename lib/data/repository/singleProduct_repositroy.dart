import 'package:apple_shop/data/datasource/single_product_dataSource.dart';
import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/model/gallery_model.dart';
import 'package:apple_shop/model/product_varaint_model.dart';
import 'package:apple_shop/model/propertis_model.dart';
import 'package:apple_shop/model/varaint_type_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

import '../../utils/api_exception.dart';

abstract class ISingleProductRepositroy {
  Future<Either<String, List<GalleryModel>>> getGalley(String id);
  Future<Either<String, List<VaraintTypeModel>>> getvatiantType();

  Future<Either<String, List<ProductVaraintModel>>> getProdductVaraintModel(
      String prodoctId);
  Future<Either<String, List<PropertisModel>>> getPropertis(String prodoctId);
  Future<Either<String, CategoryItemsModel>> getCategory(String categoryId);
}

class SingleProductRepositroy extends ISingleProductRepositroy {
  final ISingleProductDataSource dataSource = locator.get();
  @override
  Future<Either<String, List<GalleryModel>>> getGalley(String id) async {
    try {
      var response = await dataSource.getGallaey(id);
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, List<VaraintTypeModel>>> getvatiantType() async {
    try {
      var response = await dataSource.getvaraintType();
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, List<ProductVaraintModel>>> getProdductVaraintModel(
      String prodoctId) async {
    try {
      var response = await dataSource.prodoctvaraints(prodoctId);
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, CategoryItemsModel>> getCategory(
      String categoryId) async {
    try {
      var response = await dataSource.getCategory(
        categoryId,
      );
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, List<PropertisModel>>> getPropertis(
      String prodoctId) async {
    try {
      var response = await dataSource.getPropertis(prodoctId);
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }
}
