// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb1_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pb1RequestDto _$Pb1RequestDtoFromJson(Map<String, dynamic> json) =>
    Pb1RequestDto(
      pb1: json['pb1'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Pb1RequestDtoToJson(Pb1RequestDto instance) =>
    <String, dynamic>{
      'pb1': instance.pb1,
      'lat': instance.lat,
      'lon': instance.lon,
    };
