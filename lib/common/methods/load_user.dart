import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> loadUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final firstName = prefs.getString('firstName') ?? '';
  final lastName = prefs.getString('lastName') ?? '';
  final cellNumber = prefs.getString('cellNumber') ?? '';

  final List<String> userInfo = [
    firstName,
    lastName,
    cellNumber,
  ];

  return userInfo;
}
