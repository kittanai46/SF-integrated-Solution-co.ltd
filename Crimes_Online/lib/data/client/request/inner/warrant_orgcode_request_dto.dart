import 'package:json_annotation/json_annotation.dart';

part 'warrant_orgcode_request_dto.g.dart';

@JsonSerializable()
class WarrantOrgCodeRequestDto {
  WarrantOrgCodeRequestDto({this.conType, this.orgCode, this.lat, this.lon});

  factory WarrantOrgCodeRequestDto.fromJson(Map<String, dynamic> json) => _$WarrantOrgCodeRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantOrgCodeRequestDtoToJson(this);

  @JsonKey(name: 'con_type') String? conType;
  @JsonKey(name: 'orgcode') String? orgCode;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}