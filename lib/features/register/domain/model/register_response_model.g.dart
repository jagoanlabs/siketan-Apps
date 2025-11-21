// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => RegisterResponseModel(
  message: json['message'] as String?,
  newPenyuluh: json['newPenyuluh'] == null
      ? null
      : NewPenyuluh.fromJson(json['newPenyuluh'] as Map<String, dynamic>),
  newAccount: json['newAccount'] == null
      ? null
      : NewAccount.fromJson(json['newAccount'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  RegisterResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'newPenyuluh': instance.newPenyuluh,
  'newAccount': instance.newAccount,
};

NewAccount _$NewAccountFromJson(Map<String, dynamic> json) => NewAccount(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  password: json['password'] as String?,
  noWa: json['no_wa'] as String?,
  nama: json['nama'] as String?,
  pekerjaan: json['pekerjaan'] as String?,
  peran: json['peran'] as String?,
  accountId: json['accountID'] as String?,
  isVerified: json['isVerified'] as bool?,
  roleId: (json['role_id'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$NewAccountToJson(NewAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'no_wa': instance.noWa,
      'nama': instance.nama,
      'pekerjaan': instance.pekerjaan,
      'peran': instance.peran,
      'accountID': instance.accountId,
      'isVerified': instance.isVerified,
      'role_id': instance.roleId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

NewPenyuluh _$NewPenyuluhFromJson(Map<String, dynamic> json) => NewPenyuluh(
  id: (json['id'] as num?)?.toInt(),
  nik: json['nik'] as String?,
  nama: json['nama'] as String?,
  alamat: json['alamat'] as String?,
  email: json['email'] as String?,
  noTelp: json['noTelp'] as String?,
  kecamatan: json['kecamatan'] as String?,
  desa: json['desa'] as String?,
  password: json['password'] as String?,
  namaProduct: json['namaProduct'] as String?,
  desaBinaan: json['desaBinaan'] as String?,
  kecamatanBinaan: json['kecamatanBinaan'] as String?,
  accountId: json['accountID'] as String?,
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  desaId: (json['desaId'] as num?)?.toInt(),
  tipe: json['tipe'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$NewPenyuluhToJson(NewPenyuluh instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'email': instance.email,
      'noTelp': instance.noTelp,
      'kecamatan': instance.kecamatan,
      'desa': instance.desa,
      'password': instance.password,
      'namaProduct': instance.namaProduct,
      'desaBinaan': instance.desaBinaan,
      'kecamatanBinaan': instance.kecamatanBinaan,
      'accountID': instance.accountId,
      'kecamatanId': instance.kecamatanId,
      'desaId': instance.desaId,
      'tipe': instance.tipe,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
