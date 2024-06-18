import 'package:bloc/bloc.dart';
import 'package:bpbm_technician/common/dialogs/loading_screen.dart';
import 'package:bpbm_technician/data/models/orders/detail_order.dart';
import 'package:bpbm_technician/data/repo/fetch_orders_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc() : super(OrderDetailInitial()) {
    on<OrderDetailEvent>((event, emit) async {
      if (event is OrderDetailStarted) {
        LoadingScreen.instance().show(
          context: event.context,
          text: 'در حال بارگذاری',
        );
        await fetchOrdersRepository
            .fetchOrderDetails(id: event.orderId)
            .then((orderDetails) {
          LoadingScreen.instance().hide();
          emit(OrderDetailSuccess(orderDetails: orderDetails));
        }).catchError((e) {
          LoadingScreen.instance().hide();
          print(e.toString());
          emit(OrderDetailFailed(message: 'خطا در بارگذاری اطلاعات'));
        });
      }
    });
  }
}
