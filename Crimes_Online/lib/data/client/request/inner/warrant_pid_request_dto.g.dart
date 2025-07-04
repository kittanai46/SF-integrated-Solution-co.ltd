// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrant_pid_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantPidRequestDto _$WarrantPidRequestDtoFromJson(
        Map<String, dynamic> json) =>
    WarrantPidRequestDto(
      conType: json['con_type'] as String?,
      pid: json['pid'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WarrantPidRequestDtoToJson(
        WarrantPidRequestDto instance) =>
    <String, dynamic>{
      'con_type': instance.conType,
      'pid': instance.pid,
      'lat': instance.lat,
      'lon': instance.lon,
    };
