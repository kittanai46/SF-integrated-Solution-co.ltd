import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/profile/eula_dto.dart';

part 'eula_response_dto.g.dart';

@JsonSerializable()
class EulaResponseDto with ApiStatusResponse{
  EulaResponseDto({
    this.listEulaDto,
  });

  factory EulaResponseDto.fromJson(Map<String, dynamic> json) => _$EulaResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EulaResponseDtoToJson(this);

  @JsonKey(name: 'list_eula') ListEulaDto? listEulaDto;

}