import 'package:bpbm_technician/app_theme/my_colors.dart';
import 'package:bpbm_technician/blocs/app_theme_bloc/app_theme_bloc.dart';
import 'package:bpbm_technician/blocs/comment_bloc/comment_bloc.dart';
import 'package:bpbm_technician/common/widgets/button_widget_normal.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/order_detail_container.dart';
import 'package:bpbm_technician/screens/notes_screen/notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:bpbm_technician/data/models/orders/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian/persian.dart';

class OrdersContainer extends StatelessWidget {
  final Order order;
  const OrdersContainer({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    MyColors primary = context.watch<AppThemeBloc>().state.primary;

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: primary.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            'سفارش شماره ${order.id.toString().withPersianNumbers()}: ${order.service} (${order.customerName})',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          children: [
            ListTile(
              title: Text(
                'نام سفارش: ${order.service}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ButtonWidgetNormal(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OrderDetailContainer(
                              orderId: order.id,
                            ),
                          ),
                        );
                      },
                      buttonType: ButtonWidgetType.details,
                      text: 'جزئیات',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ButtonWidgetNormal(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => CommentBloc(context),
                              child: NotesScreen(
                                orderId: order.id,
                                orderTitle: order.service,
                              ),
                            ),
                          ),
                        );
                      },
                      buttonType: ButtonWidgetType.notes,
                      text: 'یادداشت‌ها',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
