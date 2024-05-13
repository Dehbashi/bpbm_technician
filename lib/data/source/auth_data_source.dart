import 'dart:convert';

import 'package:bpbm_technician/common/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bpbm_technician/common/methods/device_info.dart';

abstract class IAuthDataSource {
  Future<void> sendSms({
    required String cellNumber,
  });
  Future<void> verifySms({
    required String otpCode,
  });
}

class AuthRemoteDataSource implements IAuthDataSource {
  @override
  Future<void> sendSms({
    required String cellNumber,
  }) async {
    final deviceInfo = DeviceInfo();
    await deviceInfo.getIp();
    await deviceInfo.saveUserAgent();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mainIpAddress = prefs.getString('ip');
    final userAgent = prefs.getString('userAgent');
    print(mainIpAddress);
    print(userAgent);

    final url = Uri.parse('$baseUrl/public/auth/otp/send');
    final body = jsonEncode({
      'ip': mainIpAddress,
      'phone_number': cellNumber,
      'userAgent': userAgent,
    });
    final headers = {
      'TokenPublic': 'bpbm',
      'Content-Type': 'application/json',
    };
    final response = await http.post(url, body: body, headers: headers);
    print('send sms successful');

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> verifySms({
    required String otpCode,
  }) async {
    final deviceInfo = DeviceInfo();
    await deviceInfo.getIp();
    await deviceInfo.saveUserAgent();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mainIpAddress = prefs.getString('ip');
    final userAgent = prefs.getString('userAgent');
    final info = await loadInfo();
    final cellNumber = info;
    final url = Uri.parse('$baseUrl/public/auth/otp/verify');
    final body = jsonEncode({
      'ip': mainIpAddress,
      'phone_number': cellNumber,
      'userAgent': userAgent,
      'code': otpCode,
    });
    final headers = {
      'TokenPublic': 'bpbm',
      'Content-Type': 'application/json',
    };

    final response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['data']['token'];
      final id = data['data']['user']['id'];
      await saveTokenAndId(
        token: token,
        id: id,
      );
      print('verify sms successful');
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<void> saveTokenAndId({required String token, required int id}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);
    _prefs.setInt('id', id);
  }

  Future<String> loadInfo() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final cellNumber = _prefs.getString('cellNumber');
    final info = cellNumber ?? '';

    return info;
  }
}
