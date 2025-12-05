import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:siketan/shared/style/color.dart';

enum ErrorSize { S, M, L }

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  final ErrorSize size;
  final bool isTextOnly;
  final Color? textColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment mainAxisAlignment;

  const ErrorMessageWidget({
    super.key,
    required this.message,
    this.size = ErrorSize.M,
    this.isTextOnly = false,
    this.textColor,
    this.iconColor,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    // Size configurations
    double iconSize;
    double fontSize;
    double verticalSpacing;

    switch (size) {
      case ErrorSize.S:
        iconSize = 16.w;
        fontSize = 12.sp;
        verticalSpacing = 4.h;
        break;
      case ErrorSize.M:
        iconSize = 20.w;
        fontSize = 14.sp;
        verticalSpacing = 8.h;
        break;
      case ErrorSize.L:
        iconSize = 28.w;
        fontSize = 16.sp;
        verticalSpacing = 12.h;
        break;
    }

    Widget iconWidget = isTextOnly
        ? const SizedBox.shrink()
        : Iconify(
            Ri.error_warning_line,
            color: iconColor ?? AppColors.red4,
            size: iconSize,
          );

    List<Widget> children = [];

    if (mainAxisAlignment == MainAxisAlignment.start ||
        mainAxisAlignment == MainAxisAlignment.spaceAround) {
      // For left-aligned layout
      children = [
        if (!isTextOnly) iconWidget,
        if (!isTextOnly) SizedBox(width: verticalSpacing),
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: textColor ?? AppColors.red4,
            ),
          ),
        ),
      ];
    } else {
      // For centered layout
      children = [
        iconWidget,
        if (!isTextOnly) SizedBox(height: verticalSpacing),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: textColor ?? AppColors.red4,
          ),
        ),
      ];
    }

    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }
}
