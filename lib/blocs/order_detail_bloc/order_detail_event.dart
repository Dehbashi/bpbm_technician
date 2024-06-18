part of 'order_detail_bloc.dart';

sealed class OrderDetailEvent extends Equatable {
  const OrderDetailEvent();

  @override
  List<Object> get props => [];
}

class OrderDetailStarted extends OrderDetailEvent {
  final int orderId;
  final BuildContext context;

  OrderDetailStarted({
    required this.orderId,
    required this.context,
  });

  @override
  List<Object> get props => [orderId, context];
}
