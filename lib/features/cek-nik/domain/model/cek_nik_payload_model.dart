import 'package:json_annotation/json_annotation.dart';

part 'cek_nik_payload_model.g.dart';

@JsonSerializable()
class CekNikPayloadModel {
  @JsonKey(name: "nik")
  String? nik;

  CekNikPayloadModel({this.nik});

  factory CekNikPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$CekNikPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$CekNikPayloadModelToJson(this);
}
