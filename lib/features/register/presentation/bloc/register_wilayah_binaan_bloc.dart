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

    final kecamatan = await registerRepository.getAllKecamatan();
    final kelompok = await registerRepository.getAllKelompok();

    emit(
      state.copyWith(
        loadingKecamatan: false,
        loadingKelompok: false,
        kecamatanList: kecamatan,
        kelompokList: kelompok,
      ),
    );
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

    /// 1. Ambil desa berdasarkan kecamatan
    final desa = await registerRepository.getDesaByKecamatanId(
      event.kecamatanId,
    );

    /// 2. Filter kelompok berdasarkan kecamatanId (lebih aman dari nama)
    final allKelompok = state.kelompokList?.dataKelompok?.values.toList() ?? [];

    final filteredKelompok = allKelompok
        .where((k) => k.kecamatanId == event.kecamatanId)
        .toList();

    emit(
      state.copyWith(
        desaList: desa,
        loadingDesa: false,
        loadingKelompok: false,
        kelompokList: KelompokAllResponseModel(
          dataKelompok: {for (var k in filteredKelompok) k.id!.toString(): k},
        ),
      ),
    );
  }

  void _selectDesa(
    SelectDesaEvent event,
    Emitter<RegisterWilayahBinaanState> emit,
  ) {
    final updatedList = List<int>.from(state.selectedDesaIds);

    if (updatedList.contains(event.desaId)) {
      updatedList.remove(event.desaId);
    } else {
      updatedList.add(event.desaId);
    }

    emit(state.copyWith(selectedDesaIds: updatedList));
  }

  void _selectKelompok(
    SelectKelompokEvent event,
    Emitter<RegisterWilayahBinaanState> emit,
  ) {
    final updatedList = List<int>.from(state.selectedKelompokIds);

    if (updatedList.contains(event.kelompokId)) {
      updatedList.remove(event.kelompokId);
    } else {
      updatedList.add(event.kelompokId);
    }

    emit(state.copyWith(selectedKelompokIds: updatedList));
  }
}
