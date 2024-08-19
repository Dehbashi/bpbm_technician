import 'package:bpbm_technician/app_theme/my_colors.dart';
import 'package:bpbm_technician/common/methods/open_map.dart';
import 'package:bpbm_technician/common/widgets/button_widget_normal.dart';
import 'package:bpbm_technician/screens/order_screen/order_invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persian/persian.dart';
import 'package:bpbm_technician/data/models/orders/order_detail.dart';
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
    // Future<void> openGoogleMaps(String lat, String lng) async {
    //   final url =
    //       'https://www.google.com/maps/dir//$lat,$lng/@$lat,$lng,15z?entry=ttu';

    //   print(url);
    //   final uri = Uri.parse(url);
    //   await launchUrl(uri);
    // }

    final TextStyle textStyle = Theme.of(context).textTheme.bodyMedium!;

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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Text(
                      'جزئیات سفارش ${orderDetails.id.toString().withPersianNumbers()}',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${orderDetails.service["title"]}',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${orderDetails.items[0]["title"]}',
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${orderDetails.items[0]["value"]}',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'یادداشت های مشتری: ${orderDetails.notes}',
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'تاریخ مراجعه: ${orderDetails.date.withPersianNumbers()}',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'زمان مراجعه: ${orderDetails.time.withPersianNumbers()}',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'آدرس: منطقه ${orderDetails.address["municipality_zone"]} ${orderDetails.address["text"]}',
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'پلاک: ${orderDetails.address["housenumber"] ?? '-'}',
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'نام مشتری: ${orderDetails.user["name"]}',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'شماره تلفن:',
                      style: textStyle,
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
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyColors.blueLight().shade700,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        openMap(
                          lat: orderDetails.address["latitude"],
                          lng: orderDetails.address["longitude"],
                        );
                      },
                      child: Center(
                        child: Text(
                          'مسیریابی روی نقشه',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.blueLight().shade600,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidgetNormal(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OrderInvoiceScreen(
                              orderDetails: orderDetails,
                            ),
                          ),
                        );
                      },
                      width: double.infinity,
                      buttonType: ButtonWidgetType.details,
                      text: 'مشاهده آخرین پیش‌فاکتور مشتری',
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
