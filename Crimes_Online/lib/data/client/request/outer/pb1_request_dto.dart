import 'package:json_annotation/json_annotation.dart';

part 'pb1_request_dto.g.dart';

@JsonSerializable()
class Pb1RequestDto {
  Pb1RequestDto({this.pb1,this.lat,this.lon});

  factory Pb1RequestDto.fromJson(Map<String, dynamic> json) => _$Pb1RequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Pb1RequestDtoToJson(this);

  @JsonKey(name: 'pb1') String? pb1;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}