import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  // Data untuk setiap halaman onboarding
  final List<Map<String, dynamic>> _onboardingData = [
    {
      'image': ImageConfig.onboarding1,
      'title': 'Tingkatkan Produktivitas Bersama Penyuluh',
      'description':
          'Dapatkan informasi dan bimbingan pertanian langsung dari penyuluh untuk hasil panen yang lebih baik.',
    },
    {
      'image': ImageConfig.onboarding2,
      'title': 'Akses Informasi Terkini Setiap Saat',
      'description':
          'Temukan tips, cuaca, harga pasar, dan update teknologi pertanian terbaru hanya dalam genggaman.',
    },
    {
      'image': ImageConfig.onboarding3,
      'title': 'Gabung Komunitas Petani',
      'description':
          'Bersama-sama belajar, bertukar pengalaman, dan bangun jaringan petani untuk kemajuan bersama.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            // Logo SIKETAN APPS
            Image.asset(
              ImageConfig.logoSiketan,
              height: 40.h,
              fit: BoxFit.contain,
            ),
            
        
            // Gambar Onboarding
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Center(
                        child: Transform.scale(
                          scale: 1.5,
                          child: Container(
                            margin: EdgeInsets.only(top: 24.w),
                            width: 500.w,
                            height: 300.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  _onboardingData[index]['image'],
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 60.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          _onboardingData[index]['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray900,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          _onboardingData[index]['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.gray600,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        
            SizedBox(height: 24.h),
        
            // Indikator Dot
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_onboardingData.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: index == _currentPage ? 16.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      color: index == _currentPage
                          ? AppColors.green4
                          : AppColors.gray200,
                    ),
                    color: index == _currentPage
                        ? AppColors.green4
                        : AppColors.gray200,
                  ),
                );
              }),
            ),
        
            SizedBox(height: 40.h),
        
            // Footer: Skip & Next Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // skip mengarahkan ke onboarding terakhir
                      _pageController.animateToPage(
                        _onboardingData.length - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      // atau arahkan ke login/home
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.gray600,
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Halaman terakhir → arahkan ke halaman utama
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.home,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      backgroundColor: AppColors.green4,
                    ),
                    child: Iconify(
                      MaterialSymbols.arrow_forward_rounded,
                      size: 20.w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
