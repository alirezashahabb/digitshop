part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

class CartSucessState extends CartState {
  final Either<String, List<CartItemModel>> cartItem;
  final int finalPrice;

  CartSucessState({
    required this.cartItem,
    required this.finalPrice,
  });
}
