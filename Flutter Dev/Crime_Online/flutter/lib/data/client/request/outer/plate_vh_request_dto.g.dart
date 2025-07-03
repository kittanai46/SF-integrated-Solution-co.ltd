// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_vh_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlateVhRequestDto _$PlateVhRequestDtoFromJson(Map<String, dynamic> json) =>
    PlateVhRequestDto(
      plate1: json['plate1'] as String?,
      plate2: json['plate2'] as String?,
      provcode: json['provcode'] as String?,
      vhtype: json['vhtype'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlateVhRequestDtoToJson(PlateVhRequestDto instance) =>
    <String, dynamic>{
      'plate1': instance.plate1,
      'plate2': instance.plate2,
      'provcode': instance.provcode,
      'vhtype': instance.vhtype,
      'lat': instance.lat,
      'lon': instance.lon,
    };
