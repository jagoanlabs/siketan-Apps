// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_nik_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CekNikResponseModel _$CekNikResponseModelFromJson(Map<String, dynamic> json) =>
    CekNikResponseModel(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CekNikResponseModelToJson(
  CekNikResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  nik: json['nik'] as String?,
  nkk: json['nkk'] as String?,
  foto: json['foto'] as String?,
  nama: json['nama'] as String?,
  alamat: json['alamat'] as String?,
  desa: json['desa'] as String?,
  kecamatan: json['kecamatan'] as String?,
  password: json['password'] as String?,
  email: json['email'] as String?,
  noTelp: json['noTelp'] as String?,
  accountId: json['accountID'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'],
  fkPenyuluhId: (json['fk_penyuluhId'] as num?)?.toInt(),
  fkKelompokId: (json['fk_kelompokId'] as num?)?.toInt(),
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  desaId: (json['desaId'] as num?)?.toInt(),
  tanamanPetanis: (json['tanamanPetanis'] as List<dynamic>?)
      ?.map((e) => TanamanPetani.fromJson(e as Map<String, dynamic>))
      .toList(),
  kelompok: json['kelompok'] == null
      ? null
      : Kelompok.fromJson(json['kelompok'] as Map<String, dynamic>),
  kecamatanData: json['kecamatanData'] == null
      ? null
      : KecamatanData.fromJson(json['kecamatanData'] as Map<String, dynamic>),
  desaData: json['desaData'] == null
      ? null
      : DesaData.fromJson(json['desaData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'nik': instance.nik,
  'nkk': instance.nkk,
  'foto': instance.foto,
  'nama': instance.nama,
  'alamat': instance.alamat,
  'desa': instance.desa,
  'kecamatan': instance.kecamatan,
  'password': instance.password,
  'email': instance.email,
  'noTelp': instance.noTelp,
  'accountID': instance.accountId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt,
  'fk_penyuluhId': instance.fkPenyuluhId,
  'fk_kelompokId': instance.fkKelompokId,
  'kecamatanId': instance.kecamatanId,
  'desaId': instance.desaId,
  'tanamanPetanis': instance.tanamanPetanis,
  'kelompok': instance.kelompok,
  'kecamatanData': instance.kecamatanData,
  'desaData': instance.desaData,
};

DesaData _$DesaDataFromJson(Map<String, dynamic> json) => DesaData(
  id: (json['id'] as num?)?.toInt(),
  nama: json['nama'] as String?,
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  type: json['type'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DesaDataToJson(DesaData instance) => <String, dynamic>{
  'id': instance.id,
  'nama': instance.nama,
  'kecamatanId': instance.kecamatanId,
  'type': instance.type,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

KecamatanData _$KecamatanDataFromJson(Map<String, dynamic> json) =>
    KecamatanData(
      id: (json['id'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$KecamatanDataToJson(KecamatanData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Kelompok _$KelompokFromJson(Map<String, dynamic> json) => Kelompok(
  id: (json['id'] as num?)?.toInt(),
  gapoktan: json['gapoktan'] as String?,
  namaKelompok: json['namaKelompok'] as String?,
  desa: json['desa'] as String?,
  kecamatan: json['kecamatan'] as String?,
  penyuluh: json['penyuluh'],
  createdAt: json['createdAt'],
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  desaId: (json['desaId'] as num?)?.toInt(),
);

Map<String, dynamic> _$KelompokToJson(Kelompok instance) => <String, dynamic>{
  'id': instance.id,
  'gapoktan': instance.gapoktan,
  'namaKelompok': instance.namaKelompok,
  'desa': instance.desa,
  'kecamatan': instance.kecamatan,
  'penyuluh': instance.penyuluh,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'kecamatanId': instance.kecamatanId,
  'desaId': instance.desaId,
};

TanamanPetani _$TanamanPetaniFromJson(Map<String, dynamic> json) =>
    TanamanPetani(
      id: (json['id'] as num?)?.toInt(),
      statusKepemilikanLahan: json['statusKepemilikanLahan'] as String?,
      luasLahan: json['luasLahan'] as String?,
      kategori: json['kategori'] as String?,
      jenis: json['jenis'] as String?,
      komoditas: json['komoditas'] as String?,
      periodeMusimTanam: json['periodeMusimTanam'] as String?,
      periodeBulanTanam: json['periodeBulanTanam'] as String?,
      prakiraanLuasPanen: (json['prakiraanLuasPanen'] as num?)?.toInt(),
      prakiraanProduksiPanen: (json['prakiraanProduksiPanen'] as num?)?.toInt(),
      prakiraanBulanPanen: json['prakiraanBulanPanen'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'],
      fkPetaniId: (json['fk_petaniId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TanamanPetaniToJson(TanamanPetani instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statusKepemilikanLahan': instance.statusKepemilikanLahan,
      'luasLahan': instance.luasLahan,
      'kategori': instance.kategori,
      'jenis': instance.jenis,
      'komoditas': instance.komoditas,
      'periodeMusimTanam': instance.periodeMusimTanam,
      'periodeBulanTanam': instance.periodeBulanTanam,
      'prakiraanLuasPanen': instance.prakiraanLuasPanen,
      'prakiraanProduksiPanen': instance.prakiraanProduksiPanen,
      'prakiraanBulanPanen': instance.prakiraanBulanPanen,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt,
      'fk_petaniId': instance.fkPetaniId,
    };
