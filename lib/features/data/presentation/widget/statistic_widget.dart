import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/features/data/presentation/bloc/chart_komoditas_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/error_widget.dart';
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
  String selectedYear = DateTime.now().year.toString();

  late List<String> years;

  @override
  void initState() {
    super.initState();

    years = List.generate(
      DateTime.now().year - 2021 + 1,
      (index) => (2021 + index).toString(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChartKomoditasBloc>().add(
        FetchChartYearEvent(int.parse(selectedYear)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartKomoditasBloc, ChartKomoditasState>(
      builder: (context, state) {
        final isLoading = state.loading;
        final hasData = state.chartData.isNotEmpty;
        final hasError = state.hasError;
        final errorMessage = state.errorMessage;

        /// Semua komoditas berasal dari data API (DYNAMIC)
        final dynamicCommodities = state.chartData.keys.toList()..sort();

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
                "Produksi Pertanian Berdasarkan Komoditas ${state.year}",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray900,
                ),
              ),

              SizedBox(height: 16.h),

              // ==========================
              // CHIP FILTER (DYNAMIC)
              // ==========================
              SizedBox(
                height: 34.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dynamicCommodities.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8.w),
                  itemBuilder: (context, index) {
                    final label = dynamicCommodities[index];
                    final isSelected = state.visibleCommodities.contains(label);

                    return _buildChip(
                      label: label,
                      isSelected: isSelected,
                      onPressed: () {
                        context.read<ChartKomoditasBloc>().add(
                          ToggleCommodityEvent(label),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 12.h),

              // Select Tahun
              SelectFieldWidget(
                value: selectedYear,
                hintText: 'Tahun',
                items: years,
                isEnable: true,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => selectedYear = value);
                  context.read<ChartKomoditasBloc>().add(
                    FetchChartYearEvent(int.parse(value)),
                  );
                },
              ),

              SizedBox(height: 20.h),

              // ==========================
              // LINE CHART OR ERROR STATE
              // ==========================
              SizedBox(
                height: 300.h,
                child: hasError
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              errorMessage ?? "Terjadi kesalahan",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.red4,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                context.read<ChartKomoditasBloc>().add(
                                  FetchChartYearEvent(int.parse(selectedYear)),
                                );
                              },
                              child: const Text("Coba Lagi"),
                            ),
                          ],
                        ),
                      )
                    : isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : !hasData
                    ? const Center(child: Text("Tidak ada data"))
                    : SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          interval: 1,
                          labelStyle: TextStyle(fontSize: 12.sp),
                          majorGridLines: MajorGridLines(
                            width: 0.5,
                            color: AppColors.gray200,
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          labelStyle: TextStyle(fontSize: 12.sp),
                          majorGridLines: MajorGridLines(
                            width: 0.5,
                            color: AppColors.gray200,
                          ),
                        ),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: _buildSeries(state),
                      ),
              ),

              SizedBox(height: 12.h),

              // ==========================
              // LEGEND (DYNAMIC)
              // ==========================
              Wrap(
                spacing: 20.w,
                children: state.visibleCommodities.map((label) {
                  return _buildLegendItem(_colorForCommodity(label), label);
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ================================
  /// BUILD SERIES FROM STATE
  /// ================================
  List<LineSeries<int, String>> _buildSeries(ChartKomoditasState state) {
    final List<LineSeries<int, String>> list = [];

    for (final commodity in state.visibleCommodities) {
      final data = state.chartData[commodity];
      if (data == null) continue;

      list.add(
        LineSeries<int, String>(
          dataSource: data,
          xValueMapper: (_, index) => state.months[index],
          yValueMapper: (value, _) => value,
          name: commodity,
          color: _colorForCommodity(commodity),
          width: 2,
          markerSettings: MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.circle,
            color: _colorForCommodity(commodity),
            borderColor: Colors.white,
            borderWidth: 2,
          ),
        ),
      );
    }

    return list;
  }

  /// ================================
  /// COLOR GENERATOR (CONSISTENT)
  /// ================================
  Color _colorForCommodity(String c) {
    int hash = c.toLowerCase().hashCode;
    return Color.fromARGB(
      255,
      (hash * 73) % 255,
      (hash * 91) % 255,
      (hash * 151) % 255,
    );
  }

  /// ================================
  /// CHIP UI
  /// ================================
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
          side: BorderSide(color: AppColors.green4),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        elevation: 0,
      ),
      child: Row(
        children: [
          if (isSelected)
            Iconify(MaterialSymbols.check, color: Colors.white, size: 12.w),
          if (isSelected) SizedBox(width: 4.w),
          Text(label, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8.w),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
