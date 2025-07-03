import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/foreign/worker_dto.dart';

part 'worker_response_dto.g.dart';

@JsonSerializable()
class WorkerResponseDto with ApiStatusResponse{
  WorkerResponseDto({
    this.listWorkerDto,
  });

  factory WorkerResponseDto.fromJson(Map<String, dynamic> json) => _$WorkerResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerResponseDtoToJson(this);

  @JsonKey(name: 'list_worker') ListWorkerDto? listWorkerDto;

}