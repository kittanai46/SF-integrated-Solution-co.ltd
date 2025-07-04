import 'package:json_annotation/json_annotation.dart';

part 'house_request_dto.g.dart';

@JsonSerializable()
class HouseRequestDto {
  HouseRequestDto({this.houseno, this.moo, this.lane, this.soiCode, this.roadCode, this.tambonCode, this.amphurCode, this.provinceCode,this.lat,this.lon});

  factory HouseRequestDto.fromJson(Map<String, dynamic> json) => _$HouseRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HouseRequestDtoToJson(this);

  @JsonKey(name: 'houseno') String? houseno;
  @JsonKey(name: 'moo') String? moo;
  @JsonKey(name: 'lane') String? lane;
  @JsonKey(name: 'SoiCode') String? soiCode;
  @JsonKey(name: 'RoadCode') String? roadCode;
  @JsonKey(name: 'TambonCode') String? tambonCode;
  @JsonKey(name: 'AmphurCode') String? amphurCode;
  @JsonKey(name: 'ProvinceCode') String? provinceCode;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;

}