import 'package:apple_shop/model/cart_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICartItemeDataSorce {
  Future<void> addCartItem(CartItemModel cartItem);
  Future<List<CartItemModel>> cartItemList();
}

class CartItemLocalDataSource implements ICartItemeDataSorce {
  var box = Hive.box<CartItemModel>('cartItem');
  @override
  Future<void> addCartItem(CartItemModel cartItem) async {
    await box.add(
      cartItem,
    );
  }

  @override
  Future<List<CartItemModel>> cartItemList() async {
    return box.values.toList();
  }
}
