part of 'chart_komoditas_bloc.dart';

sealed class ChartKomoditasEvent extends Equatable {
  const ChartKomoditasEvent();

  @override
  List<Object> get props => [];
}

class FetchChartYearEvent extends ChartKomoditasEvent {
  final int year;

  const FetchChartYearEvent(this.year);
}

class ToggleCommodityEvent extends ChartKomoditasEvent {
  final String commodity;
  const ToggleCommodityEvent(this.commodity);
}
