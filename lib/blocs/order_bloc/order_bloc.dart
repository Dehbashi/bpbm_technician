import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:bpbm_technician/data/models/orders/detail_order.dart';
import 'package:bpbm_technician/data/models/orders/order_model.dart';
import 'package:bpbm_technician/data/repo/fetch_orders_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      if (event is OrderStarted) {
        final result = await (Connectivity().checkConnectivity());
        if (result != ConnectivityResult.none) {
          emit(OrderLoading());
          final orders = await fetchOrdersRepository.fetchOrders();
          List<OrderDetails> listOfOrderDetails = [];
          if (orders.isNotEmpty) {
            for (var order in orders) {
              final orderDetails =
                  await fetchOrdersRepository.fetchOrderDetails(id: order.id);
              listOfOrderDetails.add(orderDetails);
            }
            emit(
                OrderSuccess(orders: orders, orderDetails: listOfOrderDetails));
          } else {
            emit(OrderEmpty(message: 'سفارشی وجود ندارد'));
          }
        } else {
          emit(OrderFailed(message: 'اتصال اینترنت برقرار نمی باشد'));
        }
      }
    });
  }
}
