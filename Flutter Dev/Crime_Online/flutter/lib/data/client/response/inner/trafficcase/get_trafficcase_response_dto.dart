import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_dto.dart';

part 'get_trafficcase_response_dto.g.dart';

@JsonSerializable()
class GetTrafficCaseResponseDto with ApiStatusResponse{
  GetTrafficCaseResponseDto({
    this.listTrafficCase,
  });

  factory GetTrafficCaseResponseDto.fromJson(Map<String, dynamic> json) => _$GetTrafficCaseResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetTrafficCaseResponseDtoToJson(this);

  @JsonKey(name: 'list_trafficcase') ListTrafficCaseDto? listTrafficCase;

}