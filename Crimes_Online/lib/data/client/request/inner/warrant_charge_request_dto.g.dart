// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrant_charge_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantChargeRequestDto _$WarrantChargeRequestDtoFromJson(
        Map<String, dynamic> json) =>
    WarrantChargeRequestDto(
      conType: json['con_type'] as String?,
      charge: json['charge'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WarrantChargeRequestDtoToJson(
        WarrantChargeRequestDto instance) =>
    <String, dynamic>{
      'con_type': instance.conType,
      'charge': instance.charge,
      'lat': instance.lat,
      'lon': instance.lon,
    };
