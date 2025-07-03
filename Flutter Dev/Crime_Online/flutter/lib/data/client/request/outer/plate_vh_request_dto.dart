import 'package:json_annotation/json_annotation.dart';

part 'plate_vh_request_dto.g.dart';

@JsonSerializable()
class PlateVhRequestDto {
  PlateVhRequestDto({
    this.plate1,
    this.plate2,
    this.provcode,
    this.vhtype,this.lat,this.lon
  });

  factory PlateVhRequestDto.fromJson(Map<String, dynamic> json) => _$PlateVhRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlateVhRequestDtoToJson(this);

  @JsonKey(name: 'plate1') String? plate1;
  @JsonKey(name: 'plate2') String? plate2;
  @JsonKey(name: 'provcode') String? provcode;
  @JsonKey(name: 'vhtype') String? vhtype;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}