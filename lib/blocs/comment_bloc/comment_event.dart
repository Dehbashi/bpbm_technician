part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CommentStarted extends CommentEvent {
  final int orderId;

  const CommentStarted({required this.orderId});

  @override
  List<Object> get props => [orderId];
}

class SelectAttachment extends CommentEvent {}

class SendComment extends CommentEvent {
  final int orderId;
  final String text;
  final List<XFile> userAttachments;

  const SendComment({
    required this.orderId,
    required this.text,
    required this.userAttachments,
  });

  @override
  List<Object> get props => [
        orderId,
        text,
        userAttachments,
      ];
}
