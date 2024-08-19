import 'package:bpbm_technician/app_theme/app_theme.dart';
import 'package:bpbm_technician/app_theme/my_colors.dart';
import 'package:bpbm_technician/blocs/app_theme_bloc/app_theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ButtonWidgetType {
  accept,
  cancel,
  details,
  notes,
  refresh,
  backgroundService,
}

class ButtonWidgetNormal extends StatelessWidget {
  String? text;
  final double width;
  final dynamic Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final ButtonWidgetType buttonType;
  IconData? icon;
  EdgeInsets? margin;
  Color? color;

  ButtonWidgetNormal({
    super.key,
    required this.onPressed,
    required this.buttonType,
    this.text,
    this.width = 100,
    this.isDisabled = false,
    this.isLoading = false,
    this.icon,
    this.margin,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    double height;
    TextStyle textStyle;
    Color backgroundColor;
    Color hoverColor;
    Color textColor;
    double iconSize;

    final state = context.watch<AppThemeBloc>().state;
    MyColors primary = state.primary;

    switch (buttonType) {
      case ButtonWidgetType.accept:
        backgroundColor = isDisabled
            ? AppTheme.light().success.shade400
            : AppTheme.light().success.shade800;
        hoverColor = primary.shade900;
        textColor = AppTheme.light().white;
        break;
      case ButtonWidgetType.cancel:
        backgroundColor = isDisabled
            ? AppTheme.light().error.shade300
            : AppTheme.light().error.shade700;
        hoverColor = MyColors.errorLight().shade900;
        textColor = AppTheme.light().white;
        break;
      case ButtonWidgetType.details:
        backgroundColor = isDisabled
            ? AppTheme.light().neutral.shade200
            : AppTheme.light().neutral.shade500;
        hoverColor = AppTheme.light().neutral.shade900;
        textColor = AppTheme.light().white;
        break;
      case ButtonWidgetType.notes:
        backgroundColor = isDisabled ? primary.shade400 : primary.shade700;
        hoverColor = AppTheme.light().neutral.shade900;
        textColor = AppTheme.light().white;
        break;
      case ButtonWidgetType.refresh:
        backgroundColor = isDisabled
            ? AppTheme.light().warning.shade400
            : AppTheme.light().warning.shade700;
        hoverColor = AppTheme.light().warning.shade900;
        textColor = AppTheme.light().white;
        break;
      case ButtonWidgetType.backgroundService:
        backgroundColor = isDisabled
            ? AppTheme.light().success.shade400
            : AppTheme.light().success.shade700;
        hoverColor = AppTheme.light().success.shade900;
        textColor = AppTheme.light().white;
        break;
      default:
        backgroundColor = primary.shade800;
        hoverColor = primary.shade900;
        textColor = AppTheme.light().white;
        break;
    }

    textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontFamily: 'iransans',
        );

    return Container(
      margin: margin,
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(color != null ? color : backgroundColor),
          elevation: WidgetStateProperty.all(0),
          textStyle: WidgetStateProperty.all(textStyle),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        child: isLoading
            ? Transform.scale(
                scale: 0.75,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeCap: StrokeCap.square,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Row(
                      children: [
                        Icon(
                          icon!,
                          color: textColor,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  if (text != null)
                    Expanded(
                      child: Text(
                        text!,
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
