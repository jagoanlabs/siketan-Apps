import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/data/presentation/widget/statistic_widget.dart';
import 'package:siketan/features/data/presentation/widget/table_widget.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/banner_home_widget.dart';
import 'package:siketan/shared/widget/select_field_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataPageView();
  }
}

class DataPageView extends StatefulWidget {
  const DataPageView({super.key});

  @override
  State<DataPageView> createState() => _DataPageViewState();
}

class _DataPageViewState extends State<DataPageView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                BannerHomeWidget(title: 'Data Pertanian', subtitle: 'Informasi Statistik Data Pertanian di Kab. Ngawi'),
                SizedBox(height: 16.h),

                // Statistik Cards (Layout 2 kolom + 1 full)
                SizedBox(height: 16.h),
                _buildStatistic(),
                SizedBox(height: 16.h),
                StatisticWidget(),
                SizedBox(height: 16.h),
                TableWidget(),
              ],
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
  

  Widget _buildStatistic() {
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
                    value: '2.192',
                    color: AppColors.green4,
                    backgroundColor: AppColors.green0,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildStatCard(
                    title: 'Kelompok Petani',
                    value: '1.121',
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
                    value: '165',
                    color: AppColors.red4,
                    backgroundColor: AppColors.red05,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildStatCard(
                    title: 'Komoditas',
                    value: '39',
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
              value: '2 juta ha',
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
