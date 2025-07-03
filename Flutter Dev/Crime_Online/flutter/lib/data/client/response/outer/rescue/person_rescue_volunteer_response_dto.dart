import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/rescue/person_rescue_volunteer_dto.dart';

part 'person_rescue_volunteer_response_dto.g.dart';

@JsonSerializable()
class PersonRvResponseDto with ApiStatusResponse{
  PersonRvResponseDto({
    this.listPersonRvDto,
  });

  factory PersonRvResponseDto.fromJson(Map<String, dynamic> json) => _$PersonRvResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonRvResponseDtoToJson(this);

  @JsonKey(name: 'list_person_rv') ListPersonRvDto? listPersonRvDto;

}