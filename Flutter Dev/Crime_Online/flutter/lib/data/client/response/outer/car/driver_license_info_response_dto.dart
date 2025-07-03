import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/car/driver_license_info_dto.dart';

part 'driver_license_info_response_dto.g.dart';

@JsonSerializable()
class DriverLicenseInfoResponseDto with ApiStatusResponse{
  DriverLicenseInfoResponseDto({
    this.listDriverLicenseInfo,
  });

  factory DriverLicenseInfoResponseDto.fromJson(Map<String, dynamic> json) => _$DriverLicenseInfoResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DriverLicenseInfoResponseDtoToJson(this);

  @JsonKey(name: 'list_driver_license_info') ListDriverLicenseInfoDto? listDriverLicenseInfo;

}