import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/changename_lk_dto.dart';

part 'changename_lk_response_dto.g.dart';

@JsonSerializable()
class ChangeNameLkResponseDto with ApiStatusResponse{
  ChangeNameLkResponseDto({
    this.listChangeNameLkDto,
  });

  factory ChangeNameLkResponseDto.fromJson(Map<String, dynamic> json) => _$ChangeNameLkResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeNameLkResponseDtoToJson(this);

  @JsonKey(name: 'list_changename_lk') ListChangeNameLkDto? listChangeNameLkDto;

}