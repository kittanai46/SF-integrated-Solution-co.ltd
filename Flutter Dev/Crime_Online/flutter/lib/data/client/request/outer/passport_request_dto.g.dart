// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passport_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassportRequestDto _$PassportRequestDtoFromJson(Map<String, dynamic> json) =>
    PassportRequestDto(
      passportNo: json['passportno'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PassportRequestDtoToJson(PassportRequestDto instance) =>
    <String, dynamic>{
      'passportno': instance.passportNo,
      'lat': instance.lat,
      'lon': instance.lon,
    };
