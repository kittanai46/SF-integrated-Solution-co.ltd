import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/house_lk_dto.dart';

part 'house_lk_response_dto.g.dart';

@JsonSerializable()
class HouseLkResponseDto with ApiStatusResponse{
  HouseLkResponseDto({
    this.listHouseLkDto,
  });

  factory HouseLkResponseDto.fromJson(Map<String, dynamic> json) => _$HouseLkResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HouseLkResponseDtoToJson(this);

  @JsonKey(name: 'list_house_lk') ListHouseLkDto? listHouseLkDto;

}