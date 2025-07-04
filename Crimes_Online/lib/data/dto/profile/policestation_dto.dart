import 'package:json_annotation/json_annotation.dart';

part 'policestation_dto.g.dart';

@JsonSerializable()
class PoliceStationDto {
  PoliceStationDto({
    this.org_name,
    this.org_code,
  });

  factory PoliceStationDto.fromJson(Map<String, dynamic> json) => _$PoliceStationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PoliceStationDtoToJson(this);
 
  @JsonKey(name: 'org_name') String? org_name;
  @JsonKey(name: 'org_code') String? org_code;
}

@JsonSerializable()
class ListPoliceStationDto {
  ListPoliceStationDto({
    this.status,
    this.data,
  });

  factory ListPoliceStationDto.fromJson(Map<String, dynamic> json) => _$ListPoliceStationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPoliceStationDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PoliceStationDto>? data;
}