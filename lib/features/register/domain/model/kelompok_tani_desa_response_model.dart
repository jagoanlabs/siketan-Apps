import 'package:json_annotation/json_annotation.dart';

part 'kelompok_tani_desa_response_model.g.dart';

@JsonSerializable()
class KelompokTaniDesaResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "kelompokTani")
  List<KelompokTaniItem>? kelompokTani;

  KelompokTaniDesaResponseModel({
    this.message,
    this.kelompokTani,
  });

  factory KelompokTaniDesaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$KelompokTaniDesaResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$KelompokTaniDesaResponseModelToJson(this);
}

@JsonSerializable()
class KelompokTaniItem {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "gapoktan")
  String? gapoktan;
  @JsonKey(name: "namaKelompok")
  String? namaKelompok;
  @JsonKey(name: "desa")
  String? desa;
  @JsonKey(name: "kecamatan")
  String? kecamatan;
  @JsonKey(name: "penyuluh")
  String? penyuluh;
  @JsonKey(name: "kecamatanId")
  int? kecamatanId;
  @JsonKey(name: "desaId")
  int? desaId;

  KelompokTaniItem({
    this.id,
    this.gapoktan,
    this.namaKelompok,
    this.desa,
    this.kecamatan,
    this.penyuluh,
    this.kecamatanId,
    this.desaId,
  });

  factory KelompokTaniItem.fromJson(Map<String, dynamic> json) =>
      _$KelompokTaniItemFromJson(json);

  Map<String, dynamic> toJson() => _$KelompokTaniItemToJson(this);
}
