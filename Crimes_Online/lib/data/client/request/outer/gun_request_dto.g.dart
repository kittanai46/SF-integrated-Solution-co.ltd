// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gun_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GunRequestDto _$GunRequestDtoFromJson(Map<String, dynamic> json) =>
    GunRequestDto(
      gunReg: json['gunReg'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GunRequestDtoToJson(GunRequestDto instance) =>
    <String, dynamic>{
      'gunReg': instance.gunReg,
      'lat': instance.lat,
      'lon': instance.lon,
    };
