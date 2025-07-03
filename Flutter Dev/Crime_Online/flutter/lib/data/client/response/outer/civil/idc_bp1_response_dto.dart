import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/idc_bp1_dto.dart';

part 'idc_bp1_response_dto.g.dart';

@JsonSerializable()
class IdcBp1ResponseDto with ApiStatusResponse{
  IdcBp1ResponseDto({
    this.listIdcBp1Dto,
  });

  factory IdcBp1ResponseDto.fromJson(Map<String, dynamic> json) => _$IdcBp1ResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$IdcBp1ResponseDtoToJson(this);

  @JsonKey(name: 'list_idc_bp1') ListIdcBp1Dto? listIdcBp1Dto;

}