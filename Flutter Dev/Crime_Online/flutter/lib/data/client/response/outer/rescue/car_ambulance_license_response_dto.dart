import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/rescue/car_ambulance_license_dto.dart';

part 'car_ambulance_license_response_dto.g.dart';

@JsonSerializable()
class CarAmlResponseDto with ApiStatusResponse{
  CarAmlResponseDto({
    this.listCarAmlDto,
  });

  factory CarAmlResponseDto.fromJson(Map<String, dynamic> json) => _$CarAmlResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CarAmlResponseDtoToJson(this);

  @JsonKey(name: 'list_car_aml') ListCarAmlDto? listCarAmlDto;

}