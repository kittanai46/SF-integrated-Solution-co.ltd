import 'package:json_annotation/json_annotation.dart';

part 'pid_request_dto.g.dart';

@JsonSerializable()
class PidRequestDto {
  PidRequestDto({this.pid,this.lat,this.lon});

  factory PidRequestDto.fromJson(Map<String, dynamic> json) => _$PidRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PidRequestDtoToJson(this);

  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}