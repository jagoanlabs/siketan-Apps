import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final int? id;
  final String? email;
  final String? noWa;
  final String? nama;
  final String? pekerjaan;
  final String? peran;
  final String? foto;
  final String? accountId;
  final bool? isVerified;
  final int? roleId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final RoleModel? role;

  ProfileModel({
    this.id,
    this.email,
    this.noWa,
    this.nama,
    this.pekerjaan,
    this.peran,
    this.foto,
    this.accountId,
    this.isVerified,
    this.roleId,
    this.createdAt,
    this.updatedAt,
    this.role,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  // Create from SharedPreferences data
  static ProfileModel fromSharedPreferences(Map<String, dynamic> data) {
    return ProfileModel(
      id: data['id'] as int?,
      email: data['email'] as String?,
      noWa: data['noWa'] as String?,
      nama: data['name'] as String?,
      pekerjaan: data['pekerjaan'] as String?,
      peran: data['peran'] as String?,
      foto: data['foto'] as String?,
      accountId: data['accountId'] as String?,
      isVerified: data['isVerified'] as bool?,
      roleId: data['roleId'] as int?,
      createdAt: data['createdAt'] as DateTime?,
      updatedAt: data['updatedAt'] as DateTime?,
      role: data['roleName'] != null || data['roleDisplayName'] != null
          ? RoleModel(
              name: data['roleName'] as String?,
              displayName: data['roleDisplayName'] as String?,
              description: data['roleDescription'] as String?,
            )
          : null,
    );
  }
}

@JsonSerializable()
class RoleModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'display_name')
  final String? displayName;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'permissions')
  final List<PermissionModel>? permissions;

  RoleModel({
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.permissions,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

@JsonSerializable()
class PermissionModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'display_name')
  final String? displayName;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'module')
  final String? module;
  @JsonKey(name: 'action')
  final String? action;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'role_permission')
  final RolePermissionModel? rolePermission;

  PermissionModel({
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.module,
    this.action,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.rolePermission,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) => _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}

@JsonSerializable()
class RolePermissionModel {
  @JsonKey(name: 'role_id')
  final int? roleId;
  @JsonKey(name: 'permission_id')
  final int? permissionId;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  RolePermissionModel({
    this.roleId,
    this.permissionId,
    this.createdAt,
    this.updatedAt,
  });

  factory RolePermissionModel.fromJson(Map<String, dynamic> json) => _$RolePermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RolePermissionModelToJson(this);
}