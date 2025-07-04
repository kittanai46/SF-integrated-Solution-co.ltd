// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrant_orgcode_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantOrgCodeRequestDto _$WarrantOrgCodeRequestDtoFromJson(
        Map<String, dynamic> json) =>
    WarrantOrgCodeRequestDto(
      conType: json['con_type'] as String?,
      orgCode: json['orgcode'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WarrantOrgCodeRequestDtoToJson(
        WarrantOrgCodeRequestDto instance) =>
    <String, dynamic>{
      'con_type': instance.conType,
      'orgcode': instance.orgCode,
      'lat': instance.lat,
      'lon': instance.lon,
    };
