import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../dto/outer/linkage/alien_worker_dto.dart';

part 'alien_worker_response_dto.g.dart';

@JsonSerializable()
class AlienWorkerResponseDto with ApiStatusResponse{
  AlienWorkerResponseDto({
    this.listAlienWorkerDto,
  });

  factory AlienWorkerResponseDto.fromJson(Map<String, dynamic> json) => _$AlienWorkerResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AlienWorkerResponseDtoToJson(this);

  @JsonKey(name: 'list_alien_worker') ListAlienWorkerDto? listAlienWorkerDto;

}