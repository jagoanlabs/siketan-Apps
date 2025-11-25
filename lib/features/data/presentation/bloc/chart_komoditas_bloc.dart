import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/features/data/domain/repository/data_repository.dart';

part 'chart_komoditas_event.dart';
part 'chart_komoditas_state.dart';

class ChartKomoditasBloc
    extends Bloc<ChartKomoditasEvent, ChartKomoditasState> {
  final DataRepository dataRepository;
  ChartKomoditasBloc({required this.dataRepository})
    : super(ChartKomoditasInitial()) {
    on<FetchChartYearEvent>(_onFetchYear);
    on<ToggleCommodityEvent>(_onToggleCommodity);
  }
  Future<void> _onFetchYear(
    FetchChartYearEvent event,
    Emitter<ChartKomoditasState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    Map<String, List<int>> merged = {};

    // Loop month 1–12
    for (int month = 1; month <= 12; month++) {
      final resp = await dataRepository.getChartStatistik(month, event.year);

      final statistik = resp.data?.statistik ?? [];

      for (final item in statistik) {
        final name = item.komoditas ?? "";
        final count = item.count ?? 0;

        merged.putIfAbsent(name, () => List.filled(12, 0));
        merged[name]![month - 1] = count;
      }
    }

    emit(
      state.copyWith(
        loading: false,
        chartData: merged,
        visibleCommodities: merged.keys.toList(),
        year: event.year,
      ),
    );
  }

  void _onToggleCommodity(
    ToggleCommodityEvent event,
    Emitter<ChartKomoditasState> emit,
  ) {
    final list = List<String>.from(state.visibleCommodities);

    if (list.contains(event.commodity)) {
      list.remove(event.commodity);
    } else {
      list.add(event.commodity);
    }

    emit(state.copyWith(visibleCommodities: list));
  }
}
