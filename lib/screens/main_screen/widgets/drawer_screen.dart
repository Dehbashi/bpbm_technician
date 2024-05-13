import 'package:bpbm_technician/screens/main_screen/widgets/drawer_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/auth_bloc/auth_bloc.dart';

class DrawerScreen extends StatelessWidget {
  // final GlobalKey<NavigatorState> navKey;
  // final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerScreen({
    super.key,
    // required this.navKey,
    // required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeaderWidget(),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlertDialog(
                          title: Text('خروج از سامانه'),
                          content: Text('آیا از تصمیم خود مطمئن هستید؟'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthSignOut(),
                                );
                                Navigator.of(context).pop();
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
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'خروج از سامانه',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
