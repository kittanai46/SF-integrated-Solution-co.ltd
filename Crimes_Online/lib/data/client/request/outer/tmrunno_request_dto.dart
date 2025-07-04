import 'package:json_annotation/json_annotation.dart';

part 'tmrunno_request_dto.g.dart';

@JsonSerializable()
class TmRunnoRequestDto {
  TmRunnoRequestDto({
    this.tmrunno,this.lat,this.lon
  });

  factory TmRunnoRequestDto.fromJson(Map<String, dynamic> json) => _$TmRunnoRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TmRunnoRequestDtoToJson(this);

  @JsonKey(name: 'tmrunno') String? tmrunno;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}