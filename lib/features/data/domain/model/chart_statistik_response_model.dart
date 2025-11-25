import 'package:json_annotation/json_annotation.dart';

part 'chart_statistik_response_model.g.dart';

@JsonSerializable()
class ChartStatistikResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  ChartStatistikResponseModel({this.message, this.data});

  factory ChartStatistikResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChartStatistikResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChartStatistikResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "statistik")
  List<Statistik>? statistik;
  @JsonKey(name: "summary")
  List<Summary>? summary;
  @JsonKey(name: "latest")
  List<Latest>? latest;

  Data({this.statistik, this.summary, this.latest});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Latest {
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

  Latest({
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

  factory Latest.fromJson(Map<String, dynamic> json) => _$LatestFromJson(json);

  Map<String, dynamic> toJson() => _$LatestToJson(this);
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
  });

  factory DataPetani.fromJson(Map<String, dynamic> json) =>
      _$DataPetaniFromJson(json);

  Map<String, dynamic> toJson() => _$DataPetaniToJson(this);
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
  });

  factory Kelompok.fromJson(Map<String, dynamic> json) =>
      _$KelompokFromJson(json);

  Map<String, dynamic> toJson() => _$KelompokToJson(this);
}

@JsonSerializable()
class Statistik {
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "komoditas")
  String? komoditas;
  @JsonKey(name: "count")
  int? count;

  Statistik({this.date, this.komoditas, this.count});

  factory Statistik.fromJson(Map<String, dynamic> json) =>
      _$StatistikFromJson(json);

  Map<String, dynamic> toJson() => _$StatistikToJson(this);
}

@JsonSerializable()
class Summary {
  @JsonKey(name: "kategori")
  String? kategori;
  @JsonKey(name: "count")
  int? count;

  Summary({this.kategori, this.count});

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
