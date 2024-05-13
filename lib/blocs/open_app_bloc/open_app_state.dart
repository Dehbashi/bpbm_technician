part of 'open_app_bloc.dart';

sealed class OpenAppState extends Equatable {
  const OpenAppState();

  @override
  List<Object> get props => [];
}

final class OpenAppInitial extends OpenAppState {}

// class AppUpdateStatusRequired extends OpenAppState {}

class AppUpdateStatusOptional extends OpenAppState {}

class OpenAppSplashScreen extends OpenAppState {
  final String versionName;

  OpenAppSplashScreen({required this.versionName});

  @override
  List<Object> get props => [versionName];
}

class OpenAppSuccess extends OpenAppState {}
