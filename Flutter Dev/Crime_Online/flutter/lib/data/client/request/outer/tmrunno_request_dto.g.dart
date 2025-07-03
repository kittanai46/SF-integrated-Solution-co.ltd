// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmrunno_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TmRunnoRequestDto _$TmRunnoRequestDtoFromJson(Map<String, dynamic> json) =>
    TmRunnoRequestDto(
      tmrunno: json['tmrunno'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TmRunnoRequestDtoToJson(TmRunnoRequestDto instance) =>
    <String, dynamic>{
      'tmrunno': instance.tmrunno,
      'lat': instance.lat,
      'lon': instance.lon,
    };
