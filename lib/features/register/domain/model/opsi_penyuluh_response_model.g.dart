// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opsi_penyuluh_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpsiPenyuluhResponseModel _$OpsiPenyuluhResponseModelFromJson(
        Map<String, dynamic> json) =>
    OpsiPenyuluhResponseModel(
      message: json['message'] as String?,
      dataDaftarPenyuluh: (json['dataDaftarPenyuluh'] as List<dynamic>?)
          ?.map((e) => PenyuluhOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OpsiPenyuluhResponseModelToJson(
        OpsiPenyuluhResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'dataDaftarPenyuluh': instance.dataDaftarPenyuluh,
    };

PenyuluhOption _$PenyuluhOptionFromJson(Map<String, dynamic> json) =>
    PenyuluhOption(
      id: json['id'] as int?,
      nik: json['nik'] as String?,
      nama: json['nama'] as String?,
      foto: json['foto'] as String?,
      alamat: json['alamat'] as String?,
      email: json['email'] as String?,
      noTelp: json['noTelp'] as String?,
    );

Map<String, dynamic> _$PenyuluhOptionToJson(PenyuluhOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.nama,
      'foto': instance.foto,
      'alamat': instance.alamat,
      'email': instance.email,
      'noTelp': instance.noTelp,
    };
