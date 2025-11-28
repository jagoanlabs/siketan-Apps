// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailProductResponseModel _$DetailProductResponseModelFromJson(
  Map<String, dynamic> json,
) => DetailProductResponseModel(
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetailProductResponseModelToJson(
  DetailProductResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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
  petani: json['petani'] == null
      ? null
      : Petani.fromJson(json['petani'] as Map<String, dynamic>),
  penyuluh: json['penyuluh'] == null
      ? null
      : Penyuluh.fromJson(json['penyuluh'] as Map<String, dynamic>),
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
  'petani': instance.petani,
  'penyuluh': instance.penyuluh,
};

Penyuluh _$PenyuluhFromJson(Map<String, dynamic> json) => Penyuluh(
  id: (json['id'] as num?)?.toInt(),
  nik: json['nik'] as String?,
  nama: json['nama'] as String?,
  foto: json['foto'],
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
};

Petani _$PetaniFromJson(Map<String, dynamic> json) => Petani(
  id: (json['id'] as num?)?.toInt(),
  nik: json['nik'] as String?,
  nkk: json['nkk'] as String?,
  foto: json['foto'],
  nama: json['nama'] as String?,
  alamat: json['alamat'] as String?,
  desa: json['desa'] as String?,
  kecamatan: json['kecamatan'] as String?,
  password: json['password'] as String?,
  email: json['email'] as String?,
  noTelp: json['noTelp'] as String?,
  accountId: json['accountID'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'],
  fkPenyuluhId: (json['fk_penyuluhId'] as num?)?.toInt(),
  fkKelompokId: (json['fk_kelompokId'] as num?)?.toInt(),
  kecamatanId: (json['kecamatanId'] as num?)?.toInt(),
  desaId: (json['desaId'] as num?)?.toInt(),
);

Map<String, dynamic> _$PetaniToJson(Petani instance) => <String, dynamic>{
  'id': instance.id,
  'nik': instance.nik,
  'nkk': instance.nkk,
  'foto': instance.foto,
  'nama': instance.nama,
  'alamat': instance.alamat,
  'desa': instance.desa,
  'kecamatan': instance.kecamatan,
  'password': instance.password,
  'email': instance.email,
  'noTelp': instance.noTelp,
  'accountID': instance.accountId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt,
  'fk_penyuluhId': instance.fkPenyuluhId,
  'fk_kelompokId': instance.fkKelompokId,
  'kecamatanId': instance.kecamatanId,
  'desaId': instance.desaId,
};
