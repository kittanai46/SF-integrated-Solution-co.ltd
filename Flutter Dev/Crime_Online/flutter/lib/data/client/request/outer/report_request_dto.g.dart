// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportRequestDto _$ReportRequestDtoFromJson(Map<String, dynamic> json) =>
    ReportRequestDto(
      jsonMsg: json['json_msg'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ReportRequestDtoToJson(ReportRequestDto instance) =>
    <String, dynamic>{
      'json_msg': instance.jsonMsg,
      'lat': instance.lat,
      'lon': instance.lon,
    };
