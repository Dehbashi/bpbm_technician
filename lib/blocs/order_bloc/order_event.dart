part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderStarted extends OrderEvent {}

// class OrderDetailStarted extends OrderEvent {
//   final int orderId;

//   OrderDetailStarted({required this.orderId});

//   @override
//   List<Object> get props => [orderId];
// }
