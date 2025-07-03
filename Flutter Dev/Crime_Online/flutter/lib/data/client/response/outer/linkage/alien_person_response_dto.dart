import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/alien_person_dto.dart';

part 'alien_person_response_dto.g.dart';

@JsonSerializable()
class AlienPersonResponseDto with ApiStatusResponse{
  AlienPersonResponseDto({
    this.listAlienPersonDto,
  });

  factory AlienPersonResponseDto.fromJson(Map<String, dynamic> json) => _$AlienPersonResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AlienPersonResponseDtoToJson(this);

  @JsonKey(name: 'list_alien_person') ListAlienPersonDto? listAlienPersonDto;

}