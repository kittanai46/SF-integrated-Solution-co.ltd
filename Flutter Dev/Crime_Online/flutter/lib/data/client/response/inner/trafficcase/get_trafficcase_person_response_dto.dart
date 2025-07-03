import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_person_dto.dart';

part 'get_trafficcase_person_response_dto.g.dart';

@JsonSerializable()
class GetTrafficCasePersonResponseDto with ApiStatusResponse{
  GetTrafficCasePersonResponseDto({
    this.listTrafficCasePerson,
  });

  factory GetTrafficCasePersonResponseDto.fromJson(Map<String, dynamic> json) => _$GetTrafficCasePersonResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetTrafficCasePersonResponseDtoToJson(this);

  @JsonKey(name: 'list_trafficcase_person') ListTrafficCasePersonDto? listTrafficCasePerson;

}