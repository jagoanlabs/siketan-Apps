import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:siketan/shared/style/color.dart';

class ShimmerContainerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  const ShimmerContainerWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: AppColors.gray500,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray300,
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
