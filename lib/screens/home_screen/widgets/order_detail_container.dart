import 'package:bpbm_technician/blocs/order_detail_bloc/order_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/order_detail_button.dart';

class OrderDetailContainer extends StatelessWidget {
  final int orderId;
  const OrderDetailContainer({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrderDetailBloc>(context)
        .add(OrderDetailStarted(orderId: orderId, context: context));
    return BlocBuilder<OrderDetailBloc, OrderDetailState>(
      builder: (context, state) {
        if (state is OrderDetailSuccess) {
          final orderDetails = state.orderDetails;
          return OrderDetailButton(orderDetails: orderDetails);
        } else if (state is OrderFailed) {
          return const Center(
            child: Text('خطا در بارگذاری اطلاعات'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
