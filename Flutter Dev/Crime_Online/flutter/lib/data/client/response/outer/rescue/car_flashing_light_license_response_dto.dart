import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/rescue/car_flashing_light_license_dto.dart';

part 'car_flashing_light_license_response_dto.g.dart';

@JsonSerializable()
class CarFllResponseDto with ApiStatusResponse{
  CarFllResponseDto({
    this.listCarFllDto,
  });

  factory CarFllResponseDto.fromJson(Map<String, dynamic> json) => _$CarFllResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CarFllResponseDtoToJson(this);

  @JsonKey(name: 'list_car_fll') ListCarFllDto? listCarFllDto;

}