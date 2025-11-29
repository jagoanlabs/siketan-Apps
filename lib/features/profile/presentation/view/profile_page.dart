import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:siketan/features/profile/domain/repository/profile_repository.dart';
import 'package:siketan/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:siketan/features/profile/presentation/bloc/profile_event.dart';
import 'package:siketan/features/profile/presentation/bloc/profile_state.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/primary_button_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(profileRepository: getIt<ProfileRepository>()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ScrollController _scroll = ScrollController();
  bool isScrolled = false;

  @override
  void initState() {
    logger.d("init state");
    context.read<ProfileBloc>().add(LoadUserProfileEvent());

    super.initState();
    _scroll.addListener(() {
      if (_scroll.offset > 80 && !isScrolled) {
        setState(() => isScrolled = true);
      } else if (_scroll.offset <= 80 && isScrolled) {
        setState(() => isScrolled = false);
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        logger.d('state is ${state.toString()}');
        String name = "Anonymous";
        String role = "Anonymous";
        String fullName = "Anonymous";
        String jobRole = "Anonymous";
        String email = "Anonymous";
        String whatsapp = "0000000000";

        if (state is ProfileLoaded && state.profile != null) {
          final profile = state.profile!;
          logger.d(profile.toString());
          name = profile.nama ?? "Anonymous";
          role = profile.peran ?? "Anonymous";
          fullName = profile.nama ?? "Anonymous";
          jobRole = profile.pekerjaan ?? profile.peran ?? "Admin";
          email = profile.email ?? "Anonymous";
          whatsapp = profile.noWa ?? "0000000000";
        }

        return Scaffold(
          extendBody: true, // 🔥 wajib agar AppBar tidak menutupi gradient
          extendBodyBehindAppBar:
              true, // 🔥 wajib agar AppBar tidak menutupi gradient
          backgroundColor:
              Colors.white, // agar background di bawah appbar menjadi putih

          bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: ButtonPrimary(
              color: AppColors.red4,
              mainButtonMessage: "Keluar",
              mainButton: () {
                // logout dengan hapus semua token dan data di shared preferences
                context.read<AuthenticationBloc>().add(LogoutEvent());
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.home,
                  (route) => false,
                );
              },
            ),
          ),

          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AnimatedTheme(
              data: Theme.of(context).copyWith(
                appBarTheme: AppBarTheme(
                  backgroundColor: isScrolled
                      ? Colors.white
                      : Colors.transparent,
                  elevation: isScrolled ? 1 : 0,
                  iconTheme: IconThemeData(color: AppColors.gray900),
                ),
              ),
              child: AppBar(
                leadingWidth: 30,
                leading: IconButton(
                  iconSize: 36,
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray900,
                  ),
                  child: const Text("Profile Pengguna"),
                ),
                centerTitle: false,
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: _scroll,
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                // 🔵 Background Gradient
                Container(
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: const [0.0, 0.8, 0.9, 1.0],
                      colors: [
                        AppColors.blue2,
                        AppColors.blue1.withValues(alpha: 0.5),
                        AppColors.blue1.withValues(alpha: 0.2),
                        AppColors.blue1.withValues(alpha: 0.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                // 🔵 Konten scroll
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: kToolbarHeight + 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.h),
                      Center(
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: AppColors.gray100,
                          child: Iconify(
                            MaterialSymbols.person_2_outline,
                            color: AppColors.gray900,
                            size: 50.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray900,
                          ),
                        ),
                      ),
                      // badge
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 8.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.green1,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4.w,
                            children: [
                              Iconify(
                                MaterialSymbols.person_2_outline,
                                color: AppColors.green5,
                                size: 20.w,
                              ),
                              Text(
                                role,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),
                      // informasi personal
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gray50,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 8.w,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Iconify(
                                  MaterialSymbols.person_3_outline_rounded,
                                  color: AppColors.gray900,
                                  size: 20.w,
                                ),
                                Text(
                                  "Informasi Personal",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.gray900,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Nama Lengkap",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray400,
                              ),
                            ),
                            Text(
                              fullName,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray900,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "Role/Pekerjaan",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray400,
                              ),
                            ),
                            Text(
                              jobRole,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray900,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // informasi kontak
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gray50,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 8.w,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Iconify(
                                  MaterialSymbols.phone_iphone_outline,
                                  color: AppColors.gray900,
                                  size: 20.w,
                                ),
                                Text(
                                  "Informasi Kontak",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.gray900,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray400,
                              ),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray900,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "WhatsApp",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray400,
                              ),
                            ),
                            Text(
                              whatsapp,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
