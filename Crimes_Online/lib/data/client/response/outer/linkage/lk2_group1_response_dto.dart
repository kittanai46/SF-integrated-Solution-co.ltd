import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../dto/outer/linkage/lk2_group1_dto.dart';

part 'lk2_group1_response_dto.g.dart';

@JsonSerializable()
class Lk2Group1ResponseDto with ApiStatusResponse{
  Lk2Group1ResponseDto({
    this.listLk2Group1Dto,
  });

  factory Lk2Group1ResponseDto.fromJson(Map<String, dynamic> json) => _$Lk2Group1ResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Lk2Group1ResponseDtoToJson(this);

  @JsonKey(name: 'list_lk2_group1') ListLk2Group1Dto? listLk2Group1Dto;

}