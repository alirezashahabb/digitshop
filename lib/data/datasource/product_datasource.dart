import 'package:apple_shop/model/product_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getHotesstProduct();
  Future<List<ProductModel>> getBestSellerProduct();
  Future<List<ProductModel>> getSingleProduct(String id);
}

class ProductRemoteDataSource implements IProductDataSource {
  final Dio httpClinet = locator.get();
  @override
  Future<List<ProductModel>> getHotesstProduct() async {
    try {
      Response response = await httpClinet.get('products/records',
          queryParameters: {"filter": "popularity=\"Hotest\""});
      return response.data['items']
          .map<ProductModel>(
            (json) => ProductModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

  @override
  Future<List<ProductModel>> getBestSellerProduct() async {
    try {
      Response response = await httpClinet.get('products/records',
          queryParameters: {"filter": "popularity=\"Best Seller\""});
      return response.data['items']
          .map<ProductModel>(
            (json) => ProductModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

  @override
  Future<List<ProductModel>> getSingleProduct(String id) async {
    try {
      Response response = await httpClinet
          .get('products/records', queryParameters: {"filter": "id=\"$id\""});
      return response.data['items']
          .map<ProductModel>(
            (json) => ProductModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }
}
