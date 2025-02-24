part of 'prodoct_list_bloc.dart';

@immutable
sealed class ProdoctListEvent {}

class ProductListInitEvent extends ProdoctListEvent {
  final String categortId;

  ProductListInitEvent({
    required this.categortId,
  });
}
