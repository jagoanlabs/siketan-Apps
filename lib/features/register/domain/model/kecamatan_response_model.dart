import 'package:json_annotation/json_annotation.dart';

part 'kecamatan_response_model.g.dart';

@JsonSerializable()
class KecamatanResponseModel {
    @JsonKey(name: "status")
    String? status;
    @JsonKey(name: "data")
    List<Datum>? data;

    KecamatanResponseModel({
        this.status,
        this.data,
    });

    factory KecamatanResponseModel.fromJson(Map<String, dynamic> json) => _$KecamatanResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$KecamatanResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;

    Datum({
        this.id,
        this.nama,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}
