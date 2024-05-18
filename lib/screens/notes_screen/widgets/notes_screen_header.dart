import 'package:flutter/material.dart';
import 'package:persian/persian.dart';

class NotesScreenHeader extends StatelessWidget {
  final int orderId;
  final String orderTitle;
  const NotesScreenHeader({
    super.key,
    required this.orderId,
    required this.orderTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'یادداشت های سفارش ${orderId.toString().withPersianNumbers()}: ${orderTitle}',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
