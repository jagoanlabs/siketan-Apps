import 'package:json_annotation/json_annotation.dart';

part 'landing_statistik_response_model.g.dart';

@JsonSerializable()
class LandingStatstikResponseModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  LandingStatstikResponseModel({this.success, this.message, this.data});

  factory LandingStatstikResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LandingStatstikResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LandingStatstikResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "ringkasan")
  Ringkasan? ringkasan;
  @JsonKey(name: "commodityData")
  List<CommodityDatum>? commodityData;

  Data({this.ringkasan, this.commodityData});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CommodityDatum {
  @JsonKey(name: "month")
  String? month;
  @JsonKey(name: "commodities")
  Map<String, double>? commodities;

  CommodityDatum({this.month, this.commodities});

  factory CommodityDatum.fromJson(Map<String, dynamic> json) =>
      _$CommodityDatumFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityDatumToJson(this);
}

@JsonSerializable()
class Ringkasan {
  @JsonKey(name: "jumlahPetani")
  int? jumlahPetani;
  @JsonKey(name: "jumlahGapoktan")
  int? jumlahGapoktan;
  @JsonKey(name: "jumlahPenyuluh")
  int? jumlahPenyuluh;
  @JsonKey(name: "areaPertanian")
  double? areaPertanian;
  @JsonKey(name: "jumlahKomoditas")
  int? jumlahKomoditas;

  Ringkasan({
    this.jumlahPetani,
    this.jumlahGapoktan,
    this.jumlahPenyuluh,
    this.areaPertanian,
    this.jumlahKomoditas,
  });

  factory Ringkasan.fromJson(Map<String, dynamic> json) =>
      _$RingkasanFromJson(json);

  Map<String, dynamic> toJson() => _$RingkasanToJson(this);
}
