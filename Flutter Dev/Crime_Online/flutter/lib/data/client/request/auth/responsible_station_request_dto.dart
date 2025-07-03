import 'package:json_annotation/json_annotation.dart';

part 'responsible_station_request_dto.g.dart';

@JsonSerializable()
class ResponsibleStationRequestDto {
  ResponsibleStationRequestDto ({
    this.lat,
    this.lon,
  });

  factory ResponsibleStationRequestDto.fromJson(Map<String, dynamic> json) => _$ResponsibleStationRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsibleStationRequestDtoToJson(this);

  @JsonKey(name: 'lat') String? lat;
  @JsonKey(name: 'lon') String? lon;

}