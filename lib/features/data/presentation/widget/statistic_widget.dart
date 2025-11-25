import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/features/data/presentation/bloc/chart_komoditas_bloc.dart';
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
  String selectedYear = DateTime.now().year.toString();

  /// semua jenis komoditas (default list UI — tidak menjadi sumber kebenaran)
  final List<String> uiCommodities = [
    "Jagung",
    "Kedelai",
    "Padi",
    "Sayur",
    "Buah",
    "Semua",
  ];

  late List<String> years;

  @override
  void initState() {
    super.initState();
    years = List.generate(
      DateTime.now().year - 2021 + 1,
      (index) => (2021 + index).toString(),
    );

    // initial fetch
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
        // show loading while fetching
        final isLoading = state.loading;
        final hasData = state.chartData.isNotEmpty;

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

              // ===== CHIP FILTER =====
              SizedBox(
                height: 32.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: uiCommodities.length,
                  separatorBuilder: (c, i) => SizedBox(width: 8.w),
                  itemBuilder: (context, index) {
                    final label = uiCommodities[index];
                    final isSelected = state.visibleCommodities.contains(label);

                    return _buildChip(
                      label: label,
                      isSelected: isSelected,
                      onPressed: () {
                        if (label == "Semua") {
                          // jika "Semua" ditekan -> make visible semua yang ada di chartData
                          final allKeys = state.chartData.keys.toList();
                          // jika semua sudah visible -> clear all; sebaliknya set all
                          final allVisible = allKeys.every(
                            (k) => state.visibleCommodities.contains(k),
                          );
                          if (allVisible) {
                            // hide all
                            for (final k in allKeys) {
                              context.read<ChartKomoditasBloc>().add(
                                ToggleCommodityEvent(k),
                              );
                            }
                          } else {
                            // show all (toggle those not visible)
                            for (final k in allKeys) {
                              if (!state.visibleCommodities.contains(k)) {
                                context.read<ChartKomoditasBloc>().add(
                                  ToggleCommodityEvent(k),
                                );
                              }
                            }
                          }
                        } else {
                          context.read<ChartKomoditasBloc>().add(
                            ToggleCommodityEvent(label),
                          );
                        }
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 12.h),

              // ===== SELECT TAHUN =====
              SelectFieldWidget(
                isEnable: true,
                value: selectedYear,
                hintText: 'Tahun',
                items: years,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => selectedYear = value);
                  context.read<ChartKomoditasBloc>().add(
                    FetchChartYearEvent(int.parse(value)),
                  );
                },
              ),

              SizedBox(height: 20.h),

              // ===== CHART =====
              SizedBox(
                height: 300.h,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : (!hasData)
                    ? const Center(child: Text("Tidak ada data"))
                    : SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          interval: 1,
                          majorGridLines: MajorGridLines(
                            width: 0.5,
                            color: AppColors.gray200,
                          ),
                          labelStyle: TextStyle(fontSize: 12.sp),
                          // gunakan label bulan dari state
                        ),
                        primaryYAxis: NumericAxis(
                          majorGridLines: MajorGridLines(
                            width: 0.5,
                            color: AppColors.gray200,
                          ),
                          labelStyle: TextStyle(fontSize: 12.sp),
                        ),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: _buildSeriesFromState(state),
                      ),
              ),

              SizedBox(height: 12.h),

              // ===== LEGEND (show only visible ones) =====
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

  List<LineSeries<int, String>> _buildSeriesFromState(
    ChartKomoditasState state,
  ) {
    final months = state.months; // ["Jan", "Feb", ...]
    final List<LineSeries<int, String>> series = [];

    for (final commodity in state.visibleCommodities) {
      final values = state.chartData[commodity];
      if (values == null) continue;

      // ensure length 12
      final ms = List<int>.from(values);
      if (ms.length < 12) {
        ms.addAll(List.filled(12 - ms.length, 0));
      } else if (ms.length > 12) {
        ms.removeRange(12, ms.length);
      }

      series.add(
        LineSeries<int, String>(
          dataSource: ms,
          xValueMapper: (value, index) => months[index],
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

    return series;
  }

  Color _colorForCommodity(String c) {
    switch (c.toLowerCase()) {
      case "jagung":
        return AppColors.green4;
      case "kedelai":
        return AppColors.red4;
      case "padi":
        return AppColors.blue4;
      case "sayur":
        return AppColors.yellow4;
      case "buah":
        return Colors.purple;
      default:
        // random-ish fallback (ke konsisten gunakan warna fixed)
        return Colors.grey;
    }
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
          side: BorderSide(color: AppColors.green4, width: 1.5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        elevation: 0,
      ),
      child: Row(
        children: [
          if (isSelected)
            Iconify(MaterialSymbols.check, size: 12.w, color: Colors.white),
          if (isSelected) SizedBox(width: 4.w),
          Text(label, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }
}
