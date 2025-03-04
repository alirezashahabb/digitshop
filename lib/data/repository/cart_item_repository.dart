import 'package:apple_shop/data/datasource/cart_item_dataSource.dart';
import 'package:apple_shop/model/cart_item_model.dart';
import 'package:apple_shop/utils/api_exception.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:dartz/dartz.dart';

abstract class ICartItemRepositroy {
  Future<Either<String, String>> addCartItem(CartItemModel cartItem);
  Future<Either<String, List<CartItemModel>>> getCartItem();
  Future<int> getBasketFinalPrice();
}

class CartItemRepository implements ICartItemRepositroy {
  final ICartItemeDataSorce cartItemeDataSorce = locator.get();
  @override
  Future<Either<String, String>> addCartItem(CartItemModel cartItem) async {
    try {
      await cartItemeDataSorce.addCartItem(cartItem);
      return Right('محصول با موفقیت به سبد خرید اضافه شد');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<Either<String, List<CartItemModel>>> getCartItem() async {
    try {
      var cartItem = await cartItemeDataSorce.cartItemList();
      return Right(cartItem);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده هست');
    }
  }

  @override
  Future<int> getBasketFinalPrice() async {
    return cartItemeDataSorce.getBasketFinalPrice();
  }
}
