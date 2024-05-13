part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  final bool isLoading;

  const AuthInitial({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class SendSmsSuccessful extends AuthState {
  final bool isLoading;

  const SendSmsSuccessful({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class VerifySmsSuccessful extends AuthState {
  final bool isLoading;

  const VerifySmsSuccessful({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class VerifyUserNameSuccessful extends AuthState {
  const VerifyUserNameSuccessful();
}

class AuthSuccess extends AuthState {}

class AuthNoInternetVerified extends AuthState {
  final String message;

  const AuthNoInternetVerified({required this.message});
}

class SplashSuccess extends AuthState {
  final String versionName;

  const SplashSuccess({required this.versionName});

  @override
  List<Object> get props => [versionName];
}
