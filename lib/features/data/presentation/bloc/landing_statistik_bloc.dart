import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/features/data/domain/model/landing_statistik_response_model.dart';
import 'package:siketan/features/data/domain/repository/data_repository.dart';
part 'landing_statistik_event.dart';
part 'landing_statistik_state.dart';

class LandingStatistikBloc
    extends Bloc<LandingStatistikEvent, LandingStatistikState> {
  final DataRepository dataRepository;
  LandingStatistikBloc({required this.dataRepository})
    : super(LandingStatistikInitial()) {
    on<LandingStatistikEvent>((event, emit) {});
    on<LandingStatistikFetchEvent>(_fetchLandingStatistik);
  }

  Future<void> _fetchLandingStatistik(
    LandingStatistikFetchEvent event,
    Emitter<LandingStatistikState> emit,
  ) async {
    emit(LandingStatistikLoading());
    try {
      final result = await dataRepository.getLandingStatistik();
      emit(LandingStatistikLoaded(data: result));
    } catch (e) {
      emit(LandingStatistikError(message: e.toString()));
    }
  }
}
