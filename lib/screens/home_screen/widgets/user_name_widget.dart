import 'package:flutter/cupertino.dart';
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
          return Text('متخصص بسپارش به ما');
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
                color: Color(0xFF9BDCE0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      '${data[0]} ${data[1]} ${data[2]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'iransans',
                        height: 2.5,
                      ),
                    ),
                  ),
                  // Flexible(
                  //   flex: 2,
                  //   child: IconButton(
                  //     icon: Icon(Icons.logout_outlined),
                  //     onPressed: () {
                  //       // showDialog(
                  //       //   context: context,
                  //       //   builder: (context) {
                  //       //     return AlertDialog(
                  //       //       title: Text('خروج از سامانه'),
                  //       //       content: Text('آیا از تصمیم خود مطمئن هستید؟'),
                  //       //       actions: [
                  //       //         TextButton(
                  //       //           onPressed: () {
                  //       //             BlocProvider.of<AuthBloc>(context).add(
                  //       //               AuthSignOut(),
                  //       //             );
                  //       //             Navigator.of(context).pop();
                  //       //           },
                  //       //           child: Text('بله'),
                  //       //         ),
                  //       //         TextButton(
                  //       //           onPressed: () {
                  //       //             Navigator.of(context).pop();
                  //       //           },
                  //       //           child: Text('خیر'),
                  //       //         ),
                  //       //       ],
                  //       //     );
                  //       //   },
                  //       // );
                  //     },
                  //     tooltip: 'خروج از سامانه',
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
