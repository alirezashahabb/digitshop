import 'package:apple_shop/data/repository/cart_item_repository.dart';
import 'package:apple_shop/model/cart_item_model.dart';
import 'package:apple_shop/utils/di.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartItemRepositroy cartItem = locator.get();
  CartBloc() : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      if (event is CartInitEvent) {
        emit(
          (CartLoadingState()),
        );
        var respose = await cartItem.getCartItem();
        emit(CartSucessState(cartItem: respose));
      }
    });
  }
}
