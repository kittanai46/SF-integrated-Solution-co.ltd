import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/health/health_dto.dart';

part 'health_response_dto.g.dart';

@JsonSerializable()
class HealthResponseDto with ApiStatusResponse{
  HealthResponseDto({
    this.listHealthDto,
  });

  factory HealthResponseDto.fromJson(Map<String, dynamic> json) => _$HealthResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HealthResponseDtoToJson(this);

  @JsonKey(name: 'list_health') ListHealthDto? listHealthDto;

}