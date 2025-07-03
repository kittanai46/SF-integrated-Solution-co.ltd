import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../dto/outer/immigration/imm_dto.dart';

part 'imm_response_dto.g.dart';

@JsonSerializable()
class ImmResponseDto with ApiStatusResponse{
  ImmResponseDto({
    this.listImmDto,
  });

  factory ImmResponseDto.fromJson(Map<String, dynamic> json) => _$ImmResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImmResponseDtoToJson(this);

  @JsonKey(name: 'list_imm') ListImmDto? listImmDto;

}