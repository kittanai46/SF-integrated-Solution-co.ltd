import 'package:json_annotation/json_annotation.dart';

part 'pid_plt_request_dto.g.dart';

@JsonSerializable()
class PidPltRequestDto {
  PidPltRequestDto({this.pid, this.pltcode,this.lat,this.lon});

  factory PidPltRequestDto.fromJson(Map<String, dynamic> json) => _$PidPltRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PidPltRequestDtoToJson(this);

  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'pltcode') String? pltcode;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}