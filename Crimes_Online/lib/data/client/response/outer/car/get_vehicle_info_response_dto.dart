import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/car/vehicle_info_dto.dart';

part 'get_vehicle_info_response_dto.g.dart';

@JsonSerializable()
class GetVehicleInfoResponseDto with ApiStatusResponse{
  GetVehicleInfoResponseDto({
    this.listVehicleInfo,
  });

  factory GetVehicleInfoResponseDto.fromJson(Map<String, dynamic> json) => _$GetVehicleInfoResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetVehicleInfoResponseDtoToJson(this);

  @JsonKey(name: 'list_vehicle_info') ListVehicleInfoDto? listVehicleInfo;

}