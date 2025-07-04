import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/person_lk_dto.dart';

part 'person_lk_response_dto.g.dart';

@JsonSerializable()
class PersonLkResponseDto with ApiStatusResponse{
  PersonLkResponseDto({
    this.listPersonLkDto,
  });

  factory PersonLkResponseDto.fromJson(Map<String, dynamic> json) => _$PersonLkResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonLkResponseDtoToJson(this);

  @JsonKey(name: 'list_person_lk') ListPersonLkDto? listPersonLkDto;

}