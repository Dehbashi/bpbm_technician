part of 'order_detail_bloc.dart';

sealed class OrderDetailState extends Equatable {
  const OrderDetailState();

  @override
  List<Object> get props => [];
}

final class OrderDetailInitial extends OrderDetailState {}

class OrderDetailSuccess extends OrderDetailState {
  final OrderDetails orderDetails;

  OrderDetailSuccess({required this.orderDetails});

  @override
  List<Object> get props => [orderDetails];
}

class OrderDetailFailed extends OrderDetailState {
  final String message;

  OrderDetailFailed({required this.message});

  @override
  List<Object> get props => [message];
}
