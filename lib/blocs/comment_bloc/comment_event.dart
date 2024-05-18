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

class SendComment extends CommentEvent {
  final int orderId;
  final String text;

  const SendComment({
    required this.orderId,
    required this.text,
  });

  @override
  List<Object> get props => [
        orderId,
        text,
      ];
}
