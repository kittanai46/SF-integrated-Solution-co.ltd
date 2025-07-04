import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:crimes/data/dto/outer/linkage/person_nonthai_dto.dart';


part 'person_nonthai_response_dto.g.dart';

@JsonSerializable()
class PersonNonThaiResponseDto with ApiStatusResponse{
  PersonNonThaiResponseDto({
    this.listPersonNonThaiDto,
  });

  factory PersonNonThaiResponseDto.fromJson(Map<String, dynamic> json) => _$PersonNonThaiResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonNonThaiResponseDtoToJson(this);

  @JsonKey(name: 'list_person_nonthai') ListPersonNonThaiDto? listPersonNonThaiDto;

}