import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/prisoner/prisoner_dto.dart';

part 'prisoner_response_dto.g.dart';

@JsonSerializable()
class PrisonerResponseDto with ApiStatusResponse{
  PrisonerResponseDto({
    this.listPrisonerDto,
  });

  factory PrisonerResponseDto.fromJson(Map<String, dynamic> json) => _$PrisonerResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PrisonerResponseDtoToJson(this);

  @JsonKey(name: 'list_Prisoner') ListPrisonerDto? listPrisonerDto;

}