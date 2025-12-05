part of 'chart_komoditas_bloc.dart';

class ChartKomoditasState extends Equatable {
  final bool loading;
  final Map<String, List<int>> chartData; // komoditas → data 12 bulan
  final List<String> visibleCommodities; // ON/OFF chip
  final int year;
  final List<String> months; // label chart
  final String? errorMessage;
  final bool hasError;

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
    this.errorMessage,
    this.hasError = false,
  });

  ChartKomoditasState copyWith({
    bool? loading,
    Map<String, List<int>>? chartData,
    List<String>? visibleCommodities,
    int? year,
    String? errorMessage,
    bool? hasError,
  }) {
    return ChartKomoditasState(
      loading: loading ?? this.loading,
      chartData: chartData ?? this.chartData,
      visibleCommodities: visibleCommodities ?? this.visibleCommodities,
      year: year ?? this.year,
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object> get props => [loading, chartData, visibleCommodities, year, hasError, errorMessage ?? ""];
}

final class ChartKomoditasInitial extends ChartKomoditasState {}
