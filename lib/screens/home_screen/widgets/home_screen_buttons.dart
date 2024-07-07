import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/common/constants_2.dart';
import 'package:bpbm_technician/services/background_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenButtons extends StatefulWidget {
  const HomeScreenButtons({super.key});

  @override
  State<HomeScreenButtons> createState() => _HomeScreenButtonsState();
}

class _HomeScreenButtonsState extends State<HomeScreenButtons> {
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
          // margin: EdgeInsets.only(bottom: 40),
          width: 200,
          // height: 60,
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
    );
  }
}
