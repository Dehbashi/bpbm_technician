import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String tokenPrefix = 'Bearer';

const String baseUrl = 'https://s1.lianerp.com/api';

const kLocationServiceChannel = AndroidNotificationChannel(
  'appname_foreground_location_android_channel',
  'AppName foreground location service channel',
  description: 'This channel is used for AppName foreground location service.',
  importance: Importance.low,
);

const kLocationServiceNotificationId = 1;

const kFlutterLocalNotificationSettings = InitializationSettings(
  android: AndroidInitializationSettings('notification_icon'),
);

const List<BottomNavigationBarItem> bottomNavBarItem = [
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'سفارش های شما',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'خانه',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_2),
    label: 'پروفایل کاربری',
  ),
];
