import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/features/home/presentation/view/home_page.dart';
import 'package:siketan/features/data/presentation/view/data_page.dart';
import 'package:siketan/features/informasi/presentation/view/informasi_page.dart';
import 'package:siketan/features/toko/presentation/view/toko_page.dart';
import 'package:siketan/shared/style/shadow.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  /// ✅ Fungsi agar halaman anak bisa ganti tab
  void switchTab(int index) {
    _onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: "Ketuk kembali lagi untuk keluar",
      waitForSecondBackPress: 2,
      child: Scaffold(
        backgroundColor: AppColors.gray50,
        body: PageView(
          controller: _pageController,
          onPageChanged: _onItemTapped,
          children: [
            HomePage(onNavigateToTab: switchTab),
            DataPage(),
            InformasiPage(),
            TokoPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: shadowSm),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(
                    index: 0,
                    icon: MaterialSymbols.home_rounded,
                    label: "Beranda",
                  ),
                  _navItem(
                    index: 1,
                    icon: MaterialSymbols.insert_chart_outline_rounded,
                    label: "Data",
                  ),
                  _navItem(
                    index: 2,
                    icon: Heroicons.newspaper_solid,
                    label: "Informasi",
                  ),
                  _navItem(index: 3, icon: Uil.shop, label: "Toko"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required String icon,
    required String label,
  }) {
    final bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Iconify(
            icon,
            color: isActive ? AppColors.green4 : AppColors.gray400,
            size: 24.w,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isActive ? AppColors.green4 : AppColors.gray400,
            ),
          ),
        ],
      ),
    );
  }
}
