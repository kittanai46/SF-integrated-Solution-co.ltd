import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/foreignhouse/tm61_dto.dart';

part 'tm61_response_dto.g.dart';

@JsonSerializable()
class Tm61ResponseDto with ApiStatusResponse{
  Tm61ResponseDto({
    this.listTm61Dto,
  });

  factory Tm61ResponseDto.fromJson(Map<String, dynamic> json) => _$Tm61ResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$Tm61ResponseDtoToJson(this);

  @JsonKey(name: 'list_tm61') ListTm61Dto? listTm61Dto;

}