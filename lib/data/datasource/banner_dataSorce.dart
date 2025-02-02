import 'package:apple_shop/model/banner_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

abstract class IBannerDataSorce {
  Future<List<BannerModel>> getBanner();
}

class BannerRemoteDataSorce implements IBannerDataSorce {
  final Dio httpClinet = locator.get();
  @override
  Future<List<BannerModel>> getBanner() async {
    try {
      Response response = await httpClinet.get('banner/records');
      return response.data['items']
          .map<BannerModel>(
            (json) => BannerModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }
}
