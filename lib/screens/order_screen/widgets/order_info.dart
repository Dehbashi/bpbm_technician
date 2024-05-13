import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/orders_container.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return CupertinoActivityIndicator();
        } else if (state is OrderEmpty) {
          return Center(
            child: Text('سفارشی وجود ندارد'),
          );
        } else if (state is OrderSuccess) {
          final orders = state.orders;
          final listOfOrderDetails = state.orderDetails;
          return Container(
            margin: EdgeInsets.all(10),
            // height: 400,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final indexFromLast = orders.length - index - 1;
                final order = orders[indexFromLast];
                final orderDetails = listOfOrderDetails[indexFromLast];
                final status = orderDetails.orderStatus;
                if (
                    // status == 3 ||
                    // status == 4 ||
                    // status == 6 ||
                    // status == 7 ||
                    status == 8 ||
                        // status == 9 ||
                        // status == 1 ||
                        status == 2) {
                  return OrdersContainer(
                    order: order,
                    orderDetails: orderDetails,
                  );
                } else {
                  return Container();
                }
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
