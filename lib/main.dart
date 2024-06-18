import 'package:bpbm_technician/blocs/order_detail_bloc/order_detail_bloc.dart';
import 'package:bpbm_technician/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/app_theme/app_theme.dart';
import 'package:bpbm_technician/blocs/auth_bloc/auth_bloc.dart';
import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/data/repo/auth_repository.dart';
import 'package:bpbm_technician/screens/auth_screens/send_sms_screen.dart';
import 'package:bpbm_technician/screens/auth_screens/verify_name_screen.dart';
import 'package:bpbm_technician/screens/auth_screens/verify_sms_screen.dart';
import 'package:bpbm_technician/screens/main_screen/main_screen.dart';
import 'package:bpbm_technician/services/background_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationService.initialize();
  authRepository.loadUserInfo();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = AuthBloc();
            bloc.add(AuthStarted(context: context));
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) {
            final bloc = OrderBloc();
            bloc.add(OrderStarted());
            return bloc;
          },
        ),
        BlocProvider(create: (context) => OrderDetailBloc())
      ],
      child: MaterialApp(
        title: 'بسپارش به ما (متخصص)',
        theme: AppTheme().getTheme(),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return const Directionality(
                textDirection: TextDirection.rtl,
                child: SendSmsScreen(),
              );
            } else if (state is SendSmsSuccessful) {
              return const Directionality(
                textDirection: TextDirection.rtl,
                child: VerifySmsScreen(),
              );
            } else if (state is VerifySmsSuccessful) {
              return const Directionality(
                textDirection: TextDirection.rtl,
                child: VerifyNameScreen(),
              );
            } else if (state is SplashSuccess) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: SplashScreen(
                  versionName: state.versionName,
                ),
              );
            } else if (state is VerifyUserNameSuccessful ||
                state is AuthSuccess) {
              return const Directionality(
                textDirection: TextDirection.rtl,
                child: MainScreen(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
