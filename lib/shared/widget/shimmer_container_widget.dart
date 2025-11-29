import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:siketan/shared/style/color.dart';

class ShimmerContainerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final bool isRounded;

  const ShimmerContainerWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.isRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    final shimmerChild = Shimmer(
      color: AppColors.gray500,
      child: Container(width: width, height: height, color: AppColors.gray300),
    );

    // Jika circle → pakai ClipOval biar shimmer juga bulat
    if (isRounded) {
      return ClipOval(child: shimmerChild);
    }

    // Jika rectangle → gunakan ClipRRect
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12.r),
      child: shimmerChild,
    );
  }
}
