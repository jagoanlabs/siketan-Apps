part of 'register_wilayah_binaan_bloc.dart';

class RegisterWilayahBinaanState extends Equatable {
  final bool loadingKecamatan;
  final bool loadingDesa;
  final bool loadingKelompok;

  final KecamatanResponseModel? kecamatanList;
  final DesaResponseModel? desaList;
  final KelompokAllResponseModel? kelompokList;

  final int? selectedKecamatanId;
  final List<int> selectedDesaIds;
  final List<int> selectedKelompokIds;

  const RegisterWilayahBinaanState({
    this.loadingKecamatan = false,
    this.loadingDesa = false,
    this.loadingKelompok = false,
    this.kecamatanList,
    this.desaList,
    this.kelompokList,
    this.selectedKecamatanId,
    this.selectedDesaIds = const [],
    this.selectedKelompokIds = const [],
  });

  RegisterWilayahBinaanState copyWith({
    bool? loadingKecamatan,
    bool? loadingDesa,
    bool? loadingKelompok,
    KecamatanResponseModel? kecamatanList,
    DesaResponseModel? desaList,
    KelompokAllResponseModel? kelompokList,
    int? selectedKecamatanId,
    List<int>? selectedDesaIds,
    List<int>? selectedKelompokIds,
  }) {
    return RegisterWilayahBinaanState(
      loadingKecamatan: loadingKecamatan ?? this.loadingKecamatan,
      loadingDesa: loadingDesa ?? this.loadingDesa,
      loadingKelompok: loadingKelompok ?? this.loadingKelompok,
      kecamatanList: kecamatanList ?? this.kecamatanList,
      desaList: desaList ?? this.desaList,
      kelompokList: kelompokList ?? this.kelompokList,
      selectedKecamatanId: selectedKecamatanId ?? this.selectedKecamatanId,
      selectedDesaIds: selectedDesaIds ?? this.selectedDesaIds,
      selectedKelompokIds: selectedKelompokIds ?? this.selectedKelompokIds,
    );
  }

  @override
  List<Object?> get props => [
        loadingKecamatan,
        loadingDesa,
        loadingKelompok,
        kecamatanList,
        desaList,
        kelompokList,
        selectedKecamatanId,
        selectedDesaIds,
        selectedKelompokIds,
      ];
}
