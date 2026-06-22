import 'package:json_annotation/json_annotation.dart';
part 'petani_login_payload_model.g.dart';

@JsonSerializable()
class PetaniLoginPayloadModel {
    @JsonKey(name: "NIK")
    String? nik;
    @JsonKey(name: "password")
    String? password;

    PetaniLoginPayloadModel({
        this.nik,
        this.password,
    });

    factory PetaniLoginPayloadModel.fromJson(Map<String, dynamic> json) => _$PetaniLoginPayloadModelFromJson(json);

    Map<String, dynamic> toJson() => _$PetaniLoginPayloadModelToJson(this);
}
