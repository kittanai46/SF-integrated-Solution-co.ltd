// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'licensenumber_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicenseNumberRequestDto _$LicenseNumberRequestDtoFromJson(
        Map<String, dynamic> json) =>
    LicenseNumberRequestDto(
      licensenumber: json['license_number'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LicenseNumberRequestDtoToJson(
        LicenseNumberRequestDto instance) =>
    <String, dynamic>{
      'license_number': instance.licensenumber,
      'lat': instance.lat,
      'lon': instance.lon,
    };
