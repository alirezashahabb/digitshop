import 'package:apple_shop/data/repository/comment_reppositroy.dart';
import 'package:apple_shop/model/comment_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ICommentRepositroy repositroy;
  CommentBloc(this.repositroy) : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {
      if (event is CommentInitEvent) {
        emit(CommentLoadingState());
        var comment = await repositroy.getComment(event.productId);

        emit(CommentSuccesState(comment: comment));
      }
      if (event is CommentPostEvent) {
        emit(CommentPostLoadingState(true));
        var commentPost =
            await repositroy.postComment(event.comment, event.productId);
        emit(CommentPostLoadingState(false));
        emit(CommentPostSucces(comment: commentPost));
      }
    });
  }
}
