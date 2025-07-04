// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrant_name_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantNameRequestDto _$WarrantNameRequestDtoFromJson(
        Map<String, dynamic> json) =>
    WarrantNameRequestDto(
      conType: json['con_type'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WarrantNameRequestDtoToJson(
        WarrantNameRequestDto instance) =>
    <String, dynamic>{
      'con_type': instance.conType,
      'fname': instance.fname,
      'lname': instance.lname,
      'lat': instance.lat,
      'lon': instance.lon,
    };
