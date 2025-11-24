import 'package:json_annotation/json_annotation.dart';

part 'berita_petani_response_model.g.dart';

@JsonSerializable()
class BeritaPetaniResponseModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "infotani")
    List<Infotani>? infotani;

    BeritaPetaniResponseModel({
        this.message,
        this.infotani,
    });

    factory BeritaPetaniResponseModel.fromJson(Map<String, dynamic> json) => _$BeritaPetaniResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$BeritaPetaniResponseModelToJson(this);
}

@JsonSerializable()
class Infotani {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "judul")
    String? judul;
    @JsonKey(name: "tanggal")
    DateTime? tanggal;
    @JsonKey(name: "status")
    dynamic status;
    @JsonKey(name: "kategori")
    Kategori? kategori;
    @JsonKey(name: "fotoBerita")
    String? fotoBerita;
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
        this.judul,
        this.tanggal,
        this.status,
        this.kategori,
        this.fotoBerita,
        this.createdBy,
        this.isi,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Infotani.fromJson(Map<String, dynamic> json) => _$InfotaniFromJson(json);

    Map<String, dynamic> toJson() => _$InfotaniToJson(this);
}

enum Kategori {
    @JsonValue("artikel")
    ARTIKEL,
    @JsonValue("berita")
    BERITA,
    @JsonValue("tips")
    TIPS
}
