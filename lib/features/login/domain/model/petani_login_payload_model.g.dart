// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petani_login_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetaniLoginPayloadModel _$PetaniLoginPayloadModelFromJson(
        Map<String, dynamic> json) =>
    PetaniLoginPayloadModel(
      nik: json['NIK'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$PetaniLoginPayloadModelToJson(
        PetaniLoginPayloadModel instance) =>
    <String, dynamic>{
      'NIK': instance.nik,
      'password': instance.password,
    };
