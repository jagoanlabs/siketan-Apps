import 'package:json_annotation/json_annotation.dart';

part 'toko_product_response_model.g.dart';

@JsonSerializable()
class TokoProductResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<Datum>? data;

  TokoProductResponseModel({this.message, this.data});

  factory TokoProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokoProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokoProductResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "profesiPenjual")
  String? profesiPenjual;
  @JsonKey(name: "namaProducts")
  String? namaProducts;
  @JsonKey(name: "stok")
  int? stok;
  @JsonKey(name: "satuan")
  String? satuan;
  @JsonKey(name: "harga")
  String? harga;
  @JsonKey(name: "deskripsi")
  String? deskripsi;
  @JsonKey(name: "fotoTanaman")
  String? fotoTanaman;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "accountID")
  String? accountId;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  dynamic deletedAt;
  @JsonKey(name: "tbl_akun")
  TblAkun? tblAkun;

  Datum({
    this.id,
    this.profesiPenjual,
    this.namaProducts,
    this.stok,
    this.satuan,
    this.harga,
    this.deskripsi,
    this.fotoTanaman,
    this.status,
    this.accountId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tblAkun,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class TblAkun {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "no_wa")
  String? noWa;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "pekerjaan")
  String? pekerjaan;
  @JsonKey(name: "peran")
  String? peran;
  @JsonKey(name: "foto")
  String? foto;
  @JsonKey(name: "accountID")
  String? accountId;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "role_id")
  int? roleId;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  TblAkun({
    this.id,
    this.email,
    this.noWa,
    this.nama,
    this.password,
    this.pekerjaan,
    this.peran,
    this.foto,
    this.accountId,
    this.isVerified,
    this.roleId,
    this.createdAt,
    this.updatedAt,
  });

  factory TblAkun.fromJson(Map<String, dynamic> json) =>
      _$TblAkunFromJson(json);

  Map<String, dynamic> toJson() => _$TblAkunToJson(this);
}
