import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/model/gallery_model.dart';
import 'package:apple_shop/model/product_varaint_model.dart';
import 'package:apple_shop/model/propertis_model.dart';
import 'package:apple_shop/model/varaint_type_model.dart';
import 'package:apple_shop/model/varaints_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

abstract class ISingleProductDataSource {
  Future<List<GalleryModel>> getGallaey(String productId);
  Future<List<VaraintTypeModel>> getvaraintType();
  Future<List<VaraintsModel>> getvaraints(String prodoctId);
  Future<List<ProductVaraintModel>> prodoctvaraints(String prodoctId);
  Future<CategoryItemsModel> getCategory(String categoryId);
  Future<List<PropertisModel>> getPropertis(String prodoctId);
}

class SingleProductRemoteDataSourc extends ISingleProductDataSource {
  final Dio httpClinet = locator.get();
  @override
  Future<List<GalleryModel>> getGallaey(String productId) async {
    try {
      Response response = await httpClinet.get('gallery/records',
          queryParameters: {"filter": "product_id=\"$productId\""});
      return response.data['items']
          .map<GalleryModel>(
            (json) => GalleryModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

//===========================================================VaraintTypeDataSource
  @override
  Future<List<VaraintTypeModel>> getvaraintType() async {
    try {
      Response response = await httpClinet.get(
        'variants_type/records',
      );
      return response.data['items']
          .map<VaraintTypeModel>(
            (json) => VaraintTypeModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

//===========================================================VaraintDataSource
  @override
  Future<List<VaraintsModel>> getvaraints(String prodoctId) async {
    try {
      Response response = await httpClinet.get(
        'variants/records',
        queryParameters: {"filter": "product_id=\"$prodoctId\""},
      );
      return response.data['items']
          .map<VaraintsModel>(
            (json) => VaraintsModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

  @override
  Future<List<ProductVaraintModel>> prodoctvaraints(String prodoctId) async {
    var variantTypeList = await getvaraintType();
    var variantList = await getvaraints(prodoctId);

    List<ProductVaraintModel> productVariantList = [];

    try {
      for (var variantType in variantTypeList) {
        var variant = variantList
            .where((element) => element.typeId == variantType.id)
            .toList();
        productVariantList.add(ProductVaraintModel(
          varaintTypeModel: variantType,
          varaints: variant,
        ));
      }

      return productVariantList;
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<CategoryItemsModel> getCategory(String categoryId) async {
    try {
      Response response = await httpClinet.get(
        'category/records',
        queryParameters: {"filter": "id=\"$categoryId\""},
      );
      // beacause get one Categoryprodocts Name
      return CategoryItemsModel.fromJson(response.data['items'][0]);
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }

  @override
  Future<List<PropertisModel>> getPropertis(String prodoctId) async {
    try {
      Response response = await httpClinet.get(
        'properties/records',
        queryParameters: {"filter": "product_id=\"$prodoctId\""},
      );

      return response.data['items']
          .map<PropertisModel>(
            (json) => PropertisModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }
}
