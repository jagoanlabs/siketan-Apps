import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:siketan/shared/style/color.dart';

class HorizontalMenuWidget extends StatefulWidget {
  final void Function(int index)? onNavigateToTab;
  const HorizontalMenuWidget({super.key, this.onNavigateToTab});

  @override
  State<HorizontalMenuWidget> createState() => _HorizontalMenuWidgetState();
}

class _HorizontalMenuWidgetState extends State<HorizontalMenuWidget> {
  PageController _pageController = PageController();
  int _activeIndicator = 0;
  static const int _itemsPerPage = 4;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      int newIndicator = (_pageController.page ?? 0).round();
      if (newIndicator != _activeIndicator) {
        setState(() {
          _activeIndicator = newIndicator;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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

        // Group menu items into pages of 4
        List<List<Map<String, dynamic>>> pages = [];
        for (int i = 0; i < menuItems.length; i += _itemsPerPage) {
          pages.add(
            menuItems.sublist(
              i,
              (i + _itemsPerPage < menuItems.length)
                  ? i + _itemsPerPage
                  : menuItems.length,
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90.h, // Adjust height as needed for menu items
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  List<Widget> menuRowItems = [];
                  // Fill the row with menu items and empty space
                  for (int i = 0; i < _itemsPerPage; i++) {
                    if (i < pages[index].length) {
                      menuRowItems.add(
                        Expanded(
                          child: _MenuItem(
                            title: pages[index][i]['title']!,
                            imagePath: pages[index][i]['image']!,
                            onTap: () {
                              switch (pages[index][i]['title']) {
                                case 'Data Pertanian':
                                  widget.onNavigateToTab?.call(1);
                                  break;
                                case 'Kegiatan':
                                  widget.onNavigateToTab?.call(2);
                                  break;
                                case 'Berita':
                                  widget.onNavigateToTab?.call(2);
                                  break;
                                case 'Toko Pertanian':
                                  widget.onNavigateToTab?.call(3);
                                  break;
                                case 'Produk':
                                  widget.onNavigateToTab?.call(3);
                                  break;
                                case 'Cek NIK':
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.cekNIK,
                                  );
                                  break;
                              }
                            },
                          ),
                        ),
                      );
                    } else {
                      // Add empty space for remaining slots
                      menuRowItems.add(
                        const Expanded(child: SizedBox.shrink()),
                      );
                    }
                  }
                  return Row(children: menuRowItems);
                },
              ),
            ),
            SizedBox(height: 12.h),

            // 🔵 Indicator Wrapper
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: _activeIndicator == index ? 18.w : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: _activeIndicator == index
                          ? AppColors.blue4
                          : AppColors.gray300,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
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
              width: 60.w, // Reduced width to fit better in expanded container
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp, // Slightly smaller font to fit better
                  color: AppColors.gray900,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
