import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/auth_bloc/auth_bloc.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/auth_screen_center_logo.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/button_widget.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendSmsScreen extends StatefulWidget {
  const SendSmsScreen({super.key});
  static const routeName = '/send-sms-screen';
  // final bool isButtonLoading;

  @override
  State<SendSmsScreen> createState() => _SendSmsScreenState();
}

class _SendSmsScreenState extends State<SendSmsScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<void> saveCellNumber({required String cellNumber}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('cellNumber', cellNumber);
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
                    'شماره تلفن',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          textInputType: TextInputType.number,
                          text: '09123456789',
                          onSaved: (value) async {
                            await saveCellNumber(cellNumber: value!);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفاً شماره خود را وارد نمایید';
                            } else if (!value.startsWith('09')) {
                              return 'شماره تلفن باید با 09 شروع شود';
                            } else if (value.length != 11) {
                              return 'شماره تلفن باید 11 رقمی باشد';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthInitial) {
                              return ButtonWidget(
                                isLoading: state.isLoading,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(AuthSendSms());
                                  }
                                },
                                text: 'دریافت کد تأیید',
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
          ],
        ),
      ),
    );
  }
}
