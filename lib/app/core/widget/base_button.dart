import 'package:flutter/material.dart';
import 'package:wedevs_task/app/core/values/app_colors.dart';
import 'package:wedevs_task/app/core/values/text_styles.dart';

class BaseButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  const BaseButton({
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 61,
        decoration: BoxDecoration(
          color: AppColors.buttonBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText!,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
