import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/select_field_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticWidget extends StatelessWidget {
  const StatisticWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatisticWidgetView();
  }
}

class StatisticWidgetView extends StatefulWidget {
  const StatisticWidgetView({super.key});

  @override
  State<StatisticWidgetView> createState() => _StatisticWidgetViewState();
}

class _StatisticWidgetViewState extends State<StatisticWidgetView> {
  String selectedYear = '2025';
  List<String> years = ['2024', '2025', '2026'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: shadowMd,
      ),
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        children: [
          Text(
            "Produksi Pertanian Berdasarkan Komoditas $selectedYear",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.gray900,
            ),
          ),
          // chip
          SizedBox(height: 16.h),
          // Chip Filter
          SizedBox(
            height: 32.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildChip(
                  label: 'Jagung',
                  isSelected: true, // Aktif
                  onPressed: () {
                    debugPrint('Filter: Jagung');
                  },
                ),
                SizedBox(width: 8.w),
                _buildChip(
                  label: 'Kedelai',
                  isSelected: true, // Aktif
                  onPressed: () {
                    debugPrint('Filter: Kedelai');
                  },
                ),
                SizedBox(width: 8.w),
                _buildChip(
                  label: 'Semua',
                  isSelected: false, // Tidak aktif
                  onPressed: () {
                    debugPrint('Filter: Semua');
                  },
                ),
                SizedBox(width: 8.w),
                _buildChip(
                  label: 'Padi',
                  isSelected: false, // Tidak aktif
                  onPressed: () {
                    debugPrint('Filter: Padi');
                  },
                ),
                SizedBox(width: 8.w),
                _buildChip(
                  label: 'Sayur',
                  isSelected: false,
                  onPressed: () {
                    debugPrint('Filter: Sayur');
                  },
                ),
                SizedBox(width: 8.w),
                _buildChip(
                  label: 'Buah',
                  isSelected: false,
                  onPressed: () {
                    debugPrint('Filter: Buah');
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          // select Tahun
          SelectFieldWidget(
            isEnable: true,
            value: selectedYear,
            hintText: 'Tahun',
            items: years,
            onChanged: (value) {
              setState(() {
                selectedYear = value!;
              });
            },
          ),
          SizedBox(height: 20.h),
          // chart
          SizedBox(
            height: 300.h, // Set a fixed height for the chart
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: AppColors.gray200,
                ),
                labelStyle: TextStyle(fontSize: 12.sp),
                interval: 1, // Tampilkan semua bulan
              ),
              primaryYAxis: NumericAxis(
                minimum: 600,
                maximum: 900,
                interval: 100,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: AppColors.gray200,
                ),
                labelStyle: TextStyle(fontSize: 12.sp),
              ),
              series: [
                LineSeries<double, String>(
                  dataSource: [740, 730, 725], // Data Jagung: Jan, Feb, Mar
                  xValueMapper: (value, index) => ['Jan', 'Feb', 'Mar'][index],
                  yValueMapper: (value, _) => value,
                  name: 'Jagung',
                  color: AppColors.green4,
                  width: 2,
                  markerSettings: MarkerSettings(
                    isVisible: true,
                    shape: DataMarkerType.circle,
                    color: AppColors.green4,
                    borderColor: Colors.white,
                    borderWidth: 2,
                  ),
                ),
                LineSeries<double, String>(
                  dataSource: [640, 670, 680], // Data Kedelai: Jan, Feb, Mar
                  xValueMapper: (value, index) => ['Jan', 'Feb', 'Mar'][index],
                  yValueMapper: (value, _) => value,
                  name: 'Kedelai',
                  color: AppColors.red4,
                  width: 2,
                  markerSettings: MarkerSettings(
                    isVisible: true,
                    shape: DataMarkerType.circle,
                    color: AppColors.red4,
                    borderColor: Colors.white,
                    borderWidth: 2,
                  ),
                ),
              ],
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
          ),

          SizedBox(height: 8.h),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(AppColors.green4, 'Jagung'),
              SizedBox(width: 24.w),
              _buildLegendItem(AppColors.red4, 'Kedelai'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8.w),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: AppColors.gray900),
        ),
      ],
    );
  }
  Widget _buildChip({
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.green4 : Colors.white,
        foregroundColor: isSelected ? Colors.white : AppColors.green4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
          side: BorderSide(
            color: isSelected ? AppColors.green4 : AppColors.green4,
            width: 1.5,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.h,
        ), // Lebih kecil
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Iconify(
              MaterialSymbols.check,
              size: 12.w, // Ikon lebih kecil
              color: Colors.white,
            ),
          if (isSelected) SizedBox(width: 4.w), // Jarak lebih kecil
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp, // Ukuran teks tetap
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.green4,
            ),
          ),
        ],
      ),
    );
  }
}
