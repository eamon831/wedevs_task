import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  final Color bgColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const ElevatedContainer({
    required this.child,
    this.onPressed,
    super.key,
    this.bgColor = AppColors.pageBackground,
    this.padding,
    this.borderRadius = AppValues.smallRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.elevatedContainerColorOpacity,
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: AppColors.pageBackground,
        ),
        child: child,
      ),
    );
  }
}
