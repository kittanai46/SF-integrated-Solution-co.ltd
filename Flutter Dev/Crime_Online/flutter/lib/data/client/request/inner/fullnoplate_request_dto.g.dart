// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullnoplate_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullNoPlateRequestDto _$FullNoPlateRequestDtoFromJson(
        Map<String, dynamic> json) =>
    FullNoPlateRequestDto(
      province: json['province'] as String?,
      intitialNo: json['intitialno'] as String?,
      number: json['number'] as String?,
      status: json['status'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FullNoPlateRequestDtoToJson(
        FullNoPlateRequestDto instance) =>
    <String, dynamic>{
      'province': instance.province,
      'intitialno': instance.intitialNo,
      'number': instance.number,
      'status': instance.status,
      'lat': instance.lat,
      'lon': instance.lon,
    };
