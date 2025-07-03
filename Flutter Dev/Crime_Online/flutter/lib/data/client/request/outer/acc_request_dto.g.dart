// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acc_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccRequestDto _$AccRequestDtoFromJson(Map<String, dynamic> json) =>
    AccRequestDto(
      accno: json['accno'] as String?,
      accbranch: json['accbranch'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccRequestDtoToJson(AccRequestDto instance) =>
    <String, dynamic>{
      'accno': instance.accno,
      'accbranch': instance.accbranch,
      'lat': instance.lat,
      'lon': instance.lon,
    };
