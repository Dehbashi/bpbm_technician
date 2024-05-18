part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

class CommentSuccess extends CommentState {
  final List<CommentModel> comments;

  const CommentSuccess({required this.comments});

  @override
  List<Object> get props => [comments];
}

class CommentEmpty extends CommentState {}

class CommentFailed extends CommentState {}
