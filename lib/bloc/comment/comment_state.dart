part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentLoadingState extends CommentState {}

final class CommentSuccesState extends CommentState {
  final Either<String, List<CommentModel>> comment;

  CommentSuccesState({required this.comment});
}

// post Comment

final class CommentPostLoadingState extends CommentState {
  final bool isLoading;

  CommentPostLoadingState(this.isLoading);
}

final class CommentPostSucces extends CommentState {
  final Either<String, String> comment;

  CommentPostSucces({required this.comment});
}
