import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/home/presentation/widget/horizontal_menu_widget.dart';
import 'package:siketan/features/home/presentation/widget/search_widget.dart';
import 'package:siketan/features/home/presentation/widget/welcome_card.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/primary_button_widget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class HomePage extends StatelessWidget {
  final void Function(int index)? onNavigateToTab;
  const HomePage({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return HomePageView(onNavigateToTab: onNavigateToTab);
  }
}

class HomePageView extends StatefulWidget {
  final void Function(int index)? onNavigateToTab;
  const HomePageView({super.key, this.onNavigateToTab});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool isLogin = true;

  void _toggleLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          /// ✅ Background image dengan full width dan fit cover
          Image.asset(ImageConfig.homeBackground, fit: BoxFit.cover),

          /// ✅ Konten utama
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Logo kiri
                      Image.asset(
                        ImageConfig.logoSiketan,
                        width: 170.w,
                        fit: BoxFit.contain,
                      ),

                      /// 🔹 Percabangan Komponen (Login / Non-Login)
                      isLogin
                          ? GestureDetector(
                              key: const ValueKey('logout_button'),
                              onTap: _toggleLogin,
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: AppColors.gray50,
                                child: Iconify(
                                  MaterialSymbols.person_2_outline,
                                  color: AppColors.gray900,
                                  size: 20.w,
                                ),
                              ),
                            )
                          : SizedBox(
                              key: const ValueKey('login_button'),
                              height: 36.h,
                              width: 100.w,
                              child: ButtonPrimary(
                                isGradient: true,
                                gradient: const LinearGradient(
                                  colors: [AppColors.blue5, AppColors.blue4],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                color: AppColors.blue4,
                                mainButtonMessage: "Masuk",
                                mainButton: _toggleLogin,
                                isLoading: false,
                              ),
                            ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  /// 🔍 Search bar
                  SearchBarWidget(
                    onSearchTap: () {
                      // aksi ketika icon search ditekan
                      debugPrint('Search clicked!');
                    },
                  ),
                  SizedBox(height: 16.h),
                  WelcomeCard(),
                  HorizontalMenuWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
