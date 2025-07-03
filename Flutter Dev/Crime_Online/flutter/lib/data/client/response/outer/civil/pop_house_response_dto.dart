import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/pop_house_dto.dart';

part 'pop_house_response_dto.g.dart';

@JsonSerializable()
class PopHouseResponseDto with ApiStatusResponse{
  PopHouseResponseDto({
    this.listPopHouseDto,
  });

  factory PopHouseResponseDto.fromJson(Map<String, dynamic> json) => _$PopHouseResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PopHouseResponseDtoToJson(this);

  @JsonKey(name: 'list_pop_house') ListPopHouseDto? listPopHouseDto;

}