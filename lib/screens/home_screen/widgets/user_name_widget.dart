import 'package:bpbm_technician/app_theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian/persian.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bpbm_technician/common/methods/load_user.dart';

class UserNameWidget extends StatefulWidget {
  const UserNameWidget({super.key});

  @override
  State<UserNameWidget> createState() => _UserNameWidgetState();
}

class _UserNameWidgetState extends State<UserNameWidget> {
  String firstName = '';
  String lastName = '';
  String cellNumber = '';

  // Future<List<String>> loadUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   firstName = prefs.getString('firstName') ?? '';
  //   lastName = prefs.getString('lastName') ?? '';
  //   cellNumber = prefs.getString('cellNumber') ?? '';

  //   final List<String> userInfo = [
  //     firstName,
  //     lastName,
  //     cellNumber,
  //   ];

  //   return userInfo;
  // }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CupertinoActivityIndicator();
        } else if (!snapshot.hasData) {
          return Text(
            'متخصص بسپارش به ما',
            style: Theme.of(context).textTheme.titleLarge,
          );
        } else {
          final data = snapshot.data!;
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.light().neutral.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      '${data[0]} ${data[1]} ${data[2].withPersianNumbers()}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
