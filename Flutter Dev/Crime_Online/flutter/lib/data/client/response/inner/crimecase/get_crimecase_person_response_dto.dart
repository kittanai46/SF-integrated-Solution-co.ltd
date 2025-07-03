import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_person_dto.dart';

part 'get_crimecase_person_response_dto.g.dart';

@JsonSerializable()
class GetCrimeCasePersonResponseDto with ApiStatusResponse{
  GetCrimeCasePersonResponseDto({
    this.listCrimeCasePerson,
  });

  factory GetCrimeCasePersonResponseDto.fromJson(Map<String, dynamic> json) => _$GetCrimeCasePersonResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetCrimeCasePersonResponseDtoToJson(this);

  @JsonKey(name: 'list_crimecase_person') ListCrimeCasePersonDto? listCrimeCasePerson;

}