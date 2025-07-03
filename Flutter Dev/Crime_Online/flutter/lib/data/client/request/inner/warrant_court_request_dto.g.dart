// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrant_court_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantCourtRequestDto _$WarrantCourtRequestDtoFromJson(
        Map<String, dynamic> json) =>
    WarrantCourtRequestDto(
      conType: json['con_type'] as String?,
      court: json['court'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WarrantCourtRequestDtoToJson(
        WarrantCourtRequestDto instance) =>
    <String, dynamic>{
      'con_type': instance.conType,
      'court': instance.court,
      'lat': instance.lat,
      'lon': instance.lon,
    };
