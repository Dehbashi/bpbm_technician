import 'package:bpbm_technician/common/widgets/button_widget_normal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/auth_bloc/auth_bloc.dart';
import 'package:bpbm_technician/screens/profile_screen/widgets/profile_user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        children: [
          ProfileUserInfo(),
          const SizedBox(
            height: 20,
          ),
          ButtonWidgetNormal(
            width: MediaQuery.of(context).size.width * 0.5,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      title: Text('خروج'),
                      content: Text(
                        'آیا از خروج از حساب کاربری خود اطمینان دارید؟',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            BlocProvider.of<AuthBloc>(context)
                                .add(AuthSignOut());
                          },
                          child: Text('بله'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('خیر'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            buttonType: ButtonWidgetType.cancel,
            text: 'خروج از حساب کاربری',
          ),
        ],
      ),
    );
  }
}
