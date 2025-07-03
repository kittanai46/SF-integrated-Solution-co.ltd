import 'package:json_annotation/json_annotation.dart';

part 'warrant_pid_request_dto.g.dart';

@JsonSerializable()
class WarrantPidRequestDto {
  WarrantPidRequestDto({this.conType, this.pid, this.lat, this.lon});

  factory WarrantPidRequestDto.fromJson(Map<String, dynamic> json) => _$WarrantPidRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantPidRequestDtoToJson(this);

  @JsonKey(name: 'con_type') String? conType;
  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'lat') double? lat = 0;
  @JsonKey(name: 'lon') double? lon = 0;
}