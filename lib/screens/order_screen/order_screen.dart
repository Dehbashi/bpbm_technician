import 'package:flutter/material.dart';
import 'package:bpbm_technician/screens/order_screen/widgets/order_info.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20,0,0),
      child: Column(
        children: [
          Text(
            'سفارش های انجام شده',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(child: OrderInfo()),
        ],
      ),
    );
  }
}
