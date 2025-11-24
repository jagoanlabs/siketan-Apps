// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  noWa: json['noWa'] as String?,
  nama: json['nama'] as String?,
  pekerjaan: json['pekerjaan'] as String?,
  peran: json['peran'] as String?,
  foto: json['foto'] as String?,
  accountId: json['accountId'] as String?,
  isVerified: json['isVerified'] as bool?,
  roleId: (json['roleId'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  role: json['role'] == null
      ? null
      : RoleModel.fromJson(json['role'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'noWa': instance.noWa,
      'nama': instance.nama,
      'pekerjaan': instance.pekerjaan,
      'peran': instance.peran,
      'foto': instance.foto,
      'accountId': instance.accountId,
      'isVerified': instance.isVerified,
      'roleId': instance.roleId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'role': instance.role,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  displayName: json['display_name'] as String?,
  description: json['description'] as String?,
  isActive: json['is_active'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => PermissionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'display_name': instance.displayName,
  'description': instance.description,
  'is_active': instance.isActive,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'permissions': instance.permissions,
};

PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) =>
    PermissionModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      description: json['description'] as String?,
      module: json['module'] as String?,
      action: json['action'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      rolePermission: json['role_permission'] == null
          ? null
          : RolePermissionModel.fromJson(
              json['role_permission'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PermissionModelToJson(PermissionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'description': instance.description,
      'module': instance.module,
      'action': instance.action,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'role_permission': instance.rolePermission,
    };

RolePermissionModel _$RolePermissionModelFromJson(Map<String, dynamic> json) =>
    RolePermissionModel(
      roleId: (json['role_id'] as num?)?.toInt(),
      permissionId: (json['permission_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RolePermissionModelToJson(
  RolePermissionModel instance,
) => <String, dynamic>{
  'role_id': instance.roleId,
  'permission_id': instance.permissionId,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
