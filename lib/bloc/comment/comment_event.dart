part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentInitEvent extends CommentEvent {
  final String productId;

  CommentInitEvent({required this.productId});
}
