import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/idc_dto.dart';

part 'idc_response_dto.g.dart';

@JsonSerializable()
class IdcResponseDto with ApiStatusResponse{
  IdcResponseDto({
    this.listIdcDto,
  });

  factory IdcResponseDto.fromJson(Map<String, dynamic> json) => _$IdcResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$IdcResponseDtoToJson(this);

  @JsonKey(name: 'list_idc') ListIdcDto? listIdcDto;

}