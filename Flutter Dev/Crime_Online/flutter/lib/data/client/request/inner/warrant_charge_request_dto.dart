import 'package:json_annotation/json_annotation.dart';

part 'warrant_charge_request_dto.g.dart';

@JsonSerializable()
class WarrantChargeRequestDto {
  WarrantChargeRequestDto({this.conType, this.charge, this.lat, this.lon});

  factory WarrantChargeRequestDto.fromJson(Map<String, dynamic> json) => _$WarrantChargeRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantChargeRequestDtoToJson(this);

  @JsonKey(name: 'con_type') String? conType;
  @JsonKey(name: 'charge') String? charge;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}