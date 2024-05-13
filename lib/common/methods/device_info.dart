import 'package:geolocator/geolocator.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:bpbm_technician/common/methods/get_user_agent.dart';
import 'package:platform_detector/enums.dart';
import 'package:platform_detector/platform_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceInfo {
  Future<void> getIp() async {
    late String? mainIpAddress = '';
    try {
      var ipAddress = IpAddress(type: RequestType.json);
      dynamic data = await ipAddress.getIpAddress();
      mainIpAddress = data['ip'];
    } on IpAddressException catch (exception) {
      print(exception.message);
    }
    if (mainIpAddress != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('ip', mainIpAddress);
    }
  }

  Future<void> saveUserAgent() async {
    late String? userAgent = '';
    try {
      userAgent = await GetUserAgent.getUserAgent();
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (userAgent != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userAgent', userAgent);
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    final status = await Permission.notification.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Location service notification is disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission != LocationPermission.always) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
      }

      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }

      if (permission == LocationPermission.whileInUse) {
        throw Exception('Location permissions must always be allowed.');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<PlatformType> fetchPlatformName() async {
    final PlatformDetector platformDetector = PlatformDetector.platform;
    final currentPlatformType = platformDetector.type;

    return currentPlatformType;
  }
}
