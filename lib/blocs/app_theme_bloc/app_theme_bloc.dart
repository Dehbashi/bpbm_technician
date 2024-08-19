import 'package:bloc/bloc.dart';
import 'package:bpbm_technician/app_theme/app_theme.dart';
import 'package:bpbm_technician/app_theme/my_colors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  ThemeMode themeMode;
  Locale locale;
  MyColors primary;
  AppThemeBloc(
      {required this.themeMode, required this.locale, required this.primary})
      : super(AppThemeState.initial()) {
    on<AppThemeEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (event is AppThemeStarted) {
        String? themeModeString = prefs.getString('themeMode');
        String? localeModeString = prefs.getString('localeMode');
        int? primaryColorId = prefs.getInt('primaryColorId');
        locale = localeModeString != null
            ? Locale(localeModeString)
            : const Locale('fa');
        themeMode = themeModeString != null
            ? ThemeMode.values
                .firstWhere((mode) => mode.toString() == themeModeString)
            : ThemeMode.light;
        primary = primaryColorId != null
            ? selectColorById(primaryColorId)
            : MyColors.primaryLight();
        emit(
          state.copyWith(
            themeMode: themeMode,
            locale: locale,
            primary: primary,
          ),
        );
      }

      if (event is AppThemeChanged) {
        themeMode =
            (themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;

        prefs.setString('themeMode', themeMode.toString());
        emit(
          state.copyWith(
            themeMode: themeMode,
          ),
        );
      }

      // if (event is AppLanguageChanged) {
      //   locale = event.locale;

      //   prefs.setString('localeMode', locale.languageCode);
      //   emit(
      //     state.copyWith(
      //       locale: locale,
      //     ),
      //   );
      // }

      if (event is ChangeAppThemeColor) {
        prefs.setInt('primaryColorId', event.primary.id);
        emit(
          state.copyWith(
            primary: event.primary,
          ),
        );
      }
    });
  }

  MyColors selectColorById(int id) {
    MyColors primary = MyColors.primaryLight();
    switch (id) {
      case 1:
        primary = MyColors.neutral();
        break;
      case 2:
        primary = MyColors.primaryLight();
        break;
      case 3:
        primary = MyColors.primaryDark();
        break;
      case 4:
        primary = MyColors.errorLight();
        break;
      case 5:
        primary = MyColors.errorDark();
        break;
      case 6:
        primary = MyColors.warningLight();
        break;
      case 7:
        primary = MyColors.warningDark();
        break;
      case 8:
        primary = MyColors.successLight();
        break;
      case 9:
        primary = MyColors.successDark();
        break;
      case 10:
        primary = MyColors.moss();
        break;
      case 11:
        primary = MyColors.blueLight();
        break;
      case 12:
        primary = MyColors.violet();
        break;
      case 13:
        primary = MyColors.fuchisa();
        break;
      case 14:
        primary = MyColors.pink();
        break;
      default:
        primary = MyColors.primaryLight();
        break;
    }
    return primary;
  }
}
