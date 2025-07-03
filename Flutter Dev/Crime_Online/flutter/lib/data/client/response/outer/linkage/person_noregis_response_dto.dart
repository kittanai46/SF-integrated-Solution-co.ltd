import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:crimes/data/dto/outer/linkage/person_noregis_dto.dart';


part 'person_noregis_response_dto.g.dart';

@JsonSerializable()
class PersonNoRegisResponseDto with ApiStatusResponse{
  PersonNoRegisResponseDto({
    this.listPersonNoRegisDto,
  });

  factory PersonNoRegisResponseDto.fromJson(Map<String, dynamic> json) => _$PersonNoRegisResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonNoRegisResponseDtoToJson(this);

  @JsonKey(name: 'list_person_noregis') ListPersonNoRegisDto? listPersonNoRegisDto;

}