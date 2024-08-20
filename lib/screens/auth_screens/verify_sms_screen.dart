import 'package:bpbm_technician/common/customer_error_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:bpbm_technician/blocs/auth_bloc/auth_bloc.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/auth_screen_center_logo.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/button_widget.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifySmsScreen extends StatefulWidget {
  const VerifySmsScreen({super.key});
  static const routeName = '/verify-sms-screen';

  @override
  State<VerifySmsScreen> createState() => _VerifySmsScreenState();
}

class _VerifySmsScreenState extends State<VerifySmsScreen> {
  String otpCode = '';
  final SmsAutoFill _smsAutoFill = SmsAutoFill();

  @override
  void initState() {
    super.initState();
    _smsAutoFill.listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthScreenCenterLogo(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تأیید کد',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Directionality(
                  //   textDirection: TextDirection.ltr,
                  //   child: PinFieldAutoFill(
                  //     onCodeChanged: (code) {
                  //       if (code?.length == 5) {
                  //         print('Entered OTP: $code');
                  //         setState(() {
                  //           otpCode = code!;
                  //         });
                  //       }
                  //     },
                  //   ),
                  // ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: OtpTextField(
                      numberOfFields: 5,
                      borderRadius: BorderRadius.circular(10),
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      fieldWidth: 50,
                      filled: true,
                      fillColor: const Color(0xff989898),
                      showFieldAsBox: true,
                      onSubmit: (value) {
                        otpCode = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is SendSmsSuccessful) {
                        return ButtonWidget(
                          isLoading: state.isLoading,
                          icon: const Icon(Icons.lock_open),
                          onPressed: () {
                            if (otpCode != '' || otpCode.isNotEmpty) {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthVerifySms(
                                  otp: otpCode,
                                  context: context,
                                ),
                              );
                            } else {
                              customErrorMessenger(
                                context: context,
                                message: 'لطفا کد را کامل وارد نمایید',
                              );
                            }
                          },
                          text: 'تأیید',
                          buttonWidth: double.infinity,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
