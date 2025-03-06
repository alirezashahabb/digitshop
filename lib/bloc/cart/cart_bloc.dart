import 'package:apple_shop/data/repository/cart_item_repository.dart';
import 'package:apple_shop/model/cart_item_model.dart';
import 'package:apple_shop/utils/payment_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartItemRepositroy cartItem;
  final PaymentHandler _paymentHandler;
  CartBloc(this._paymentHandler, this.cartItem) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      if (event is CartInitEvent) {
        emit(
          (CartLoadingState()),
        );
        var respose = await cartItem.getCartItem();
        var finalPrice = await cartItem.getBasketFinalPrice();
        emit(
          CartSucessState(
            cartItem: respose,
            finalPrice: finalPrice,
          ),
        );
      }
      if (event is BasketPaymentInitEvent) {
        _paymentHandler.initPaymentRequest(12000);
      }
      if (event is BasketPaymentRequestEvent) {
        _paymentHandler.sendPaymentRequest();
      }
    });
  }
}
