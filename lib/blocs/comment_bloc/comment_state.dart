part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

class CommentSuccess extends CommentState {
  final List<CommentModel> comments;
  final List<XFile> attachments;

  const CommentSuccess({
    required this.comments,
    required this.attachments,
  });

  @override
  List<Object> get props => [
        comments,
        attachments,
      ];
}

class CommentEmpty extends CommentState {}

class CommentFailed extends CommentState {}
