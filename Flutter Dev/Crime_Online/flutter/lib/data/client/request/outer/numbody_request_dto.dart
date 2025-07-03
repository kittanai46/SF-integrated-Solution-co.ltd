import 'package:json_annotation/json_annotation.dart';

part 'numbody_request_dto.g.dart';

@JsonSerializable()
class NumBodyRequestDto {
  NumBodyRequestDto({
    this.numbody,
    this.brncode,this.lat,this.lon
  });

  factory NumBodyRequestDto.fromJson(Map<String, dynamic> json) => _$NumBodyRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NumBodyRequestDtoToJson(this);

  @JsonKey(name: 'numbody') String? numbody;
  @JsonKey(name: 'brncode') String? brncode;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}