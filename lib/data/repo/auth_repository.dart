import 'package:flutter/material.dart';
import 'package:bpbm_technician/data/models/auth_info.dart';
import 'package:bpbm_technician/data/source/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepository = AuthRepository(dataSource: AuthRemoteDataSource());

abstract class IAuthRepository {
  Future<void> sendSms({
    required String cellNumber,
  });
  Future<void> verifySms({
    required String otpCode,
  });

  Future<void> singOut();
}

class AuthRepository implements IAuthRepository {
  static final ValueNotifier<AuthInfo?> authChangeNotifier =
      ValueNotifier(null);
  final IAuthDataSource dataSource;

  AuthRepository({required this.dataSource});

  @override
  Future<void> sendSms({required String cellNumber}) async {
    await dataSource.sendSms(cellNumber: cellNumber);
  }

  @override
  Future<void> verifySms({required String otpCode}) async {
    await dataSource.verifySms(otpCode: otpCode);
    await loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String token = _prefs.getString('token') ?? '';
    final int id = _prefs.getInt('id') ?? 0;

    if (token.isNotEmpty) {
      authChangeNotifier.value = AuthInfo(
        token: token,
      );
    }
  }

  @override
  Future<void> singOut() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    authChangeNotifier.value = null;
  }
}
