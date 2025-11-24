// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kegiatan_petani_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KegiatanPetaniResponseModel _$KegiatanPetaniResponseModelFromJson(
  Map<String, dynamic> json,
) => KegiatanPetaniResponseModel(
  message: json['message'] as String?,
  infotani: (json['infotani'] as List<dynamic>?)
      ?.map((e) => Infotani.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$KegiatanPetaniResponseModelToJson(
  KegiatanPetaniResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'infotani': instance.infotani,
};

Infotani _$InfotaniFromJson(Map<String, dynamic> json) => Infotani(
  id: (json['id'] as num?)?.toInt(),
  namaKegiatan: json['namaKegiatan'] as String?,
  tanggalAcara: json['tanggalAcara'] == null
      ? null
      : DateTime.parse(json['tanggalAcara'] as String),
  waktuAcara: json['waktuAcara'] as String?,
  tempat: json['tempat'] as String?,
  peserta: json['peserta'] as String?,
  fotoKegiatan: json['fotoKegiatan'] as String?,
  createdBy: json['createdBy'] as String?,
  isi: json['isi'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'],
);

Map<String, dynamic> _$InfotaniToJson(Infotani instance) => <String, dynamic>{
  'id': instance.id,
  'namaKegiatan': instance.namaKegiatan,
  'tanggalAcara': instance.tanggalAcara?.toIso8601String(),
  'waktuAcara': instance.waktuAcara,
  'tempat': instance.tempat,
  'peserta': instance.peserta,
  'fotoKegiatan': instance.fotoKegiatan,
  'createdBy': instance.createdBy,
  'isi': instance.isi,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt,
};
