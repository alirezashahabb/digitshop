part of 'productsingle_bloc.dart';

@immutable
sealed class ProductsingleState {}

final class ProductsingleInitialState extends ProductsingleState {}

final class ProductSingleLoadingStateate extends ProductsingleState {}

final class ProductSingleSuceesStateate extends ProductsingleState {
  final Either<String, List<GalleryModel>> gallary;
  final Either<String, List<ProductVaraintModel>> productVaraint;
  final Either<String, List<PropertisModel>> propertis;
  final Either<String, CategoryItemsModel> category;

  ProductSingleSuceesStateate({
    required this.gallary,
    required this.productVaraint,
    required this.category,
    required this.propertis,
  });
}
