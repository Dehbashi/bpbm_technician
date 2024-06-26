import 'package:flutter/services.dart';

class GetUserAgent {
  static const platform = MethodChannel('channel');

  static Future<String> getUserAgent() async {
    try {
      return await platform.invokeMethod('getUserAgent');
    } catch (e) {
      return 'unknown';
    }
  }
}
