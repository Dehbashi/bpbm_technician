import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// enum ButtonType { accept, cancel, details, notes }

// class Constants {
//   static const String textFont = 'iranSans';
//   static const double textHeight = 20;
//   static const double buttonWidth = 220;
//   static const double buttonHeight = 70;
//   static ButtonStyle getElevatedButtonStyle(ButtonType type) {
//     Color backgroundColor;
//     Color foregroundColor = Colors.white;
//     switch (type) {
//       case ButtonType.accept:
//         backgroundColor = Colors.green;
//         break;
//       case ButtonType.cancel:
//         backgroundColor = Colors.red;
//         break;
//       case ButtonType.details:
//         backgroundColor = Colors.grey;
//         break;
//       case ButtonType.notes:
//         backgroundColor = Color.fromARGB(255, 9, 91, 83);
//         break;
//     }
//     return ButtonStyle(
//       backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
//       foregroundColor: WidgetStateProperty.all<Color>(foregroundColor),
//       textStyle: WidgetStateProperty.all<TextStyle>(
//         TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           fontFamily: textFont,
//         ),
//       ),
//       padding: WidgetStateProperty.all<EdgeInsets>(
//         EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       ),
//       shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//         ),
//       ),
//     );
//   }
// }

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
