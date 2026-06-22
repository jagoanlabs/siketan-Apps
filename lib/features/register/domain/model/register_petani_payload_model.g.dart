// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_petani_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPetaniPayloadModel _$RegisterPetaniPayloadModelFromJson(
        Map<String, dynamic> json) =>
    RegisterPetaniPayloadModel(
      nik: json['NIK'] as String?,
      nkk: json['NKK'] as String?,
      nama: json['nama'] as String?,
      email: json['email'] as String?,
      alamat: json['alamat'] as String?,
      desa: json['desa'] as String?,
      desaId: json['desaId'] as int?,
      kecamatan: json['kecamatan'] as String?,
      kecamatanId: json['kecamatanId'] as int?,
      password: json['password'] as String?,
      noWa: json['NoWa'] as String?,
      gapoktan: json['gapoktan'] as String?,
      penyuluh: json['penyuluh'] as int?,
      namaKelompok: json['namaKelompok'] as String?,
    );

Map<String, dynamic> _$RegisterPetaniPayloadModelToJson(
        RegisterPetaniPayloadModel instance) =>
    <String, dynamic>{
      'NIK': instance.nik,
      'NKK': instance.nkk,
      'nama': instance.nama,
      'email': instance.email,
      'alamat': instance.alamat,
      'desa': instance.desa,
      'desaId': instance.desaId,
      'kecamatan': instance.kecamatan,
      'kecamatanId': instance.kecamatanId,
      'password': instance.password,
      'NoWa': instance.noWa,
      'gapoktan': instance.gapoktan,
      'penyuluh': instance.penyuluh,
      'namaKelompok': instance.namaKelompok,
    };
