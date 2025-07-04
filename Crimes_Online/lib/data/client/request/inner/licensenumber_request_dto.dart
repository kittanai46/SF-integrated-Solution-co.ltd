import 'package:json_annotation/json_annotation.dart';

part 'licensenumber_request_dto.g.dart';

@JsonSerializable()
class LicenseNumberRequestDto {
  LicenseNumberRequestDto({this.licensenumber, this.lat, this.lon});

  factory LicenseNumberRequestDto.fromJson(Map<String, dynamic> json) => _$LicenseNumberRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LicenseNumberRequestDtoToJson(this);

  @JsonKey(name: 'license_number') String? licensenumber;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}