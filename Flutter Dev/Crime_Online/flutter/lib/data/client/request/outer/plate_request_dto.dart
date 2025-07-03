import 'package:json_annotation/json_annotation.dart';

part 'plate_request_dto.g.dart';

@JsonSerializable()
class PlateRequestDto {
  PlateRequestDto({
    this.plate1,
    this.plate2,
    this.provcode,
    this.lat,this.lon
  });

  factory PlateRequestDto.fromJson(Map<String, dynamic> json) => _$PlateRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlateRequestDtoToJson(this);

  @JsonKey(name: 'plate1') String? plate1;
  @JsonKey(name: 'plate2') String? plate2;
  @JsonKey(name: 'provcode') String? provcode;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}