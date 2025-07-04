import 'package:json_annotation/json_annotation.dart';

part 'name_plt_request_dto.g.dart';

@JsonSerializable()
class NamePltRequestDto {
  NamePltRequestDto({this.fname, this.lname, this.pltcode,this.lat,this.lon});

  factory NamePltRequestDto.fromJson(Map<String, dynamic> json) => _$NamePltRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NamePltRequestDtoToJson(this);

  @JsonKey(name: 'fname') String? fname;
  @JsonKey(name: 'lname') String? lname;
  @JsonKey(name: 'pltcode') String? pltcode;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}