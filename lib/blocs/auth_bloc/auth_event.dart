part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {
  final BuildContext context;

  const AuthStarted({required this.context});

  @override
  List<Object> get props => [context];
}

class AuthSendSms extends AuthEvent {}

class AuthVerifySms extends AuthEvent {
  final BuildContext context;
  final String otp;

  const AuthVerifySms({
    required this.otp,
    required this.context,
  });
}

class AuthVerifyUserName extends AuthEvent {
  final String firstName;
  final String lastName;
  const AuthVerifyUserName({
    required this.lastName,
    required this.firstName,
  });
}

class AuthError extends AuthEvent {
  final String message;
  final BuildContext context;

  const AuthError({
    required this.context,
    required this.message,
  });
}

class AuthSignOut extends AuthEvent {}

// class AuthNoInternet extends AuthEvent {}
