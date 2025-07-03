import 'package:json_annotation/json_annotation.dart';

part 'warrant_address_request_dto.g.dart';

@JsonSerializable()
class WarrantAddressRequestDto {
  WarrantAddressRequestDto({this.conType, this.province, this.amphur, this.tambon, this.lat, this.lon});

  factory WarrantAddressRequestDto.fromJson(Map<String, dynamic> json) => _$WarrantAddressRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantAddressRequestDtoToJson(this);

  @JsonKey(name: 'con_type') String? conType;
  @JsonKey(name: 'province') String? province;
  @JsonKey(name: 'amphur') String? amphur;
  @JsonKey(name: 'tambon') String? tambon;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}