import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/auth_bloc/auth_bloc.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/auth_screen_center_logo.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/button_widget.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyNameScreen extends StatefulWidget {
  const VerifyNameScreen({super.key});
  static const routeName = '/send-sms-screen';
  // final bool isButtonLoading;

  @override
  State<VerifyNameScreen> createState() => _VerifyNameScreenState();
}

class _VerifyNameScreenState extends State<VerifyNameScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Future<void> onFirstNameSave({required String firstName}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firstName);
  }

  Future<void> onLastNameSave({required String lastName}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastName', lastName);
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          controller: firstNameController,
                          onSaved: (value) {
                            onFirstNameSave(
                              firstName: firstNameController.text,
                            );
                          },
                          text: 'نام',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفاً نام خود را وارد نمایید';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          controller: lastNameController,
                          onSaved: (value) {
                            onLastNameSave(
                              lastName: lastNameController.text,
                            );
                          },
                          text: 'نام خانوادگی',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفاً نام خانوادگی خود را وارد نمایید';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is VerifySmsSuccessful) {
                              return ButtonWidget(
                                isLoading: state.isLoading,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    BlocProvider.of<AuthBloc>(context).add(
                                      AuthVerifyUserName(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                      ),
                                    );
                                  }
                                },
                                text: 'ورود',
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
