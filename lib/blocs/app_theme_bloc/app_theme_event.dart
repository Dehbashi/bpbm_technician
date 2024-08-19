part of 'app_theme_bloc.dart';

sealed class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class AppThemeStarted extends AppThemeEvent {}

class AppThemeChanged extends AppThemeEvent {}

// class AppLanguageChanged extends AppThemeEvent {
//   final Locale locale;

//   const AppLanguageChanged({required this.locale});
// }

class ChangeAppThemeColor extends AppThemeEvent {
  final MyColors primary;

  const ChangeAppThemeColor({required this.primary});

  @override
  List<Object> get props => [primary];
}
