import 'package:bpbm_technician/data/models/auth_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<AuthInfo> loadTokens() async {
  String token = '';
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  token = _prefs.getString('token') ?? '';

  return AuthInfo(
    token: token,
  );
}
