part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategoryRepoanseState extends CategoryState {
  final Either<String, List<CategoryItemsModel>> items;

  CategoryRepoanseState({required this.items});
}
