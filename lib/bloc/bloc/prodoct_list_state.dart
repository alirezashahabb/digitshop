part of 'prodoct_list_bloc.dart';

@immutable
sealed class ProdoctListState {}

final class ProdoctListInitialState extends ProdoctListState {}

final class ProdoctListSucessState extends ProdoctListState {
  final Either<String, List<ProductModel>> productList;

  ProdoctListSucessState({
    required this.productList,
  });
}

final class ProdoctListLoadingState extends ProdoctListState {}
