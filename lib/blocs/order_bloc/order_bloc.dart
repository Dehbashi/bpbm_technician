import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
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
          await fetchOrdersRepository.fetchOrders().then((orders) async {
            if (orders.isNotEmpty) {
              List<Order> activeOrders = [];
              for (var order in orders) {
                // if (order.order_status == 3 ||
                //     order.order_status == 4 ||
                //     order.order_status == 6 ||
                //     order.order_status == 7) {
                activeOrders.add(order);
                // }
              }
              if (activeOrders.isNotEmpty) {
                emit(OrderSuccess(
                  orders: activeOrders,
                ));
              } else {
                emit(OrderEmpty(message: 'سفارشی وجود ندارد'));
              }
            } else {
              emit(OrderEmpty(message: 'سفارشی وجود ندارد'));
            }
          }).catchError((e) {
            print(e.toString);
            emit(OrderFailed(message: 'خطا در دریافت اطلاعات'));
          });
        } else {
          emit(OrderFailed(message: 'اتصال اینترنت برقرار نمی باشد'));
        }
      }

      // if (event is OrderDetailStarted) {
      //   emit(OrderLoading());
      //   await fetchOrdersRepository
      //       .fetchOrderDetails(id: event.orderId)
      //       .then((orderDetails) {
      //     emit(OrderDetailSuccess(orderDetails: orderDetails));
      //   }).catchError((e) {
      //     print(e.toString());
      //     emit(OrderFailed(message: 'خطا در بارگذاری اطلاعات'));
      //   });
      // }
    });
  }
}
