import 'package:json_annotation/json_annotation.dart';

part 'register_petani_payload_model.g.dart';

@JsonSerializable()
class RegisterPetaniPayloadModel {
  @JsonKey(name: "NIK")
  String? nik;
  @JsonKey(name: "NKK")
  String? nkk;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "desa")
  String? desa;
  @JsonKey(name: "desaId")
  int? desaId;
  @JsonKey(name: "kecamatan")
  String? kecamatan;
  @JsonKey(name: "kecamatanId")
  int? kecamatanId;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "NoWa")
  String? noWa;
  @JsonKey(name: "gapoktan")
  String? gapoktan;
  @JsonKey(name: "penyuluh")
  int? penyuluh;
  @JsonKey(name: "namaKelompok")
  String? namaKelompok;

  RegisterPetaniPayloadModel({
    this.nik,
    this.nkk,
    this.nama,
    this.email,
    this.alamat,
    this.desa,
    this.desaId,
    this.kecamatan,
    this.kecamatanId,
    this.password,
    this.noWa,
    this.gapoktan,
    this.penyuluh,
    this.namaKelompok,
  });

  factory RegisterPetaniPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterPetaniPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterPetaniPayloadModelToJson(this);
}
