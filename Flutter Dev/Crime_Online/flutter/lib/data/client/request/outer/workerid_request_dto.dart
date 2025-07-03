import 'package:json_annotation/json_annotation.dart';

part 'workerid_request_dto.g.dart';

@JsonSerializable()
class WorkerIdRequestDto {
  WorkerIdRequestDto({this.workerId,this.lat,this.lon});

  factory WorkerIdRequestDto.fromJson(Map<String, dynamic> json) => _$WorkerIdRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerIdRequestDtoToJson(this);

  @JsonKey(name: 'worker_id') String? workerId;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}