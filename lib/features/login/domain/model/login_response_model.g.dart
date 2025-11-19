// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
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
  role: json['role'] == null
      ? null
      : Role.fromJson(json['role'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
  'role': instance.role,
};

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  displayName: json['display_name'] as String?,
  description: json['description'] as String?,
  isActive: json['is_active'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'display_name': instance.displayName,
  'description': instance.description,
  'is_active': instance.isActive,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'permissions': instance.permissions,
};

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  displayName: json['display_name'] as String?,
  description: json['description'] as String?,
  module: json['module'] as String?,
  action: json['action'] as String?,
  isActive: json['is_active'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  rolePermission: json['role_permission'] == null
      ? null
      : RolePermission.fromJson(
          json['role_permission'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'description': instance.description,
      'module': instance.module,
      'action': instance.action,
      'is_active': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'role_permission': instance.rolePermission,
    };

RolePermission _$RolePermissionFromJson(Map<String, dynamic> json) =>
    RolePermission(
      roleId: (json['role_id'] as num?)?.toInt(),
      permissionId: (json['permission_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RolePermissionToJson(RolePermission instance) =>
    <String, dynamic>{
      'role_id': instance.roleId,
      'permission_id': instance.permissionId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
