import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:siketan/shared/style/color.dart';

class HorizontalMenuWidget extends StatelessWidget {
  final void Function(int index)? onNavigateToTab;
  const HorizontalMenuWidget({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        final bool isAuthenticated = authState is AuthenticationTrue;

        final menuItems = [
          {'title': 'Data Pertanian', 'image': ImageConfig.imageGraphPlant},
          {'title': 'Kegiatan', 'image': ImageConfig.imageCalenderClock},
          {'title': 'Berita', 'image': ImageConfig.imageNews},
          {'title': 'Toko Pertanian', 'image': ImageConfig.imageVegetables},
          {'title': 'Produk', 'image': ImageConfig.imageFruitVegetables},
          if (isAuthenticated) // tampil hanya jika sudah login
            {'title': 'Cek NIK', 'image': ImageConfig.imageSignalPlant},
        ];

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: menuItems.map((menu) {
              return _MenuItem(
                title: menu['title']!,
                imagePath: menu['image']!,
                onTap: () {
                  debugPrint("${menu['title']} diklik");
                  switch (menu['title']) {
                    case 'Data Pertanian':
                      onNavigateToTab?.call(1);
                      break;
                    case 'Kegiatan':
                      onNavigateToTab?.call(2);
                      break;
                    case 'Berita':
                      onNavigateToTab?.call(2);
                      break;
                    case 'Toko Pertanian':
                      onNavigateToTab?.call(3);
                      break;
                    case 'Produk':
                      onNavigateToTab?.call(3);
                      break;
                    case 'Cek NIK':
                      Navigator.pushNamed(context, RoutesName.cekNIK);
                      break;
                  }
                },
              );
            }).toList(),
          ),
        );
      },
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
          Image.asset(
            width: 48.w,
            height: 48.h,
            imagePath,
            fit: BoxFit.contain,
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
