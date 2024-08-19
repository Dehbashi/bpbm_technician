import 'package:bpbm_technician/blocs/app_theme_bloc/app_theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

class MainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final GlobalKey<ScaffoldState> scaffoldKey;
  const MainScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appThemeState = context.watch<AppThemeBloc>().state;
    final primary = appThemeState.primary;

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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primary.shade700,
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
