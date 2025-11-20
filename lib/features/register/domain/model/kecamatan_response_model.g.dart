// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kecamatan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KecamatanResponseModel _$KecamatanResponseModelFromJson(
  Map<String, dynamic> json,
) => KecamatanResponseModel(
  status: json['status'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$KecamatanResponseModelToJson(
  KecamatanResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: (json['id'] as num?)?.toInt(),
  nama: json['nama'] as String?,
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
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
