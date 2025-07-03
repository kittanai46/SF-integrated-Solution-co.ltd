// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasid_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasIdRequestDto _$PasIdRequestDtoFromJson(Map<String, dynamic> json) =>
    PasIdRequestDto(
      pasId: json['pasid'] as String?,
      nation: json['nation'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PasIdRequestDtoToJson(PasIdRequestDto instance) =>
    <String, dynamic>{
      'pasid': instance.pasId,
      'nation': instance.nation,
      'lat': instance.lat,
      'lon': instance.lon,
    };
