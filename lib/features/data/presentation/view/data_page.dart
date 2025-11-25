import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/helper/format_currency_helper.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/data/domain/model/landing_statistik_response_model.dart';
import 'package:siketan/features/data/domain/repository/data_repository.dart';
import 'package:siketan/features/data/presentation/bloc/chart_komoditas_bloc.dart';
import 'package:siketan/features/data/presentation/bloc/komoditas_table_bloc.dart';
import 'package:siketan/features/data/presentation/bloc/landing_statistik_bloc.dart';
import 'package:siketan/features/data/presentation/widget/statistic_widget.dart';
import 'package:siketan/features/data/presentation/widget/table_widget.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/banner_home_widget.dart';
import 'package:siketan/shared/widget/select_field_widget.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LandingStatistikBloc(dataRepository: getIt<DataRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              KomoditasTableBloc(dataRepository: getIt<DataRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              ChartKomoditasBloc(dataRepository: getIt<DataRepository>()),
        ),
      ],
      child: const DataPageView(),
    );
  }
}

class DataPageView extends StatefulWidget {
  const DataPageView({super.key});

  @override
  State<DataPageView> createState() => _DataPageViewState();
}

class _DataPageViewState extends State<DataPageView> {
  @override
  void initState() {
    context.read<LandingStatistikBloc>().add(LandingStatistikFetchEvent());
    context.read<KomoditasTableBloc>().add(FetchKomoditasTable(1, 10, 'asc'));
    context.read<ChartKomoditasBloc>().add(FetchChartYearEvent(2025));
    super.initState();
  }

  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
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
          logger.d('refresh scroll offset ${_scrollOffset}');
          if (_scrollOffset > 50) {
            // Jika sudah scroll jauh ke bawah, batalkan refresh
            logger.d('❌ Skip refresh karena scroll offset = $_scrollOffset');
            return;
          } else {
            logger.d('✅ Jalankan refresh ${DateTime.now().toString()}');
            context.read<LandingStatistikBloc>().add(
              LandingStatistikFetchEvent(),
            );
            context.read<KomoditasTableBloc>().add(
              FetchKomoditasTable(1, 10, 'asc'),
            );
          }
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  // Gradient Background (scrollable)
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 72.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          "Data Pertanian",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray900,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      BannerHomeWidget(
                        title: 'Data Pertanian',
                        subtitle:
                            'Informasi Statistik Data Pertanian di Kab. Ngawi',
                      ),
                      SizedBox(height: 16.h),

                      // Statistik Cards (Layout 2 kolom + 1 full)
                      SizedBox(height: 16.h),
                      BlocBuilder<LandingStatistikBloc, LandingStatistikState>(
                        builder: (context, state) {
                          if (state is LandingStatistikLoading) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: ShimmerContainerWidget(
                                width: double.infinity,
                                height: 200.h,
                              ),
                            );
                          }
                          if (state is LandingStatistikLoaded) {
                            return _buildStatistic(state.data);
                          }
                          if (state is LandingStatistikError) {
                            return Center(child: Text(state.message));
                          }
                          return const SizedBox();
                        },
                      ),
                      SizedBox(height: 16.h),
                      StatisticWidget(),
                      SizedBox(height: 16.h),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onVerticalDragUpdate: (_) {},
                        onVerticalDragDown: (_) {},
                        onVerticalDragCancel: () {},
                        onVerticalDragEnd: (details) {
                          _scrollOffset = details.primaryVelocity ?? 0;
                        },
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            // Block pull-to-refresh ketika scroll di tabel
                            if (notification is ScrollStartNotification ||
                                notification is ScrollUpdateNotification) {
                              return true; // Consume the notification
                            }
                            return false;
                          },
                          child: TableWidget(),
                        ),
                      ),
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

  // Widget Reusable untuk Statistik Card
  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    required Color backgroundColor,
    bool isFullWidth = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          left: BorderSide(color: color, width: 4.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray700,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // Banner Sawah

  Widget _buildStatistic(LandingStatstikResponseModel response) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: shadowSm,
        ),
        child: Column(
          children: [
            // Baris 1: Jumlah Petani & Kelompok Petani
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'Jumlah Petani',
                    value: (response.data?.ringkasan?.jumlahPetani ?? 0)
                        .toString(),
                    color: AppColors.green4,
                    backgroundColor: AppColors.green0,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildStatCard(
                    title: 'Kelompok Petani',
                    value: (response.data?.ringkasan?.jumlahGapoktan ?? 0)
                        .toString(),
                    color: AppColors.blue4,
                    backgroundColor: AppColors.blue0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Baris 2: Penyuluh & Komoditas
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'Penyuluh',
                    value: (response.data?.ringkasan?.jumlahPenyuluh ?? 0)
                        .toString(),
                    color: AppColors.red4,
                    backgroundColor: AppColors.red05,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildStatCard(
                    title: 'Komoditas',
                    value: (response.data?.ringkasan?.jumlahKomoditas ?? 0)
                        .toString(),
                    color: AppColors.red2,
                    backgroundColor: AppColors.red05,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Baris 3: Area Pertanian (full width)
            _buildStatCard(
              title: 'Area Pertanian',
              value: FormatCurrencyHelper.formatLargeNumber(
                response.data?.ringkasan?.areaPertanian ?? 0,
              ),
              color: AppColors.yellow4,
              backgroundColor: AppColors.yellow05,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
