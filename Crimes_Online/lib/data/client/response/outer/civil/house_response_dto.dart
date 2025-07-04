import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/house_dto.dart';

part 'house_response_dto.g.dart';

@JsonSerializable()
class HouseResponseDto with ApiStatusResponse{
  HouseResponseDto({
    this.listHouseDto,
  });

  factory HouseResponseDto.fromJson(Map<String, dynamic> json) => _$HouseResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HouseResponseDtoToJson(this);

  @JsonKey(name: 'list_house') ListHouseDto? listHouseDto;

}