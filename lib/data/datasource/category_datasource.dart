import 'package:apple_shop/model/category_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDataSource {
  Future<List<CategoryItemsModel>> getCategory();
}

class CategoryRemoteDataSorce implements ICategoryDataSource {
  final Dio httpClinet = locator.get();
  @override
  Future<List<CategoryItemsModel>> getCategory() async {
    try {
      Response response = await httpClinet.get('category/records');
      return response.data['items']
          .map<CategoryItemsModel>(
            (json) => CategoryItemsModel.fromJson(json),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'خطا نا مشخص');
    }
  }
}
