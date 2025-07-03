// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_license_info_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverLicenseInfoResponseDto _$DriverLicenseInfoResponseDtoFromJson(
        Map<String, dynamic> json) =>
    DriverLicenseInfoResponseDto(
      listDriverLicenseInfo: json['list_driver_license_info'] == null
          ? null
          : ListDriverLicenseInfoDto.fromJson(
              json['list_driver_license_info'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DriverLicenseInfoResponseDtoToJson(
        DriverLicenseInfoResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_driver_license_info': instance.listDriverLicenseInfo,
    };
