part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

class CartSucessState extends CartState {
  final Either<String, List<CartItemModel>> cartItem;

  CartSucessState({
    required this.cartItem,
  });
}
