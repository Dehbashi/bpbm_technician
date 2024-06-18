import 'package:bpbm_technician/blocs/comment_bloc/comment_bloc.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/order_detail_container.dart';
import 'package:flutter/material.dart';
import 'package:bpbm_technician/common/constants_2.dart';
import 'package:bpbm_technician/data/models/orders/order_model.dart';
import 'package:bpbm_technician/screens/notes_screen/notes_screen.dart';
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
    // Future<void> openGoogleMaps(String lat, String lng) async {
    //   // final url = 'https://www.google.com/maps/@$lat,$lng,16z?entry=ttu';

    //   final url =
    //       'https://www.google.com/maps/dir//$lat,$lng/@$lat,$lng,15z?entry=ttu';
    //   print(url);
    //   final uri = Uri.parse(url);
    //   await launchUrl(uri);
    // }

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 181, 243, 222),
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
            style: TextStyle(
              fontFamily: 'iransans',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OrderDetailContainer(
                            orderId: order.id,
                          ),
                        ),
                      );
                    },
                    child: Text('جزئیات'),
                    style: Constants.getElevatedButtonStyle(ButtonType.details),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
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
                    child: Text('یادداشت ها'),
                    style: Constants.getElevatedButtonStyle(ButtonType.notes),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
