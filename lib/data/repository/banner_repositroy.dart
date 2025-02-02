import 'package:apple_shop/data/datasource/banner_dataSorce.dart';
import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepositroy {
  Future<Either<String, List<BannerModel>>> getBanner();
}

class BannerRipositroy extends IBannerRepositroy {
  final IBannerDataSorce dataSource = locator.get();
  @override
  Future<Either<String, List<BannerModel>>> getBanner() async {
    try {
      var response = await dataSource.getBanner();
      return Right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }
}
