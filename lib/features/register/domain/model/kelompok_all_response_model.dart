import 'package:json_annotation/json_annotation.dart';

part 'kelompok_all_response_model.g.dart';
@JsonSerializable()
class KelompokAllResponseModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "dataKelompok")
    Map<String, DataKelompok>? dataKelompok;

    KelompokAllResponseModel({
        this.message,
        this.dataKelompok,
    });

    factory KelompokAllResponseModel.fromJson(Map<String, dynamic> json) => _$KelompokAllResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$KelompokAllResponseModelToJson(this);
}

@JsonSerializable()
class DataKelompok {
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
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "kecamatanId")
    int? kecamatanId;
    @JsonKey(name: "desaId")
    int? desaId;

    DataKelompok({
        this.id,
        this.gapoktan,
        this.namaKelompok,
        this.desa,
        this.kecamatan,
        this.penyuluh,
        this.createdAt,
        this.updatedAt,
        this.kecamatanId,
        this.desaId,
    });

    factory DataKelompok.fromJson(Map<String, dynamic> json) => _$DataKelompokFromJson(json);

    Map<String, dynamic> toJson() => _$DataKelompokToJson(this);
}


extension KelompokMapper on KelompokAllResponseModel {
  List<DataKelompok> toList() {
    return dataKelompok?.values.toList() ?? [];
  }
}
