import 'package:json_annotation/json_annotation.dart';

part 'kegiatan_petani_response_model.g.dart';

@JsonSerializable()
class KegiatanPetaniResponseModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "infotani")
    List<Infotani>? infotani;

    KegiatanPetaniResponseModel({
        this.message,
        this.infotani,
    });

    factory KegiatanPetaniResponseModel.fromJson(Map<String, dynamic> json) => _$KegiatanPetaniResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$KegiatanPetaniResponseModelToJson(this);
}

@JsonSerializable()
class Infotani {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "namaKegiatan")
    String? namaKegiatan;
    @JsonKey(name: "tanggalAcara")
    DateTime? tanggalAcara;
    @JsonKey(name: "waktuAcara")
    String? waktuAcara;
    @JsonKey(name: "tempat")
    String? tempat;
    @JsonKey(name: "peserta")
    String? peserta;
    @JsonKey(name: "fotoKegiatan")
    String? fotoKegiatan;
    @JsonKey(name: "createdBy")
    String? createdBy;
    @JsonKey(name: "isi")
    String? isi;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "deletedAt")
    dynamic deletedAt;

    Infotani({
        this.id,
        this.namaKegiatan,
        this.tanggalAcara,
        this.waktuAcara,
        this.tempat,
        this.peserta,
        this.fotoKegiatan,
        this.createdBy,
        this.isi,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Infotani.fromJson(Map<String, dynamic> json) => _$InfotaniFromJson(json);

    Map<String, dynamic> toJson() => _$InfotaniToJson(this);
}
