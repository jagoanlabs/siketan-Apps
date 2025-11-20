import 'package:json_annotation/json_annotation.dart';

part 'desa_response_model.g.dart';
@JsonSerializable()
class DesaResponseModel {
    @JsonKey(name: "status")
    String? status;
    @JsonKey(name: "data")
    List<Datum>? data;

    DesaResponseModel({
        this.status,
        this.data,
    });

    factory DesaResponseModel.fromJson(Map<String, dynamic> json) => _$DesaResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$DesaResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "kecamatanId")
    int? kecamatanId;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;

    Datum({
        this.id,
        this.nama,
        this.kecamatanId,
        this.type,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}