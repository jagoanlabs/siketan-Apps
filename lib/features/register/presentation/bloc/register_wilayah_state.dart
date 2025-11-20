part of 'register_wilayah_bloc.dart';

class RegisterWilayahState extends Equatable {
  final bool loadingKecamatan;
  final bool loadingDesa;
  final KecamatanResponseModel? kecamatanList;
  final DesaResponseModel? desaList;
  final int? selectedKecamatanId;
  final int? selectedDesaId;
  final String? errorMessage;

  const RegisterWilayahState({
    this.loadingKecamatan = false,
    this.loadingDesa = false,
    this.kecamatanList,
    this.desaList,
    this.selectedKecamatanId,
    this.selectedDesaId,
    this.errorMessage,
  });

  RegisterWilayahState copyWith({
    bool? loadingKecamatan,
    bool? loadingDesa,
    KecamatanResponseModel? kecamatanList,
    DesaResponseModel? desaList,
    int? selectedKecamatanId,
    int? selectedDesaId,
    String? errorMessage,
  }) {
    return RegisterWilayahState(
      loadingKecamatan: loadingKecamatan ?? this.loadingKecamatan,
      loadingDesa: loadingDesa ?? this.loadingDesa,
      kecamatanList: kecamatanList ?? this.kecamatanList,
      desaList: desaList ?? this.desaList,
      selectedKecamatanId: selectedKecamatanId ?? this.selectedKecamatanId,
      selectedDesaId: selectedDesaId ?? this.selectedDesaId,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    loadingKecamatan,
    loadingDesa,
    kecamatanList,
    desaList,
    selectedKecamatanId,
    selectedDesaId,
    errorMessage,
  ];
}
