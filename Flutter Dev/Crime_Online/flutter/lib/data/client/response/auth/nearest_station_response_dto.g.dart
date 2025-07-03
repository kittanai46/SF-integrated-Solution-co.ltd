// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearest_station_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearestStationResponseDto _$NearestStationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    NearestStationResponseDto(
      orgCode: json['org_code'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      dist: json['dist'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$NearestStationResponseDtoToJson(
        NearestStationResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'org_code': instance.orgCode,
      'name': instance.name,
      'address': instance.address,
      'dist': instance.dist,
      'lat': instance.lat,
      'lon': instance.lon,
    };
