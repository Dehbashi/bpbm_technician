import 'package:bpbm_technician/app_theme/my_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final Color black;
  final Color white;
  final MyColors neutral;
  MyColors primary;
  final MyColors error;
  final MyColors warning;
  final MyColors success;

  AppTheme.light({MyColors? primary})
      : black = Colors.black,
        white = Colors.white,
        neutral = MyColors.neutral(),
        primary = primary ?? MyColors.primaryLight(),
        error = MyColors.errorLight(),
        warning = MyColors.warningLight(),
        success = MyColors.successLight();

  AppTheme.dark({MyColors? primary})
      : black = Colors.black,
        white = Colors.white,
        neutral = MyColors.neutral(),
        primary = primary ?? MyColors.primaryDark(),
        error = MyColors.errorDark(),
        warning = MyColors.warningDark(),
        success = MyColors.successDark();

  ThemeData getTheme() {
    const String defaultFontFamily = 'iransans';
    return ThemeData(
      fontFamily: defaultFontFamily,
      timePickerTheme: TimePickerThemeData(backgroundColor: primary.shade200),
      datePickerTheme: DatePickerThemeData(backgroundColor: primary.shade200),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: white,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: primary.shade800,
          size: 20,
        ),
        unselectedIconTheme: IconThemeData(
          color: neutral.shade400,
          size: 20,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: primary.shade800,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          height: 16 / 10,
          letterSpacing: 0.8 / 10,
          color: neutral.shade800,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
          height: 16 / 10,
          letterSpacing: 0.8 / 10,
          color: neutral.shade500,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStateProperty.all(black),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(primary.shade800),
        ),
      ),
      textTheme: faPrimaryTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: WidgetStateProperty.all(primary.shade700),
          foregroundColor: WidgetStateProperty.all(black),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      shadowColor: const Color(0xff101828),
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarTheme(
        backgroundColor: white,
        shadowColor: Colors.black87,
        elevation: 1,
        titleTextStyle: TextStyle(
          fontFamily: defaultFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: black,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: white,
        contentTextStyle: TextStyle(
          fontFamily: defaultFontFamily,
          color: black,
        ),
        titleTextStyle: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.bold,
            color: black),
      ),
      colorScheme: ColorScheme.light(
        primary: primary.shade700,
      ),
    );
  }

  TextTheme get faPrimaryTextTheme => TextTheme(
        //xs
        labelSmall: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
          height: 16 / 10,
          letterSpacing: 0.8 / 10,
          color: neutral.shade800,
        ),

        //sm
        labelMedium: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          height: 20 / 12,
          letterSpacing: 0.4 / 12,
          color: neutral.shade800,
        ),

        //base
        bodyMedium: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          height: 24 / 14,
          letterSpacing: 0.8 / 14,
          color: neutral.shade800,
        ),

        //lg
        bodyLarge: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 28 / 16,
          letterSpacing: 0.8 / 16,
          color: neutral.shade900,
        ),

        //xl
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          height: 32 / 18,
          letterSpacing: 0.8 / 18,
          color: neutral.shade800,
        ),

        //2xl
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          height: 32 / 20,
          letterSpacing: 0.4 / 20,
          color: neutral.shade800,
        ),
      );
}
