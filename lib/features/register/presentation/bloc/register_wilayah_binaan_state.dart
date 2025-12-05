part of 'register_wilayah_binaan_bloc.dart';

class RegisterWilayahBinaanState extends Equatable {
  final bool loadingKecamatan;
  final bool loadingDesa;
  final bool loadingKelompok;

  final KecamatanResponseModel? kecamatanList;
  final DesaResponseModel? desaList;
  final KelompokAllResponseModel? kelompokList; // untuk tampilan saat ini
  final KelompokAllResponseModel? allKelompokList; // data asli semua kelompok

  final int? selectedKecamatanId;
  final List<int> selectedDesaIds;
  final List<int> selectedKelompokIds;

  // Error handling properties
  final String? errorKecamatan;
  final String? errorDesa;
  final String? errorKelompok;

  const RegisterWilayahBinaanState({
    this.loadingKecamatan = false,
    this.loadingDesa = false,
    this.loadingKelompok = false,
    this.kecamatanList,
    this.desaList,
    this.kelompokList,
    this.allKelompokList,
    this.selectedKecamatanId,
    this.selectedDesaIds = const [],
    this.selectedKelompokIds = const [],
    this.errorKecamatan,
    this.errorDesa,
    this.errorKelompok,
  });

  RegisterWilayahBinaanState copyWith({
    bool? loadingKecamatan,
    bool? loadingDesa,
    bool? loadingKelompok,
    KecamatanResponseModel? kecamatanList,
    DesaResponseModel? desaList,
    KelompokAllResponseModel? kelompokList,
    KelompokAllResponseModel? allKelompokList,
    int? selectedKecamatanId,
    List<int>? selectedDesaIds,
    List<int>? selectedKelompokIds,
    String? errorKecamatan,
    String? errorDesa,
    String? errorKelompok,
  }) {
    return RegisterWilayahBinaanState(
      loadingKecamatan: loadingKecamatan ?? this.loadingKecamatan,
      loadingDesa: loadingDesa ?? this.loadingDesa,
      loadingKelompok: loadingKelompok ?? this.loadingKelompok,
      kecamatanList: kecamatanList ?? this.kecamatanList,
      desaList: desaList ?? this.desaList,
      kelompokList: kelompokList ?? this.kelompokList,
      allKelompokList: allKelompokList ?? this.allKelompokList,
      selectedKecamatanId: selectedKecamatanId ?? this.selectedKecamatanId,
      selectedDesaIds: selectedDesaIds ?? this.selectedDesaIds,
      selectedKelompokIds: selectedKelompokIds ?? this.selectedKelompokIds,
      errorKecamatan: errorKecamatan ?? this.errorKecamatan,
      errorDesa: errorDesa ?? this.errorDesa,
      errorKelompok: errorKelompok ?? this.errorKelompok,
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
        allKelompokList,
        selectedKecamatanId,
        selectedDesaIds,
        selectedKelompokIds,
        errorKecamatan,
        errorDesa,
        errorKelompok,
      ];
}
