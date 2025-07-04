import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/p4/gun_dto.dart';

part 'gun_response_dto.g.dart';

@JsonSerializable()
class GunResponseDto with ApiStatusResponse{
  GunResponseDto({
    this.listGunDto,
  });

  factory GunResponseDto.fromJson(Map<String, dynamic> json) => _$GunResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GunResponseDtoToJson(this);

  @JsonKey(name: 'list_gun') ListGunDto? listGunDto;

}