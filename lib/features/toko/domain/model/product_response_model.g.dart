// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductResponseModel(
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  currentPages: (json['currentPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  maxPages: (json['maxPages'] as num?)?.toInt(),
  from: (json['from'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductResponseModelToJson(
  ProductResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.data,
  'total': instance.total,
  'currentPages': instance.currentPages,
  'limit': instance.limit,
  'maxPages': instance.maxPages,
  'from': instance.from,
  'to': instance.to,
};

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
  petani: json['petani'] == null
      ? null
      : Penyuluh.fromJson(json['petani'] as Map<String, dynamic>),
  penyuluh: json['penyuluh'] == null
      ? null
      : Penyuluh.fromJson(json['penyuluh'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TblAkunToJson(TblAkun instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'no_wa': instance.noWa,
  'nama': instance.nama,
  'pekerjaan': instance.pekerjaan,
  'peran': instance.peran,
  'foto': instance.foto,
  'accountID': instance.accountId,
  'isVerified': instance.isVerified,
  'role_id': instance.roleId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'petani': instance.petani,
  'penyuluh': instance.penyuluh,
};

Penyuluh _$PenyuluhFromJson(Map<String, dynamic> json) => Penyuluh(
  id: (json['id'] as num?)?.toInt(),
  nik: json['nik'] as String?,
  nama: json['nama'] as String?,
  foto: json['foto'] as String?,
  alamat: json['alamat'] as String?,
  email: json['email'] as String?,
  noTelp: json['noTelp'] as String?,
  password: json['password'] as String?,
  namaProduct: json['namaProduct'] as String?,
  kecamatan: json['kecamatan'] as String?,
  desa: json['desa'] as String?,
  desaBinaan: json['desaBinaan'] as String?,
  kecamatanBinaan: json['kecamatanBinaan'] as String?,
  accountId: json['accountID'] as String?,
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  desaId: (json['desaId'] as num?)?.toInt(),
  tipe: json['tipe'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'],
  nkk: json['nkk'] as String?,
  fkPenyuluhId: (json['fk_penyuluhId'] as num?)?.toInt(),
  fkKelompokId: (json['fk_kelompokId'] as num?)?.toInt(),
);

Map<String, dynamic> _$PenyuluhToJson(Penyuluh instance) => <String, dynamic>{
  'id': instance.id,
  'nik': instance.nik,
  'nama': instance.nama,
  'foto': instance.foto,
  'alamat': instance.alamat,
  'email': instance.email,
  'noTelp': instance.noTelp,
  'password': instance.password,
  'namaProduct': instance.namaProduct,
  'kecamatan': instance.kecamatan,
  'desa': instance.desa,
  'desaBinaan': instance.desaBinaan,
  'kecamatanBinaan': instance.kecamatanBinaan,
  'accountID': instance.accountId,
  'kecamatanId': instance.kecamatanId,
  'desaId': instance.desaId,
  'tipe': instance.tipe,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt,
  'nkk': instance.nkk,
  'fk_penyuluhId': instance.fkPenyuluhId,
  'fk_kelompokId': instance.fkKelompokId,
};
