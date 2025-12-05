import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/home/domain/model/kegiatan_petani_response_model.dart';
import 'package:siketan/features/home/domain/repository/home_repository.dart';

part 'kegiatan_event.dart';
part 'kegiatan_state.dart';

class KegiatanBloc extends Bloc<KegiatanEvent, KegiatanState> {
  final HomeRepository homeRepository;
  KegiatanBloc({required this.homeRepository}) : super(KegiatanInitial()) {
    on<KegiatanEvent>((event, emit) {});
    on<KegiatanEventFetch>(_kegiatanFetch);
  }

  Future<void> _kegiatanFetch(
    KegiatanEventFetch event,
    Emitter<KegiatanState> emit,
  ) async {
    emit(KegiatanLoading());
    try {
      final kegiatan = await homeRepository.getKegiatanPetani();
      emit(KegiatanLoaded(kegiatan: kegiatan));
    } catch (e) {
      emit(KegiatanError(message: handleAppError(e)));
    }
  }
}
