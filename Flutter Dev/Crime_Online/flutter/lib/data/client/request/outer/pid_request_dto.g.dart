// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pid_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PidRequestDto _$PidRequestDtoFromJson(Map<String, dynamic> json) =>
    PidRequestDto(
      pid: json['pid'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PidRequestDtoToJson(PidRequestDto instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'lat': instance.lat,
      'lon': instance.lon,
    };
