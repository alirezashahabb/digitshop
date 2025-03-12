part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentLoadingState extends CommentState {}

final class CommentSuccesState extends CommentState {
  final Either<String, List<CommentModel>> comment;

  CommentSuccesState({required this.comment});
}
