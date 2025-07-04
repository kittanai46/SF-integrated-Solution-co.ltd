// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alienno_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlienNoRequestDto _$AlienNoRequestDtoFromJson(Map<String, dynamic> json) =>
    AlienNoRequestDto(
      alien_no: json['alien_no'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AlienNoRequestDtoToJson(AlienNoRequestDto instance) =>
    <String, dynamic>{
      'alien_no': instance.alien_no,
      'lat': instance.lat,
      'lon': instance.lon,
    };
