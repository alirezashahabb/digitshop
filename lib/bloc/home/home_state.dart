part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccesState extends HomeState {
  final Either<String, List<BannerModel>> banner;
  final Either<String, List<CategoryItemsModel>> category;
  final Either<String, List<ProductModel>> hottestProduct;
  final Either<String, List<ProductModel>> bsetSellerProducts;

  HomeSuccesState({
    required this.banner,
    required this.category,
    required this.hottestProduct,
    required this.bsetSellerProducts,
  });
}
