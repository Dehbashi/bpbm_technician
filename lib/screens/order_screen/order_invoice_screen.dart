import 'package:bpbm_technician/data/models/orders/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:persian/persian.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OrderInvoiceScreen extends StatelessWidget {
  final OrderDetails orderDetails;
  const OrderInvoiceScreen({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'مشاهده پیش‌فاکتور سفارش ${orderDetails.id.toString().withPersianNumbers()} (${orderDetails.user['name']})',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'عنوان',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'مبلغ کل',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orderDetails.invoice.items.length + 1,
              itemBuilder: (context, index) {
                if (index < orderDetails.invoice.items.length) {
                  final invoice = orderDetails.invoice.items[index];
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.all(10),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text('${invoice.title} (${invoice.text})'),
                            ),
                            Text(
                                '${(int.parse(invoice.price) * invoice.number).toString().seRagham().toPersianDigit()} ریال'),
                          ],
                        ),
                        children: [
                          contentRow(
                            title: 'تعداد',
                            text: invoice.number.toString().toPersianDigit(),
                            context: context,
                          ),
                          contentRow(
                            title: 'تخفیف',
                            text:
                                '${invoice.discount.toString().toPersianDigit()} درصد',
                            context: context,
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (index == orderDetails.invoice.items.length) {
                  int totalPrice = 0;
                  for (int i = 0; i < orderDetails.invoice.items.length; i++) {
                    final invoice = orderDetails.invoice.items[i];
                    totalPrice = totalPrice +
                        int.parse(invoice.price) * invoice.number -
                        invoice.discount;
                  }
                  return Column(
                    children: [
                      Divider(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: contentRow(
                          title: 'جمع کل',
                          text:
                              '${totalPrice.toString().seRagham().toPersianDigit()} ریال',
                          context: context,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget contentRow({
    required String title,
    required String text,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title: ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
