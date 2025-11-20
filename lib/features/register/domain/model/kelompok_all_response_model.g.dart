// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kelompok_all_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KelompokAllResponseModel _$KelompokAllResponseModelFromJson(
  Map<String, dynamic> json,
) => KelompokAllResponseModel(
  message: json['message'] as String?,
  dataKelompok: (json['dataKelompok'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, DataKelompok.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$KelompokAllResponseModelToJson(
  KelompokAllResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'dataKelompok': instance.dataKelompok,
};

DataKelompok _$DataKelompokFromJson(Map<String, dynamic> json) => DataKelompok(
  id: (json['id'] as num?)?.toInt(),
  gapoktan: json['gapoktan'] as String?,
  namaKelompok: json['namaKelompok'] as String?,
  desa: json['desa'] as String?,
  kecamatan: json['kecamatan'] as String?,
  penyuluh: json['penyuluh'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  desaId: (json['desaId'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataKelompokToJson(DataKelompok instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gapoktan': instance.gapoktan,
      'namaKelompok': instance.namaKelompok,
      'desa': instance.desa,
      'kecamatan': instance.kecamatan,
      'penyuluh': instance.penyuluh,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'kecamatanId': instance.kecamatanId,
      'desaId': instance.desaId,
    };
