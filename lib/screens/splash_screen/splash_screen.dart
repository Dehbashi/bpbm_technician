import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final String versionName;

  const SplashScreen({super.key, required this.versionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'اپلیکیشن متخصص',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            child: Text(
              versionName,
            ),
          ),
        ],
      ),
    );
  }
}
