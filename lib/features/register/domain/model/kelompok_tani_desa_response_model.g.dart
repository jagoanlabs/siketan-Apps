// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kelompok_tani_desa_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KelompokTaniDesaResponseModel _$KelompokTaniDesaResponseModelFromJson(
        Map<String, dynamic> json) =>
    KelompokTaniDesaResponseModel(
      message: json['message'] as String?,
      kelompokTani: (json['kelompokTani'] as List<dynamic>?)
          ?.map((e) => KelompokTaniItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KelompokTaniDesaResponseModelToJson(
        KelompokTaniDesaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'kelompokTani': instance.kelompokTani,
    };

KelompokTaniItem _$KelompokTaniItemFromJson(Map<String, dynamic> json) =>
    KelompokTaniItem(
      id: json['id'] as int?,
      gapoktan: json['gapoktan'] as String?,
      namaKelompok: json['namaKelompok'] as String?,
      desa: json['desa'] as String?,
      kecamatan: json['kecamatan'] as String?,
      penyuluh: json['penyuluh'] as String?,
      kecamatanId: json['kecamatanId'] as int?,
      desaId: json['desaId'] as int?,
    );

Map<String, dynamic> _$KelompokTaniItemToJson(KelompokTaniItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gapoktan': instance.gapoktan,
      'namaKelompok': instance.namaKelompok,
      'desa': instance.desa,
      'kecamatan': instance.kecamatan,
      'penyuluh': instance.penyuluh,
      'kecamatanId': instance.kecamatanId,
      'desaId': instance.desaId,
    };
