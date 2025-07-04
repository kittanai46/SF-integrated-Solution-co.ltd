import 'package:json_annotation/json_annotation.dart';

part 'name_request_dto.g.dart';

@JsonSerializable()
class NameRequestDto {
  NameRequestDto({this.fname, this.lname,this.lat,this.lon});

  factory NameRequestDto.fromJson(Map<String, dynamic> json) => _$NameRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NameRequestDtoToJson(this);

  @JsonKey(name: 'fname') String? fname;
  @JsonKey(name: 'lname') String? lname;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}