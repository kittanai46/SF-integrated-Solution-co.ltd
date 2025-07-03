import 'package:json_annotation/json_annotation.dart';

part 'gun_request_dto.g.dart';

@JsonSerializable()
class GunRequestDto {
  GunRequestDto({this.gunReg,this.lat,this.lon});

  factory GunRequestDto.fromJson(Map<String, dynamic> json) => _$GunRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GunRequestDtoToJson(this);

  @JsonKey(name: 'gunReg') String? gunReg;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}