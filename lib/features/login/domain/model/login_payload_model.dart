import 'package:json_annotation/json_annotation.dart';
part 'login_payload_model.g.dart';

@JsonSerializable()
class LoginPayloadModel {
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "password")
    String? password;

    LoginPayloadModel({
        this.email,
        this.password,
    });

    factory LoginPayloadModel.fromJson(Map<String, dynamic> json) => _$LoginPayloadModelFromJson(json);

    Map<String, dynamic> toJson() => _$LoginPayloadModelToJson(this);
}
