import 'package:json_annotation/json_annotation.dart';

part 'nearest_station_request_dto.g.dart';

@JsonSerializable()
class NearestStationRequestDto {
  NearestStationRequestDto({
    this.lat,
    this.lon,
  });

  factory NearestStationRequestDto.fromJson(Map<String, dynamic> json) => _$NearestStationRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NearestStationRequestDtoToJson(this);

  @JsonKey(name: 'lat') String? lat;
  @JsonKey(name: 'lon') String? lon;

}