import 'package:json_annotation/json_annotation.dart';

part 'plate_emc_request_dto.g.dart';

@JsonSerializable()
class PlateEmcRequestDto {
  PlateEmcRequestDto({
    this.intitialNo,
    this.number,
    this.provcode,
    this.lat,
    this.lon
  });

  factory PlateEmcRequestDto.fromJson(Map<String, dynamic> json) => _$PlateEmcRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlateEmcRequestDtoToJson(this);

  @JsonKey(name: 'intitialno') String? intitialNo;
  @JsonKey(name: 'number') String? number;
  @JsonKey(name: 'provcode') String? provcode;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}