// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workerid_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerIdRequestDto _$WorkerIdRequestDtoFromJson(Map<String, dynamic> json) =>
    WorkerIdRequestDto(
      workerId: json['worker_id'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WorkerIdRequestDtoToJson(WorkerIdRequestDto instance) =>
    <String, dynamic>{
      'worker_id': instance.workerId,
      'lat': instance.lat,
      'lon': instance.lon,
    };
