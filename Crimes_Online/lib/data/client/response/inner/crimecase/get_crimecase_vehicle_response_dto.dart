import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_vehicle_dto.dart';

part 'get_crimecase_vehicle_response_dto.g.dart';

@JsonSerializable()
class GetCrimeCaseVehicleResponseDto with ApiStatusResponse{
  GetCrimeCaseVehicleResponseDto({
    this.listCrimeCaseVehicle,
  });

  factory GetCrimeCaseVehicleResponseDto.fromJson(Map<String, dynamic> json) => _$GetCrimeCaseVehicleResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetCrimeCaseVehicleResponseDtoToJson(this);

  @JsonKey(name: 'list_crimecase_vehicle') ListCrimeCaseVehicleDto? listCrimeCaseVehicle;

}