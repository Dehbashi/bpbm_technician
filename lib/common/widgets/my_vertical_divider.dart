import 'package:bpbm_technician/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyVerticalDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;

  const MyVerticalDivider({
    super.key,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 15,
      width: width ?? 1,
      color: color ?? AppTheme.light().neutral.shade200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
