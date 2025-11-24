
import 'package:json_annotation/json_annotation.dart';

part 'product_petani_response_model.g.dart';

@JsonSerializable()
class ProductPetaniResponseModel {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "data")
    List<Datum>? data;
    @JsonKey(name: "total")
    int? total;
    @JsonKey(name: "currentPages")
    int? currentPages;
    @JsonKey(name: "limit")
    int? limit;
    @JsonKey(name: "maxPages")
    int? maxPages;
    @JsonKey(name: "from")
    int? from;
    @JsonKey(name: "to")
    int? to;

    ProductPetaniResponseModel({
        this.message,
        this.data,
        this.total,
        this.currentPages,
        this.limit,
        this.maxPages,
        this.from,
        this.to,
    });

    factory ProductPetaniResponseModel.fromJson(Map<String, dynamic> json) => _$ProductPetaniResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$ProductPetaniResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "profesiPenjual")
    ProfesiPenjual? profesiPenjual;
    @JsonKey(name: "namaProducts")
    String? namaProducts;
    @JsonKey(name: "stok")
    int? stok;
    @JsonKey(name: "satuan")
    Satuan? satuan;
    @JsonKey(name: "harga")
    String? harga;
    @JsonKey(name: "deskripsi")
    String? deskripsi;
    @JsonKey(name: "fotoTanaman")
    String? fotoTanaman;
    @JsonKey(name: "status")
    Status? status;
    @JsonKey(name: "accountID")
    String? accountId;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "deletedAt")
    dynamic deletedAt;
    @JsonKey(name: "tbl_akun")
    TblAkun? tblAkun;

    Datum({
        this.id,
        this.profesiPenjual,
        this.namaProducts,
        this.stok,
        this.satuan,
        this.harga,
        this.deskripsi,
        this.fotoTanaman,
        this.status,
        this.accountId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.tblAkun,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

enum ProfesiPenjual {
    @JsonValue("penyuluh")
    PENYULUH,
    @JsonValue("petani")
    PETANI
}

enum Satuan {
    @JsonValue("kg")
    KG,
    @JsonValue("Pcs")
    PCS
}

enum Status {
    @JsonValue("Ready stock")
    READY_STOCK,
    @JsonValue("Ready stok")
    READY_STOK,
    @JsonValue("Tersedia")
    TERSEDIA
}

@JsonSerializable()
class TblAkun {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "no_wa")
    String? noWa;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "pekerjaan")
    String? pekerjaan;
    @JsonKey(name: "peran")
    ProfesiPenjual? peran;
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
    @JsonKey(name: "petani")
    Penyuluh? petani;
    @JsonKey(name: "penyuluh")
    Penyuluh? penyuluh;

    TblAkun({
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
        this.petani,
        this.penyuluh,
    });

    factory TblAkun.fromJson(Map<String, dynamic> json) => _$TblAkunFromJson(json);

    Map<String, dynamic> toJson() => _$TblAkunToJson(this);
}

@JsonSerializable()
class Penyuluh {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "nik")
    String? nik;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "foto")
    String? foto;
    @JsonKey(name: "alamat")
    String? alamat;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "noTelp")
    String? noTelp;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "namaProduct")
    String? namaProduct;
    @JsonKey(name: "kecamatan")
    String? kecamatan;
    @JsonKey(name: "desa")
    String? desa;
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
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "deletedAt")
    dynamic deletedAt;
    @JsonKey(name: "nkk")
    String? nkk;
    @JsonKey(name: "fk_penyuluhId")
    int? fkPenyuluhId;
    @JsonKey(name: "fk_kelompokId")
    int? fkKelompokId;

    Penyuluh({
        this.id,
        this.nik,
        this.nama,
        this.foto,
        this.alamat,
        this.email,
        this.noTelp,
        this.password,
        this.namaProduct,
        this.kecamatan,
        this.desa,
        this.desaBinaan,
        this.kecamatanBinaan,
        this.accountId,
        this.kecamatanId,
        this.desaId,
        this.tipe,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.nkk,
        this.fkPenyuluhId,
        this.fkKelompokId,
    });

    factory Penyuluh.fromJson(Map<String, dynamic> json) => _$PenyuluhFromJson(json);

    Map<String, dynamic> toJson() => _$PenyuluhToJson(this);
}
