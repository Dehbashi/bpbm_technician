import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class MainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> scaffoldKey;
  const MainScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 121,
              height: 68,
            ),
            Text(
              'متخصص',
              style: TextStyle(
                color: Color(0xFF037E85),
                fontFamily: 'iranSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
