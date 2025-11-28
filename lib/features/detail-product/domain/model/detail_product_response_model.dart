import 'package:json_annotation/json_annotation.dart';

part 'detail_product_response_model.g.dart';

@JsonSerializable()
class DetailProductResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  DetailProductResponseModel({this.message, this.data});

  factory DetailProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DetailProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailProductResponseModelToJson(this);
}

@JsonSerializable()
class Data {
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

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
  @JsonKey(name: "petani")
  Petani? petani;
  @JsonKey(name: "penyuluh")
  Penyuluh? penyuluh;

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
    this.petani,
    this.penyuluh,
  });

  factory TblAkun.fromJson(Map<String, dynamic> json) =>
      _$TblAkunFromJson(json);

  Map<String, dynamic> toJson() => _$TblAkunToJson(this);
}

@JsonSerializable()
class Penyuluh {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "nik")
  String? nik;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "foto")
  dynamic foto;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "noTelp")
  String? noTelp;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "namaProduct")
  String? namaProduct;
  @JsonKey(name: "kecamatan")
  String? kecamatan;
  @JsonKey(name: "desa")
  String? desa;
  @JsonKey(name: "desaBinaan")
  String? desaBinaan;
  @JsonKey(name: "kecamatanBinaan")
  String? kecamatanBinaan;
  @JsonKey(name: "accountID")
  String? accountId;
  @JsonKey(name: "kecamatanId")
  int? kecamatanId;
  @JsonKey(name: "desaId")
  int? desaId;
  @JsonKey(name: "tipe")
  String? tipe;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  dynamic deletedAt;

  Penyuluh({
    this.id,
    this.nik,
    this.nama,
    this.foto,
    this.alamat,
    this.email,
    this.noTelp,
    this.password,
    this.namaProduct,
    this.kecamatan,
    this.desa,
    this.desaBinaan,
    this.kecamatanBinaan,
    this.accountId,
    this.kecamatanId,
    this.desaId,
    this.tipe,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Penyuluh.fromJson(Map<String, dynamic> json) =>
      _$PenyuluhFromJson(json);

  Map<String, dynamic> toJson() => _$PenyuluhToJson(this);
}

@JsonSerializable()
class Petani {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "nik")
  String? nik;
  @JsonKey(name: "nkk")
  String? nkk;
  @JsonKey(name: "foto")
  dynamic foto;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "desa")
  String? desa;
  @JsonKey(name: "kecamatan")
  String? kecamatan;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "noTelp")
  String? noTelp;
  @JsonKey(name: "accountID")
  String? accountId;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  dynamic deletedAt;
  @JsonKey(name: "fk_penyuluhId")
  int? fkPenyuluhId;
  @JsonKey(name: "fk_kelompokId")
  int? fkKelompokId;
  @JsonKey(name: "kecamatanId")
  int? kecamatanId;
  @JsonKey(name: "desaId")
  int? desaId;

  Petani({
    this.id,
    this.nik,
    this.nkk,
    this.foto,
    this.nama,
    this.alamat,
    this.desa,
    this.kecamatan,
    this.password,
    this.email,
    this.noTelp,
    this.accountId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkPenyuluhId,
    this.fkKelompokId,
    this.kecamatanId,
    this.desaId,
  });

  factory Petani.fromJson(Map<String, dynamic> json) => _$PetaniFromJson(json);

  Map<String, dynamic> toJson() => _$PetaniToJson(this);
}
