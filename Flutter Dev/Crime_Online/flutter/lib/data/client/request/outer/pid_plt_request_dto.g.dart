// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pid_plt_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PidPltRequestDto _$PidPltRequestDtoFromJson(Map<String, dynamic> json) =>
    PidPltRequestDto(
      pid: json['pid'] as String?,
      pltcode: json['pltcode'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PidPltRequestDtoToJson(PidPltRequestDto instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'pltcode': instance.pltcode,
      'lat': instance.lat,
      'lon': instance.lon,
    };
