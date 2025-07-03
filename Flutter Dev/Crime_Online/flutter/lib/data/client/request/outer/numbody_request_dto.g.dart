// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numbody_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumBodyRequestDto _$NumBodyRequestDtoFromJson(Map<String, dynamic> json) =>
    NumBodyRequestDto(
      numbody: json['numbody'] as String?,
      brncode: json['brncode'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NumBodyRequestDtoToJson(NumBodyRequestDto instance) =>
    <String, dynamic>{
      'numbody': instance.numbody,
      'brncode': instance.brncode,
      'lat': instance.lat,
      'lon': instance.lon,
    };
