import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/change_name_dto.dart';

part 'change_name_response_dto.g.dart';

@JsonSerializable()
class ChangeNameResponseDto with ApiStatusResponse{
  ChangeNameResponseDto({
    this.listChangeNameDto,
  });

  factory ChangeNameResponseDto.fromJson(Map<String, dynamic> json) => _$ChangeNameResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeNameResponseDtoToJson(this);

  @JsonKey(name: 'list_change_name') ListChangeNameDto? listChangeNameDto;

}