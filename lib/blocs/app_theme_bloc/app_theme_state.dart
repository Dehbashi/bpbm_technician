part of 'app_theme_bloc.dart';

class AppThemeState extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;
  final MyColors primary;

  const AppThemeState({
    required this.themeMode,
    required this.locale,
    required this.primary,
  });

  factory AppThemeState.initial() {
    return AppThemeState(
      themeMode: ThemeMode.light,
      locale: const Locale('fa'),
      primary: AppTheme.light().primary,
    );
  }

  @override
  List<Object> get props => [themeMode, locale, primary];

  @override
  String toString() =>
      'AppThemeState(themeMode: $themeMode, locale: $locale, primary: $primary)';

  AppThemeState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    MyColors? primary,
  }) {
    return AppThemeState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      primary: primary ?? this.primary,
    );
  }
}
