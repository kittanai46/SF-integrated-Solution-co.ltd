import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/person_dto.dart';

part 'person_response_dto.g.dart';

@JsonSerializable()
class PersonResponseDto with ApiStatusResponse{
  PersonResponseDto({
    this.listPersonDto,
  });

  factory PersonResponseDto.fromJson(Map<String, dynamic> json) => _$PersonResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonResponseDtoToJson(this);

  @JsonKey(name: 'list_person') ListPersonDto? listPersonDto;

}