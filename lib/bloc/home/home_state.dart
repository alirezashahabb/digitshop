part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccesState extends HomeState {
  final Either<String, List<BannerModel>> banner;

  HomeSuccesState({required this.banner});
}
