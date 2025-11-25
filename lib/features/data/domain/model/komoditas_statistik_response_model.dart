import 'package:json_annotation/json_annotation.dart';

part 'komoditas_statistik_response_model.g.dart';

@JsonSerializable()
class KomoditasStatistikResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<Datum>? data;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "currentPages")
  int? currentPages;
  @JsonKey(name: "limit")
  int? limit;
  @JsonKey(name: "maxPages")
  int? maxPages;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "to")
  int? to;

  KomoditasStatistikResponseModel({
    this.message,
    this.data,
    this.total,
    this.currentPages,
    this.limit,
    this.maxPages,
    this.from,
    this.to,
  });

  factory KomoditasStatistikResponseModel.fromJson(Map<String, dynamic> json) =>
      _$KomoditasStatistikResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$KomoditasStatistikResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "statusKepemilikanLahan")
  String? statusKepemilikanLahan;
  @JsonKey(name: "luasLahan")
  String? luasLahan;
  @JsonKey(name: "kategori")
  String? kategori;
  @JsonKey(name: "jenis")
  String? jenis;
  @JsonKey(name: "komoditas")
  String? komoditas;
  @JsonKey(name: "periodeMusimTanam")
  String? periodeMusimTanam;
  @JsonKey(name: "periodeBulanTanam")
  String? periodeBulanTanam;
  @JsonKey(name: "prakiraanLuasPanen")
  int? prakiraanLuasPanen;
  @JsonKey(name: "prakiraanProduksiPanen")
  int? prakiraanProduksiPanen;
  @JsonKey(name: "prakiraanBulanPanen")
  String? prakiraanBulanPanen;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  dynamic deletedAt;
  @JsonKey(name: "fk_petaniId")
  int? fkPetaniId;
  @JsonKey(name: "dataPetani")
  DataPetani? dataPetani;

  Datum({
    this.id,
    this.statusKepemilikanLahan,
    this.luasLahan,
    this.kategori,
    this.jenis,
    this.komoditas,
    this.periodeMusimTanam,
    this.periodeBulanTanam,
    this.prakiraanLuasPanen,
    this.prakiraanProduksiPanen,
    this.prakiraanBulanPanen,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkPetaniId,
    this.dataPetani,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class DataPetani {
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
  @JsonKey(name: "kelompok")
  Kelompok? kelompok;
  @JsonKey(name: "kecamatanData")
  KecamatanData? kecamatanData;
  @JsonKey(name: "desaData")
  DesaData? desaData;

  DataPetani({
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
    this.kelompok,
    this.kecamatanData,
    this.desaData,
  });

  factory DataPetani.fromJson(Map<String, dynamic> json) =>
      _$DataPetaniFromJson(json);

  Map<String, dynamic> toJson() => _$DataPetaniToJson(this);
}

@JsonSerializable()
class DesaData {
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

  DesaData({
    this.id,
    this.nama,
    this.kecamatanId,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory DesaData.fromJson(Map<String, dynamic> json) =>
      _$DesaDataFromJson(json);

  Map<String, dynamic> toJson() => _$DesaDataToJson(this);
}

@JsonSerializable()
class KecamatanData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  KecamatanData({this.id, this.nama, this.createdAt, this.updatedAt});

  factory KecamatanData.fromJson(Map<String, dynamic> json) =>
      _$KecamatanDataFromJson(json);

  Map<String, dynamic> toJson() => _$KecamatanDataToJson(this);
}

@JsonSerializable()
class Kelompok {
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
  dynamic createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "kecamatanId")
  int? kecamatanId;
  @JsonKey(name: "desaId")
  int? desaId;
  @JsonKey(name: "kecamatanData")
  KecamatanData? kecamatanData;
  @JsonKey(name: "desaData")
  DesaData? desaData;

  Kelompok({
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
    this.kecamatanData,
    this.desaData,
  });

  factory Kelompok.fromJson(Map<String, dynamic> json) =>
      _$KelompokFromJson(json);

  Map<String, dynamic> toJson() => _$KelompokToJson(this);
}
