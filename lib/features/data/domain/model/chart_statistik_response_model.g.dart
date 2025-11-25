// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_statistik_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartStatistikResponseModel _$ChartStatistikResponseModelFromJson(
  Map<String, dynamic> json,
) => ChartStatistikResponseModel(
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChartStatistikResponseModelToJson(
  ChartStatistikResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  statistik: (json['statistik'] as List<dynamic>?)
      ?.map((e) => Statistik.fromJson(e as Map<String, dynamic>))
      .toList(),
  summary: (json['summary'] as List<dynamic>?)
      ?.map((e) => Summary.fromJson(e as Map<String, dynamic>))
      .toList(),
  latest: (json['latest'] as List<dynamic>?)
      ?.map((e) => Latest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'statistik': instance.statistik,
  'summary': instance.summary,
  'latest': instance.latest,
};

Latest _$LatestFromJson(Map<String, dynamic> json) => Latest(
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
  dataPetani: json['dataPetani'] == null
      ? null
      : DataPetani.fromJson(json['dataPetani'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LatestToJson(Latest instance) => <String, dynamic>{
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
  'dataPetani': instance.dataPetani,
};

DataPetani _$DataPetaniFromJson(Map<String, dynamic> json) => DataPetani(
  id: (json['id'] as num?)?.toInt(),
  nik: json['nik'] as String?,
  nkk: json['nkk'] as String?,
  foto: json['foto'],
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
  kelompok: json['kelompok'] == null
      ? null
      : Kelompok.fromJson(json['kelompok'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataPetaniToJson(DataPetani instance) =>
    <String, dynamic>{
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
      'kelompok': instance.kelompok,
    };

Kelompok _$KelompokFromJson(Map<String, dynamic> json) => Kelompok(
  id: (json['id'] as num?)?.toInt(),
  gapoktan: json['gapoktan'] as String?,
  namaKelompok: json['namaKelompok'] as String?,
  desa: json['desa'] as String?,
  kecamatan: json['kecamatan'] as String?,
  penyuluh: json['penyuluh'] as String?,
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

Statistik _$StatistikFromJson(Map<String, dynamic> json) => Statistik(
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  komoditas: json['komoditas'] as String?,
  count: (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatistikToJson(Statistik instance) => <String, dynamic>{
  'date': instance.date?.toIso8601String(),
  'komoditas': instance.komoditas,
  'count': instance.count,
};

Summary _$SummaryFromJson(Map<String, dynamic> json) => Summary(
  kategori: json['kategori'] as String?,
  count: (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
  'kategori': instance.kategori,
  'count': instance.count,
};
