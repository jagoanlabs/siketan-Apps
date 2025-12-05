import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/home/domain/model/berita_petani_response_model.dart';
import 'package:siketan/features/home/domain/repository/home_repository.dart';

part 'berita_event.dart';
part 'berita_state.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  final HomeRepository homeRepository;
  BeritaBloc({required this.homeRepository}) : super(BeritaInitial()) {
    on<BeritaEvent>((event, emit) {});
    on<BeritaEventFetch>(_beritaFetch);
  }

  Future<void> _beritaFetch(
    BeritaEventFetch event,
    Emitter<BeritaState> emit,
  ) async {
    emit(BeritaLoading());
    try {
      final berita = await homeRepository.getBeritaPetani();
      emit(BeritaLoaded(berita: berita));
    } catch (e) {
      emit(BeritaError(message: handleAppError(e)));
    }
  }
}
