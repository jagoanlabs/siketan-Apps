part of 'chart_komoditas_bloc.dart';

class ChartKomoditasState extends Equatable {
  final bool loading;
  final Map<String, List<int>> chartData; // komoditas → data 12 bulan
  final List<String> visibleCommodities; // ON/OFF chip
  final int year;
  final List<String> months; // label chart
  const ChartKomoditasState({
    this.loading = false,
    this.chartData = const {},
    this.visibleCommodities = const [],
    this.months = const [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ],
    this.year = 2025,
  });
  ChartKomoditasState copyWith({
    bool? loading,
    Map<String, List<int>>? chartData,
    List<String>? visibleCommodities,
    int? year,
  }) {
    return ChartKomoditasState(
      loading: loading ?? this.loading,
      chartData: chartData ?? this.chartData,
      visibleCommodities: visibleCommodities ?? this.visibleCommodities,
      year: year ?? this.year,
    );
  }

  @override
  List<Object> get props => [loading, chartData, visibleCommodities, year];
}

final class ChartKomoditasInitial extends ChartKomoditasState {}
