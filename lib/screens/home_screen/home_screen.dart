import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/common/constants_2.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/orders_container.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/user_name_widget.dart';
import 'package:bpbm_technician/services/background_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool locStart = true;
  String text = "سرویس دهی";
  Color color = Colors.white;

  Future<void> LocationStart() async {
    final isPermissionsGranted = await LocationService.isPermissionsGranted;
    if (!isPermissionsGranted) return;
    if (!locStart) {
      await LocationService.stop();
    } else {
      await LocationService.start();
    }
  }

  @override
  void initState() {
    serviceText();
    super.initState();
  }

  Future<void> serviceText() async {
    if (await LocationService.isServiceRunning) {
      setState(() {
        text = 'پایان سرویس دهی';
        color = Colors.red;
      });
    } else {
      setState(() {
        text = 'شروع سرویس دهی';
        color = Colors.green;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserNameWidget(),
        BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return CupertinoActivityIndicator();
            } else if (state is OrderEmpty) {
              return Text('سفارشی وجود ندارد');
            } else if (state is OrderFailed) {
              return Expanded(
                child: Center(
                  child: Text(
                    state.message,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                        fontSize: 20),
                  ),
                ),
              );
            } else if (state is OrderSuccess) {
              final orders = state.orders;
              final listOfOrderDetails = state.orderDetails;
              return Container(
                margin: EdgeInsets.all(10),
                height: 400,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final indexFromLast = orders.length - index - 1;
                    final order = orders[indexFromLast];
                    final orderDetails = listOfOrderDetails[indexFromLast];
                    final status = orderDetails.orderStatus;
                    if (status == 3 ||
                        status == 4 ||
                        status == 6 ||
                        status == 7 ||
                        status == 1 ||
                        status == 2 ||
                        status == 5 ||
                        status == 8) {
                      return OrdersContainer(
                        order: order,
                        orderDetails: orderDetails,
                      );
                    } else {
                      return Center(
                        child: Text(
                          'شما در حال حاضر سفارش فعالی ندارید.',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      );
                    }
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  BlocProvider.of<OrderBloc>(context).add(OrderStarted());
                },
                child: Text(
                  'بروزرسانی سرویس ها',
                  style: TextStyle(
                    fontFamily: Constants.textFont,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    backgroundColor: MaterialStateProperty.all(color),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    final isPermissionsGranted =
                        await LocationService.isPermissionsGranted;
                    if (!isPermissionsGranted) return;
                    if (await LocationService.isServiceRunning) {
                      await LocationService.stop();
                      setState(() {
                        text = 'شروع سرویس دهی';
                        color = Colors.green;
                      });
                    } else {
                      LocationStart();
                      await LocationService.start();
                      setState(() {
                        text = 'پایان سرویس دهی';
                        color = Colors.red;
                      });
                    }
                  },
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: Constants.textFont,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
