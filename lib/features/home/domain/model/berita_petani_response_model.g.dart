// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_petani_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeritaPetaniResponseModel _$BeritaPetaniResponseModelFromJson(
  Map<String, dynamic> json,
) => BeritaPetaniResponseModel(
  message: json['message'] as String?,
  infotani: (json['infotani'] as List<dynamic>?)
      ?.map((e) => Infotani.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BeritaPetaniResponseModelToJson(
  BeritaPetaniResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'infotani': instance.infotani,
};

Infotani _$InfotaniFromJson(Map<String, dynamic> json) => Infotani(
  id: (json['id'] as num?)?.toInt(),
  judul: json['judul'] as String?,
  tanggal: json['tanggal'] == null
      ? null
      : DateTime.parse(json['tanggal'] as String),
  status: json['status'],
  kategori: $enumDecodeNullable(_$KategoriEnumMap, json['kategori']),
  fotoBerita: json['fotoBerita'] as String?,
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
  'judul': instance.judul,
  'tanggal': instance.tanggal?.toIso8601String(),
  'status': instance.status,
  'kategori': _$KategoriEnumMap[instance.kategori],
  'fotoBerita': instance.fotoBerita,
  'createdBy': instance.createdBy,
  'isi': instance.isi,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt,
};

const _$KategoriEnumMap = {
  Kategori.ARTIKEL: 'artikel',
  Kategori.BERITA: 'berita',
  Kategori.TIPS: 'tips',
};
