import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "token")
    String? token;
    @JsonKey(name: "user")
    User? user;

    LoginResponseModel({
        this.message,
        this.token,
        this.user,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "no_wa")
    String? noWa;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "pekerjaan")
    String? pekerjaan;
    @JsonKey(name: "peran")
    String? peran;
    @JsonKey(name: "foto")
    String? foto;
    @JsonKey(name: "accountID")
    String? accountId;
    @JsonKey(name: "isVerified")
    bool? isVerified;
    @JsonKey(name: "role_id")
    int? roleId;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "role")
    Role? role;

    User({
        this.id,
        this.email,
        this.noWa,
        this.nama,
        this.password,
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

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Role {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "display_name")
    String? displayName;
    @JsonKey(name: "description")
    String? description;
    @JsonKey(name: "is_active")
    bool? isActive;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "permissions")
    List<Permission>? permissions;

    Role({
        this.id,
        this.name,
        this.displayName,
        this.description,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.permissions,
    });

    factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

    Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class Permission {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "display_name")
    String? displayName;
    @JsonKey(name: "description")
    String? description;
    @JsonKey(name: "module")
    String? module;
    @JsonKey(name: "action")
    String? action;
    @JsonKey(name: "is_active")
    bool? isActive;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "role_permission")
    RolePermission? rolePermission;

    Permission({
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

    factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);

    Map<String, dynamic> toJson() => _$PermissionToJson(this);
}

@JsonSerializable()
class RolePermission {
    @JsonKey(name: "role_id")
    int? roleId;
    @JsonKey(name: "permission_id")
    int? permissionId;
    @JsonKey(name: "created_at")
    DateTime? createdAt;
    @JsonKey(name: "updated_at")
    DateTime? updatedAt;

    RolePermission({
        this.roleId,
        this.permissionId,
        this.createdAt,
        this.updatedAt,
    });

    factory RolePermission.fromJson(Map<String, dynamic> json) => _$RolePermissionFromJson(json);

    Map<String, dynamic> toJson() => _$RolePermissionToJson(this);
}
