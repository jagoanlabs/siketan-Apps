// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toko_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokoProductResponseModel _$TokoProductResponseModelFromJson(
  Map<String, dynamic> json,
) => TokoProductResponseModel(
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TokoProductResponseModelToJson(
  TokoProductResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: (json['id'] as num?)?.toInt(),
  profesiPenjual: json['profesiPenjual'] as String?,
  namaProducts: json['namaProducts'] as String?,
  stok: (json['stok'] as num?)?.toInt(),
  satuan: json['satuan'] as String?,
  harga: json['harga'] as String?,
  deskripsi: json['deskripsi'] as String?,
  fotoTanaman: json['fotoTanaman'] as String?,
  status: json['status'] as String?,
  accountId: json['accountID'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'],
  tblAkun: json['tbl_akun'] == null
      ? null
      : TblAkun.fromJson(json['tbl_akun'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'profesiPenjual': instance.profesiPenjual,
  'namaProducts': instance.namaProducts,
  'stok': instance.stok,
  'satuan': instance.satuan,
  'harga': instance.harga,
  'deskripsi': instance.deskripsi,
  'fotoTanaman': instance.fotoTanaman,
  'status': instance.status,
  'accountID': instance.accountId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt,
  'tbl_akun': instance.tblAkun,
};

TblAkun _$TblAkunFromJson(Map<String, dynamic> json) => TblAkun(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  noWa: json['no_wa'] as String?,
  nama: json['nama'] as String?,
  password: json['password'] as String?,
  pekerjaan: json['pekerjaan'] as String?,
  peran: json['peran'] as String?,
  foto: json['foto'] as String?,
  accountId: json['accountID'] as String?,
  isVerified: json['isVerified'] as bool?,
  roleId: (json['role_id'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TblAkunToJson(TblAkun instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'no_wa': instance.noWa,
  'nama': instance.nama,
  'password': instance.password,
  'pekerjaan': instance.pekerjaan,
  'peran': instance.peran,
  'foto': instance.foto,
  'accountID': instance.accountId,
  'isVerified': instance.isVerified,
  'role_id': instance.roleId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
