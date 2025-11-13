import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';

class HorizontalMenuWidget extends StatelessWidget {
  const HorizontalMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> menuItems = [
      {
        'title': 'Data Pertanian',
        'image': ImageConfig.imageGraphPlant,
      },
      {
        'title': 'Kegiatan',
        'image': ImageConfig.imageCalenderClock,
      },
      {
        'title': 'Berita',
        'image': ImageConfig.imageNews,
      },
      {
        'title': 'Toko Pertanian',
        'image': ImageConfig.imageVegetables,
      },
      {
        'title': 'Produk',
        'image': ImageConfig.imageFruitVegetables,
      },
      {
        'title': 'Cek NIK',
        'image': ImageConfig.imageSignalPlant,
      },
    ];

    return SizedBox(
      height: 120.h, // tinggi total menu
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: menuItems.map((menu) {
            return Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: _MenuItem(
                title: menu['title']!,
                imagePath: menu['image']!,
                onTap: () {
                  debugPrint("${menu['title']} diklik");
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const _MenuItem({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: 80.w,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.gray900,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
