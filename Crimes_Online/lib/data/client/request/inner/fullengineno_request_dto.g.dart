// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullengineno_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullEngineNoRequestDto _$FullEngineNoRequestDtoFromJson(
        Map<String, dynamic> json) =>
    FullEngineNoRequestDto(
      engineNo: json['engineno'] as String?,
      status: json['status'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FullEngineNoRequestDtoToJson(
        FullEngineNoRequestDto instance) =>
    <String, dynamic>{
      'engineno': instance.engineNo,
      'status': instance.status,
      'lat': instance.lat,
      'lon': instance.lon,
    };
