import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/features/data/domain/model/komoditas_statistik_response_model.dart';
import 'package:siketan/features/data/domain/repository/data_repository.dart';

part 'komoditas_table_event.dart';
part 'komoditas_table_state.dart';

class KomoditasTableBloc
    extends Bloc<KomoditasTableEvent, KomoditasTableState> {
  final DataRepository dataRepository;
  KomoditasTableBloc({required this.dataRepository})
    : super(KomoditasTableState()) {
    on<KomoditasTableEvent>((event, emit) {});
    on<FetchKomoditasTable>(_onFetch);
  }

  Future<void> _onFetch(
    FetchKomoditasTable event,
    Emitter<KomoditasTableState> emit,
  ) async {
    try {
      emit(state.copyWith(loading: true));

      final res = await dataRepository.getKomoditasStatistik(
        event.page,
        event.limit,
        event.sort,
      );

      emit(
        state.copyWith(
          loading: false,
          total: res.total ?? 0,
          rows: res.data ?? [],
        ),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
