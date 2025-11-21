
import 'package:json_annotation/json_annotation.dart';
part 'register_payload_model.g.dart';
@JsonSerializable()
class RegisterPaylaodModel {
    @JsonKey(name: "NIP")
    String? nip;
    @JsonKey(name: "nama")
    String? nama;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "NoWa")
    String? noWa;
    @JsonKey(name: "password")
    String? password;
    @JsonKey(name: "alamat")
    String? alamat;
    @JsonKey(name: "tipe")
    String? tipe;
    @JsonKey(name: "kecamatanId")
    int? kecamatanId;
    @JsonKey(name: "kecamatan")
    String? kecamatan;
    @JsonKey(name: "desaId")
    int? desaId;
    @JsonKey(name: "desa")
    String? desa;
    @JsonKey(name: "kecamatanBinaan")
    String? kecamatanBinaan;
    @JsonKey(name: "desaBinaan")
    List<String>? desaBinaan;
    @JsonKey(name: "selectedKelompokIds")
    List<int>? selectedKelompokIds;
    @JsonKey(name: "pekerjaan")
    String? pekerjaan;

    RegisterPaylaodModel({
        this.nip,
        this.nama,
        this.email,
        this.noWa,
        this.password,
        this.alamat,
        this.tipe,
        this.kecamatanId,
        this.kecamatan,
        this.desaId,
        this.desa,
        this.kecamatanBinaan,
        this.desaBinaan,
        this.selectedKelompokIds,
        this.pekerjaan,
    });

    factory RegisterPaylaodModel.fromJson(Map<String, dynamic> json) => _$RegisterPaylaodModelFromJson(json);

    Map<String, dynamic> toJson() => _$RegisterPaylaodModelToJson(this);
}
