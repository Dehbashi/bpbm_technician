import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'iransans',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 84, 177, 147),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 28,
          color: Colors.white,
        ),
        unselectedIconTheme: IconThemeData(
          size: 28,
        ),
        type: BottomNavigationBarType.fixed,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 2,
        shadowColor: Colors.black54,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontFamily: 'iransans',
          fontSize: 16,
        ),
      ),
      // dialogTheme: DialogTheme(
      //   titleTextStyle: TextStyle(
      //     fontFamily: 'iransans',
      //     fontWeight: FontWeight.bold,
      //     color: Colors.black,
      //   ),
      //   contentTextStyle: TextStyle(
      //     fontFamily: 'iransans',
      //     color: Colors.black,
      //   ),
      // ),

      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: Color(0xffcdeef0),
        onPrimary: Color(0xff04a8b2),
        secondary: Color.fromARGB(255, 243, 244, 232),
      ),
      useMaterial3: true,
    );
  }
}
