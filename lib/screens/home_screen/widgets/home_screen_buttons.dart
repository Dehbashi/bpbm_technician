import 'package:bpbm_technician/app_theme/app_theme.dart';
import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/common/widgets/button_widget_normal.dart';
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
  String text = "سرویس‌دهی";
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
        text = 'پایان سرویس‌دهی';
        color = AppTheme.light().error.shade700;
      });
    } else {
      setState(() {
        text = 'شروع سرویس‌دهی';
        color = AppTheme.light().success.shade700;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ButtonWidgetNormal(
            width: MediaQuery.of(context).size.width * 0.4,
            onPressed: () async {
              BlocProvider.of<OrderBloc>(context).add(OrderStarted());
            },
            buttonType: ButtonWidgetType.refresh,
            text: 'بروزرسانی سرویس‌ها',
          ),
          SizedBox(
            height: 10,
          ),
          ButtonWidgetNormal(
            width: MediaQuery.of(context).size.width * 0.4,
            onPressed: () async {
              final isPermissionsGranted =
                  await LocationService.isPermissionsGranted;
              if (!isPermissionsGranted) return;
              if (await LocationService.isServiceRunning) {
                await LocationService.stop();
                setState(() {
                  text = 'شروع سرویس‌دهی';
                  color = AppTheme.light().success.shade700;
                });
              } else {
                LocationStart();
                await LocationService.start();
                setState(() {
                  text = 'پایان سرویس‌دهی';
                  color = AppTheme.light().error.shade700;
                });
              }
            },
            color: color,
            buttonType: ButtonWidgetType.backgroundService,
            text: text,
          ),
        ],
      ),
    );
  }
}
