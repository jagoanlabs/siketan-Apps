import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';
@JsonSerializable()
class RegisterResponseModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "newPenyuluh")
    NewPenyuluh? newPenyuluh;
    @JsonKey(name: "newAccount")
    NewAccount? newAccount;

    RegisterResponseModel({
        this.message,
        this.newPenyuluh,
        this.newAccount,
    });

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}

@JsonSerializable()
class NewAccount {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "no_wa")
    String? noWa;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "pekerjaan")
    String? pekerjaan;
    @JsonKey(name: "peran")
    String? peran;
    @JsonKey(name: "accountID")
    String? accountId;
    @JsonKey(name: "isVerified")
    bool? isVerified;
    @JsonKey(name: "role_id")
    int? roleId;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    NewAccount({
        this.id,
        this.email,
        this.password,
        this.noWa,
        this.nama,
        this.pekerjaan,
        this.peran,
        this.accountId,
        this.isVerified,
        this.roleId,
        this.updatedAt,
        this.createdAt,
    });

    factory NewAccount.fromJson(Map<String, dynamic> json) => _$NewAccountFromJson(json);

    Map<String, dynamic> toJson() => _$NewAccountToJson(this);
}

@JsonSerializable()
class NewPenyuluh {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "nik")
    String? nik;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "alamat")
    String? alamat;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "noTelp")
    String? noTelp;
    @JsonKey(name: "kecamatan")
    String? kecamatan;
    @JsonKey(name: "desa")
    String? desa;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "namaProduct")
    String? namaProduct;
    @JsonKey(name: "desaBinaan")
    String? desaBinaan;
    @JsonKey(name: "kecamatanBinaan")
    String? kecamatanBinaan;
    @JsonKey(name: "accountID")
    String? accountId;
    @JsonKey(name: "kecamatanId")
    int? kecamatanId;
    @JsonKey(name: "desaId")
    int? desaId;
    @JsonKey(name: "tipe")
    String? tipe;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    NewPenyuluh({
        this.id,
        this.nik,
        this.nama,
        this.alamat,
        this.email,
        this.noTelp,
        this.kecamatan,
        this.desa,
        this.password,
        this.namaProduct,
        this.desaBinaan,
        this.kecamatanBinaan,
        this.accountId,
        this.kecamatanId,
        this.desaId,
        this.tipe,
        this.updatedAt,
        this.createdAt,
    });

    factory NewPenyuluh.fromJson(Map<String, dynamic> json) => _$NewPenyuluhFromJson(json);

    Map<String, dynamic> toJson() => _$NewPenyuluhToJson(this);
}
