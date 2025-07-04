import 'package:json_annotation/json_annotation.dart';

part 'warrant_name_request_dto.g.dart';

@JsonSerializable()
class WarrantNameRequestDto {
  WarrantNameRequestDto({this.conType, this.fname, this.lname, this.lat, this.lon});

  factory WarrantNameRequestDto.fromJson(Map<String, dynamic> json) => _$WarrantNameRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantNameRequestDtoToJson(this);

  @JsonKey(name: 'con_type') String? conType;
  @JsonKey(name: 'fname') String? fname;
  @JsonKey(name: 'lname') String? lname;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;

}