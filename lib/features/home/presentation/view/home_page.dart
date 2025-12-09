import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/routes/route_name.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:siketan/features/home/domain/repository/home_repository.dart';
import 'package:siketan/features/home/presentation/bloc/berita_bloc.dart';
import 'package:siketan/features/home/presentation/bloc/kegiatan_bloc.dart';
import 'package:siketan/features/home/presentation/bloc/product_bloc.dart';
import 'package:siketan/features/home/presentation/widget/activity_card.dart';
import 'package:siketan/features/home/presentation/widget/horizontal_menu_widget.dart';
import 'package:siketan/features/home/presentation/widget/news_card.dart';
import 'package:siketan/features/home/presentation/widget/product_card.dart';
import 'package:siketan/features/home/presentation/widget/search_widget.dart';
import 'package:siketan/features/home/presentation/widget/welcome_card.dart';
import 'package:siketan/features/profile/domain/repository/profile_repository.dart';
import 'package:siketan/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:siketan/features/profile/presentation/bloc/profile_event.dart';
import 'package:siketan/features/profile/presentation/bloc/profile_state.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/primary_button_widget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class HomePage extends StatelessWidget {
  final void Function(int index)? onNavigateToTab;
  const HomePage({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // product bloc
        BlocProvider(
          create: (context) =>
              ProductBloc(homeRepository: getIt<HomeRepository>()),
        ),
        // kegiatan bloc
        BlocProvider(
          create: (context) =>
              KegiatanBloc(homeRepository: getIt<HomeRepository>()),
        ),
        // berita bloc
        BlocProvider(
          create: (context) =>
              BeritaBloc(homeRepository: getIt<HomeRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              ProfileBloc(profileRepository: getIt<ProfileRepository>()),
        ),
      ],
      child: HomePageView(onNavigateToTab: onNavigateToTab),
    );
  }
}

class HomePageView extends StatefulWidget {
  final void Function(int index)? onNavigateToTab;
  const HomePageView({super.key, this.onNavigateToTab});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.d("init state");
    context.read<ProfileBloc>().add(LoadUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray100,
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Chat',
        shape: const CircleBorder(),
        backgroundColor: AppColors.green0,
        onPressed: () {
          // aksi ketika icon search ditekan
          // debugPrint('Search clicked!');
          Navigator.pushNamed(context, RoutesName.twakto);
        },
        child: Iconify(
          Ph.chat_circle_dots_bold,
          color: AppColors.green4,
          size: 28.w,
        ),
      ),
      body: EasyRefresh(
        header: const ClassicHeader(
          showMessage: false,
          armedText: 'Lepaskan',
          dragText: 'Tarik ke bawah untuk refresh',
          failedText: 'Refresh gagal',
          readyText: 'Merefresh...',
          processingText: "Merefresh...",
          processedText: "Refresh berhasil",
        ),
        triggerAxis: Axis.vertical,
        onRefresh: () {
          logger.d('refresh');
          // aksi ketika icon search ditekan
          context.read<ProductBloc>().add(ProductEventFetch());
          context.read<KegiatanBloc>().add(KegiatanEventFetch());
          context.read<BeritaBloc>().add(BeritaEventFetch());
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  // Gambar background di dalam scroll, jadi akan discroll juga
                  Container(
                    width: double.infinity,
                    height: 300.h, // Sesuaikan tinggi background jika perlu
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageConfig.homeBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Konten utama
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔹 Header Section
                      SizedBox(height: 48.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: 16.h,
                        ),
                        child: Row(
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
                            BlocBuilder<
                              AuthenticationBloc,
                              AuthenticationState
                            >(
                              builder: (context, state) {
                                logger.d('state is  $state');
                                if (state is AuthenticationTrue) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.profile,
                                      );
                                    },
                                    child:
                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (context, state) {
                                            String foto = "";
                                            if (state is ProfileLoaded &&
                                                state.profile != null) {
                                              final profile = state.profile!;
                                              foto = profile.foto ?? "";
                                            }
                                            return Container(
                                              width: 50.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: foto.isNotEmpty
                                                    ? Colors.transparent
                                                    : AppColors.gray100,
                                              ),
                                              child: foto.isNotEmpty
                                                  ? ClipOval(
                                                      child: Image.network(
                                                        foto,
                                                        width: 50.w,
                                                        height: 50.h,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  : Iconify(
                                                      MaterialSymbols
                                                          .person_2_outline,
                                                      color: AppColors.gray900,
                                                      size: 28.w,
                                                    ),
                                            );
                                          },
                                        ),
                                  );
                                } else {
                                  return SizedBox(
                                    height: 36.h,
                                    width: 100.w,
                                    child: ButtonPrimary(
                                      isGradient: true,
                                      gradient: const LinearGradient(
                                        colors: [
                                          AppColors.blue5,
                                          AppColors.blue4,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      color: AppColors.blue4,
                                      mainButtonMessage: "Masuk",
                                      mainButton: () {
                                        Navigator.pushNamed(
                                          context,
                                          RoutesName.login,
                                        );
                                      },
                                      isLoading: false,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.h),

                      /// 🔍 Search bar
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: SearchBarWidget(
                          controller: _searchController,
                          onSearchTap: () {
                            // aksi ketika icon search ditekan

                            Navigator.pushNamed(
                              context,
                              RoutesName.searchGlobal,
                              arguments: _searchController.text,
                            );
                            debugPrint('Search clicked!');
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: WelcomeCard(),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: HorizontalMenuWidget(
                          onNavigateToTab: widget.onNavigateToTab,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ActivityCard(onNavigateToTab: widget.onNavigateToTab),
                      SizedBox(height: 16.h),
                      NewsCard(onNavigateToTab: widget.onNavigateToTab),
                      SizedBox(height: 16.h),
                      ProductCard(onNavigateToTab: widget.onNavigateToTab),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
