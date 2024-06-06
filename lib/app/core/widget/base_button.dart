import 'package:flutter/material.dart';
import 'package:wedevs_task/app/core/values/app_colors.dart';
import 'package:wedevs_task/app/core/values/text_styles.dart';

class BaseButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final Color? bgColor;
  final TextStyle? customButtonTextStyle;
  final Color? borderColor;
  const BaseButton({
    required this.buttonText,
    required this.onPressed,
    this.height,
    this.width,
    this.bgColor,
    this.customButtonTextStyle,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 61,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.buttonBgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor ?? (bgColor ?? AppColors.buttonBgColor),
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText!,
            style: customButtonTextStyle ?? buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
