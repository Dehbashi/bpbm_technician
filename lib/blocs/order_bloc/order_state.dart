part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

class OrderSuccess extends OrderState {
  final List<Order> orders;
  // final List<OrderDetails> orderDetails;

  const OrderSuccess({
    required this.orders,
    // required this.orderDetails,
  });

  @override
  List<Object> get props => [orders];
}

// class OrderDetailSuccess extends OrderState {
//   final OrderDetails orderDetails;

//   OrderDetailSuccess({required this.orderDetails});

//   @override
//   List<Object> get props => [orderDetails];
// }

class OrderFailed extends OrderState {
  final String message;

  const OrderFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class OrderEmpty extends OrderState {
  final String message;

  const OrderEmpty({required this.message});

  @override
  List<Object> get props => [message];
}

class OrderLoading extends OrderState {}
