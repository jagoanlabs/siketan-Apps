import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_payload_model.dart';
import 'package:siketan/features/cek-nik/domain/model/cek_nik_response_model.dart';
import 'package:siketan/features/cek-nik/domain/repository/cek_nik_repository.dart';

part 'cek_nik_event.dart';
part 'cek_nik_state.dart';

class CekNikBloc extends Bloc<CekNikEvent, CekNikState> {
  final CekNikRepository cekNikRepository;
  CekNikBloc({required this.cekNikRepository}) : super(CekNikInitial()) {
    on<CekNikEvent>((event, emit) {});
    on<CekNikEventPostCekNik>(_postCekNik);
  }

  Future<void> _postCekNik(
    CekNikEventPostCekNik event,
    Emitter<CekNikState> emit,
  ) async {
    emit(CekNikLoading());
    try {
      emit(CekNikProcessing(payload: event.payload));
      final result = await cekNikRepository.postCekNik(event.payload);
      emit(CekNikSuccess(data: result));
    } catch (e) {
      emit(CekNikError(message: handleAppError(e)));
    }
  }
}
