part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentInitEvent extends CommentEvent {
  final String productId;

  CommentInitEvent({required this.productId});
}

class CommentPostEvent extends CommentEvent {
  final String comment;
  final String productId;

  CommentPostEvent({
    required this.comment,
    required this.productId,
  });
}
