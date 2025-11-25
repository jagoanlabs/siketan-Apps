// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_statistik_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingStatstikResponseModel _$LandingStatstikResponseModelFromJson(
  Map<String, dynamic> json,
) => LandingStatstikResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LandingStatstikResponseModelToJson(
  LandingStatstikResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  ringkasan: json['ringkasan'] == null
      ? null
      : Ringkasan.fromJson(json['ringkasan'] as Map<String, dynamic>),
  commodityData: (json['commodityData'] as List<dynamic>?)
      ?.map((e) => CommodityDatum.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'ringkasan': instance.ringkasan,
  'commodityData': instance.commodityData,
};

CommodityDatum _$CommodityDatumFromJson(Map<String, dynamic> json) =>
    CommodityDatum(
      month: json['month'] as String?,
      commodities: (json['commodities'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$CommodityDatumToJson(CommodityDatum instance) =>
    <String, dynamic>{
      'month': instance.month,
      'commodities': instance.commodities,
    };

Ringkasan _$RingkasanFromJson(Map<String, dynamic> json) => Ringkasan(
  jumlahPetani: (json['jumlahPetani'] as num?)?.toInt(),
  jumlahGapoktan: (json['jumlahGapoktan'] as num?)?.toInt(),
  jumlahPenyuluh: (json['jumlahPenyuluh'] as num?)?.toInt(),
  areaPertanian: (json['areaPertanian'] as num?)?.toDouble(),
  jumlahKomoditas: (json['jumlahKomoditas'] as num?)?.toInt(),
);

Map<String, dynamic> _$RingkasanToJson(Ringkasan instance) => <String, dynamic>{
  'jumlahPetani': instance.jumlahPetani,
  'jumlahGapoktan': instance.jumlahGapoktan,
  'jumlahPenyuluh': instance.jumlahPenyuluh,
  'areaPertanian': instance.areaPertanian,
  'jumlahKomoditas': instance.jumlahKomoditas,
};
