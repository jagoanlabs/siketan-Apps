// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPaylaodModel _$RegisterPaylaodModelFromJson(
  Map<String, dynamic> json,
) => RegisterPaylaodModel(
  nip: json['NIP'] as String?,
  nama: json['nama'] as String?,
  email: json['email'] as String?,
  noWa: json['NoWa'] as String?,
  password: json['password'] as String?,
  alamat: json['alamat'] as String?,
  tipe: json['tipe'] as String?,
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  kecamatan: json['kecamatan'] as String?,
  desaId: (json['desaId'] as num?)?.toInt(),
  desa: json['desa'] as String?,
  kecamatanBinaan: json['kecamatanBinaan'] as String?,
  desaBinaan: json['desaBinaan'] as String?,
  selectedKelompokIds: json['selectedKelompokIds'] as String?,
  pekerjaan: json['pekerjaan'] as String?,
);

Map<String, dynamic> _$RegisterPaylaodModelToJson(
  RegisterPaylaodModel instance,
) => <String, dynamic>{
  'NIP': instance.nip,
  'nama': instance.nama,
  'email': instance.email,
  'NoWa': instance.noWa,
  'password': instance.password,
  'alamat': instance.alamat,
  'tipe': instance.tipe,
  'kecamatanId': instance.kecamatanId,
  'kecamatan': instance.kecamatan,
  'desaId': instance.desaId,
  'desa': instance.desa,
  'kecamatanBinaan': instance.kecamatanBinaan,
  'desaBinaan': instance.desaBinaan,
  'selectedKelompokIds': instance.selectedKelompokIds,
  'pekerjaan': instance.pekerjaan,
};
