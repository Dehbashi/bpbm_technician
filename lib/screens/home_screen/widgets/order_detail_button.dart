import 'package:bpbm_technician/screens/order_screen/order_invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:persian/persian.dart';
import 'package:bpbm_technician/common/constants_2.dart';
import 'package:bpbm_technician/data/models/orders/order_detail.dart';
import 'package:bpbm_technician/data/models/orders/order_model.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/order_state_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailButton extends StatelessWidget {
  final OrderDetails orderDetails;
  const OrderDetailButton({
    super.key,
    required this.orderDetails,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> openGoogleMaps(String lat, String lng) async {
      // final url = 'https://www.google.com/maps/@$lat,$lng,16z?entry=ttu';

      final url =
          'https://www.google.com/maps/dir//$lat,$lng/@$lat,$lng,15z?entry=ttu';
      print(url);
      final uri = Uri.parse(url);
      await launchUrl(uri);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              // width: MediaQuery.of(context).size.width * 0.4,
              // height: 70,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Text(
                      'جزئیات سفارش ${orderDetails.id.toString().withPersianNumbers()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'iransans',
                      ),
                    ),
                    Text(
                      '${orderDetails.service["title"]}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${orderDetails.items[0]["title"]}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${orderDetails.items[0]["value"]}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'یادداشت های مشتری: ${orderDetails.notes}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'تاریخ مراجعه: ${orderDetails.date}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'زمان مراجعه: ${orderDetails.time}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'آدرس: منطقه ${orderDetails.address["municipality_zone"]} ${orderDetails.address["text"]}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'پلاک: ${orderDetails.address["housenumber"] ?? 'null'}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'نام مشتری: ${orderDetails.user["name"]}',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'شماره تلفن:',
                      style: TextStyle(
                        fontFamily: 'iransans',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        String phoneNumber = orderDetails.user["phone_number"];
                        Uri phoneUri = Uri.parse('tel:$phoneNumber');
                        launchUrl(phoneUri);
                      },
                      child: Center(
                        child: Text(
                          orderDetails.user["phone_number"]
                              .toString()
                              .withPersianNumbers(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            fontFamily: 'iransans',
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        openGoogleMaps(orderDetails.address["latitude"],
                            orderDetails.address["longitude"]);
                        print(
                            '${orderDetails.address["latitude"]} and ${orderDetails.address["longitude"]}');
                      },
                      child: Center(
                        child: Text(
                          'مسیریابی روی نقشه',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'iransans',
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OrderInvoiceScreen(
                              orderDetails: orderDetails,
                            ),
                          ),
                        );
                      },
                      child: Text('مشاهده آخرین پیش‌فاکتور مشتری'),
                      style: Constants.getElevatedButtonStyle(ButtonType.notes),
                    ),
                  ],
                ),
              ),
            ),
            // OrderStateButtons(
            // orderStatus: orderDetail!.orderStatus,
            // id: orderDetail.id),
            OrderStateButtons(
                orderStatus: orderDetails.orderStatus, id: orderDetails.id),
          ],
        ),
      ),
    );
  }
}
