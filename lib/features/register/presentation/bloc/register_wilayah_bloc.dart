import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/register/domain/model/desa_response_model.dart';
import 'package:siketan/features/register/domain/model/kecamatan_response_model.dart';
import 'package:siketan/features/register/domain/repository/register_repository.dart';

part 'register_wilayah_event.dart';
part 'register_wilayah_state.dart';

class RegisterWilayahBloc
    extends Bloc<RegisterWilayahEvent, RegisterWilayahState> {
  final RegisterRepository registerRepository;
  RegisterWilayahBloc({required this.registerRepository})
    : super(RegisterWilayahState()) {
    on<RegisterWilayahEvent>((event, emit) {});
    on<GetAllKecamatanEvent>(_getAllKecamatan);
    on<GetDesaByKecamatanEvent>(_getDesaByKecamatan);
  }
  Future<void> _getAllKecamatan(
    GetAllKecamatanEvent event,
    Emitter<RegisterWilayahState> emit,
  ) async {
    emit(state.copyWith(loadingKecamatan: true));
    try {
      final res = await registerRepository.getAllKecamatan();
      emit(state.copyWith(loadingKecamatan: false, kecamatanList: res));
    } catch (e) {
      emit(
        state.copyWith(
          loadingKecamatan: false,
          errorMessage: handleAppError(e),
        ),
      );
    }
  }

  Future<void> _getDesaByKecamatan(
    GetDesaByKecamatanEvent event,
    Emitter<RegisterWilayahState> emit,
  ) async {
    emit(state.copyWith(loadingDesa: true));
    try {
      final res = await registerRepository.getDesaByKecamatanId(
        event.kecamatanId,
      );
      emit(state.copyWith(loadingDesa: false, desaList: res));
    } catch (e) {
      emit(state.copyWith(loadingDesa: false, errorMessage: handleAppError(e)));
    }
  }
}
