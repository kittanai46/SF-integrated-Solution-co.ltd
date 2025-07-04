// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameRequestDto _$NameRequestDtoFromJson(Map<String, dynamic> json) =>
    NameRequestDto(
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NameRequestDtoToJson(NameRequestDto instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'lat': instance.lat,
      'lon': instance.lon,
    };
