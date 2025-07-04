import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/rescue/person_rescue_training_dto.dart';

part 'person_rescue_training_response_dto.g.dart';

@JsonSerializable()
class PersonRtResponseDto with ApiStatusResponse{
  PersonRtResponseDto({
    this.listPersonRtDto,
  });

  factory PersonRtResponseDto.fromJson(Map<String, dynamic> json) => _$PersonRtResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonRtResponseDtoToJson(this);

  @JsonKey(name: 'list_person_rt') ListPersonRtDto? listPersonRtDto;

}