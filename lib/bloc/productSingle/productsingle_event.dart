part of 'productsingle_bloc.dart';

@immutable
sealed class ProductsingleEvent {}

class ProductSingleInitEvent extends ProductsingleEvent {
  final String id;
  final String categryId;

  ProductSingleInitEvent({
    required this.id,
    required this.categryId,
  });
}
