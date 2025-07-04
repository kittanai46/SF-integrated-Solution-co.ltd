import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nearest_station_response_dto.g.dart';

@JsonSerializable()
class NearestStationResponseDto  with ApiStatusResponse {
  NearestStationResponseDto({this.orgCode, this.name, this.address, this.dist, this.lat, this.lon});

  factory NearestStationResponseDto.fromJson(Map<String, dynamic> json) => _$NearestStationResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NearestStationResponseDtoToJson(this);

  @JsonKey(name: 'org_code') String? orgCode;
  @JsonKey(name: 'name') String? name;
  @JsonKey(name: 'address') String? address;
  @JsonKey(name: 'dist') String? dist;
  @JsonKey(name: 'lat') String? lat;
  @JsonKey(name: 'lon') String? lon;

}