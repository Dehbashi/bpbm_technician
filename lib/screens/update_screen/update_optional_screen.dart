import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/open_app_bloc/open_app_bloc.dart';

class UpdateOptionalScreen extends StatelessWidget {
  const UpdateOptionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('لطفاً بر روی برروزرسانی ضربه بزنید'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('بروزرسانی'),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<OpenAppBloc>(context).add(OpenAppFinished());
                },
                child: Text('رد کردن'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
