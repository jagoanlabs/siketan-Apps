import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/features/register/domain/model/desa_response_model.dart';
import 'package:siketan/features/register/domain/model/kecamatan_response_model.dart';
import 'package:siketan/features/register/domain/model/kelompok_all_response_model.dart';
import 'package:siketan/features/register/domain/repository/register_repository.dart';

part 'register_wilayah_binaan_event.dart';
part 'register_wilayah_binaan_state.dart';

class RegisterWilayahBinaanBloc
    extends Bloc<RegisterWilayahBinaanEvent, RegisterWilayahBinaanState> {
  final RegisterRepository registerRepository;
  RegisterWilayahBinaanBloc({required this.registerRepository})
    : super(RegisterWilayahBinaanState()) {
    on<RegisterWilayahBinaanEvent>((event, emit) {});

    /// Load kecamatan + kelompok awal
    on<LoadInitialWilayah>(_loadInitial);

    /// Ketika user memilih kecamatan
    on<SelectKecamatanEvent>(_selectKecamatan);

    /// Ketika user memilih desa
    on<SelectDesaEvent>(_selectDesa);

    /// Ketika user memilih kelompok
    on<SelectKelompokEvent>(_selectKelompok);
  }

  Future<void> _loadInitial(
    LoadInitialWilayah event,
    Emitter<RegisterWilayahBinaanState> emit,
  ) async {
    emit(state.copyWith(loadingKecamatan: true, loadingKelompok: true));

    try {
      final kecamatan = await registerRepository.getAllKecamatan();
      final kelompok = await registerRepository.getAllKelompok();

      emit(
        state.copyWith(
          loadingKecamatan: false,
          loadingKelompok: false,
          kecamatanList: kecamatan,
          allKelompokList: kelompok,
          kelompokList: kelompok, // tampilkan semua di awal (opsional)
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadingKecamatan: false, loadingKelompok: false));
      // Bisa tambahkan error handling
    }
  }

  Future<void> _selectKecamatan(
    SelectKecamatanEvent event,
    Emitter<RegisterWilayahBinaanState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedKecamatanId: event.kecamatanId,
        selectedDesaIds: [],
        selectedKelompokIds: [],
        loadingDesa: true,
        loadingKelompok: true,
      ),
    );

    try {
      // Fetch desa
      final desa = await registerRepository.getDesaByKecamatanId(
        event.kecamatanId,
      );

      // Ambil SEMUA kelompok dari allKelompokList
      final allKelompok = state.allKelompokList?.toList() ?? [];

      // Filter berdasarkan kecamatanId (int?)
      final filteredKelompok = allKelompok
          .where((k) => k.kecamatanId == event.kecamatanId)
          .toList();

      // Bangun ulang dataKelompok sebagai Map<String, DataKelompok>
      final filteredMap = <String, DataKelompok>{
        for (var k in filteredKelompok) k.id.toString(): k,
      };

      emit(
        state.copyWith(
          desaList: desa,
          loadingDesa: false,
          loadingKelompok: false,
          kelompokList: KelompokAllResponseModel(
            // message bisa diisi null atau dari state lama
            message: state.allKelompokList?.message,
            dataKelompok: filteredMap,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadingDesa: false, loadingKelompok: false));
      // Opsional: tambahkan error toast
    }
  }

  void _selectDesa(
    SelectDesaEvent event,
    Emitter<RegisterWilayahBinaanState> emit,
  ) {
    emit(state.copyWith(selectedDesaIds: event.desaIds));
  }

  void _selectKelompok(
    SelectKelompokEvent event,
    Emitter<RegisterWilayahBinaanState> emit,
  ) {
    emit(state.copyWith(selectedKelompokIds: event.kelompokIds));
  }
}
