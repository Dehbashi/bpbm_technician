import 'package:bloc/bloc.dart';
import 'package:bpbm_technician/common/customer_error_messenger.dart';
import 'package:bpbm_technician/common/methods/package_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bpbm_technician/data/repo/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial(isLoading: false)) {
    on<AuthEvent>((event, emit) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final cellNumber = _prefs.getString('cellNumber');
      // final connectivityResult = await (Connectivity().checkConnectivity());

      if (event is AuthStarted) {
        // if (connectivityResult != ConnectivityResult.none) {
        //   if (AuthRepository.authChangeNotifier.value == null) {
        //     emit(const AuthInitial(isLoading: false));
        //   } else {
        //     emit(AuthSuccess());
        //   }
        // } else {
        //   emit(
        //     const AuthNoInternetVerified(
        //       message:
        //           'لطفاً اتصال اینترنت خود را بررسی نمایید و سپس بر روی بروزرسانی کلیک کنید.',
        //     ),
        //   );
        // }
        final versionName = await packageInformation();
        emit(SplashSuccess(versionName: versionName));
        await Future.delayed(Duration(seconds: 2));
        if (AuthRepository.authChangeNotifier.value == null) {
          emit(const AuthInitial(isLoading: false));
        } else {
          emit(AuthSuccess());
        }
      }

      if (event is AuthSendSms) {
        emit(const AuthInitial(isLoading: true));
        await authRepository.sendSms(cellNumber: cellNumber!);
        emit(const SendSmsSuccessful(isLoading: false));
      }

      if (event is AuthVerifySms) {
        emit(const SendSmsSuccessful(isLoading: true));
        await authRepository.verifySms(otpCode: event.otp).then((value) {
          emit(const VerifySmsSuccessful(isLoading: false));
        }).catchError((e) {
          emit(const SendSmsSuccessful(isLoading: false));
          print(e);
          customErrorMessenger(
            context: event.context,
            message: 'کد وارد شده اشتباه می باشد',
          );
        });
      }

      if (event is AuthVerifyUserName) {
        emit(const VerifySmsSuccessful(isLoading: true));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('firstName', event.firstName);
        await prefs.setString('lastName', event.lastName);
        emit(
          VerifyUserNameSuccessful(),
        );
      }

      if (event is AuthSignOut) {
        authRepository.singOut();
        emit(const AuthInitial(isLoading: false));
      }
    });
  }
}
