// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hid_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HidRequestDto _$HidRequestDtoFromJson(Map<String, dynamic> json) =>
    HidRequestDto(
      hid: json['hid'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HidRequestDtoToJson(HidRequestDto instance) =>
    <String, dynamic>{
      'hid': instance.hid,
      'lat': instance.lat,
      'lon': instance.lon,
    };
