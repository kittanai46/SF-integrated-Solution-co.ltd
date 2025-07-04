// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlateRequestDto _$PlateRequestDtoFromJson(Map<String, dynamic> json) =>
    PlateRequestDto(
      plate1: json['plate1'] as String?,
      plate2: json['plate2'] as String?,
      provcode: json['provcode'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlateRequestDtoToJson(PlateRequestDto instance) =>
    <String, dynamic>{
      'plate1': instance.plate1,
      'plate2': instance.plate2,
      'provcode': instance.provcode,
      'lat': instance.lat,
      'lon': instance.lon,
    };
