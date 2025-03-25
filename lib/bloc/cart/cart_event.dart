part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitEvent extends CartEvent {}

final class BasketPaymentInitEvent extends CartEvent {}

final class BasketPaymentRequestEvent extends CartEvent {}

final class BasketRemoveEvent extends CartEvent {
  final int index;

  BasketRemoveEvent({required this.index});
}
