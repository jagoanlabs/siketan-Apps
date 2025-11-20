// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desa_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DesaResponseModel _$DesaResponseModelFromJson(Map<String, dynamic> json) =>
    DesaResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DesaResponseModelToJson(DesaResponseModel instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
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

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'nama': instance.nama,
  'kecamatanId': instance.kecamatanId,
  'type': instance.type,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
