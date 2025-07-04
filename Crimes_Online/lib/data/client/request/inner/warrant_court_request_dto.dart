import 'package:json_annotation/json_annotation.dart';

part 'warrant_court_request_dto.g.dart';

@JsonSerializable()
class WarrantCourtRequestDto {
  WarrantCourtRequestDto({this.conType, this.court, this.lat, this.lon});

  factory WarrantCourtRequestDto.fromJson(Map<String, dynamic> json) => _$WarrantCourtRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantCourtRequestDtoToJson(this);

  @JsonKey(name: 'con_type') String? conType;
  @JsonKey(name: 'court') String? court;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}