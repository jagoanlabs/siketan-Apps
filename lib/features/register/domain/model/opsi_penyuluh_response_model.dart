import 'package:json_annotation/json_annotation.dart';

part 'opsi_penyuluh_response_model.g.dart';

@JsonSerializable()
class OpsiPenyuluhResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "dataDaftarPenyuluh")
  List<PenyuluhOption>? dataDaftarPenyuluh;

  OpsiPenyuluhResponseModel({
    this.message,
    this.dataDaftarPenyuluh,
  });

  factory OpsiPenyuluhResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OpsiPenyuluhResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OpsiPenyuluhResponseModelToJson(this);
}

@JsonSerializable()
class PenyuluhOption {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "nik")
  String? nik;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "foto")
  String? foto;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "noTelp")
  String? noTelp;

  PenyuluhOption({
    this.id,
    this.nik,
    this.nama,
    this.foto,
    this.alamat,
    this.email,
    this.noTelp,
  });

  factory PenyuluhOption.fromJson(Map<String, dynamic> json) =>
      _$PenyuluhOptionFromJson(json);

  Map<String, dynamic> toJson() => _$PenyuluhOptionToJson(this);
}
