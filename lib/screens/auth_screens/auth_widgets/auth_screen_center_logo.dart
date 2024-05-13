import 'package:flutter/material.dart';

class AuthScreenCenterLogo extends StatelessWidget {
  const AuthScreenCenterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(
        //   height: 150,
        // ),
        Image.asset(
          'assets/images/logo.png',
          width: 150,
          height: 50,
        ),
        Text(
          'بسپارش به ما متخصص',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
