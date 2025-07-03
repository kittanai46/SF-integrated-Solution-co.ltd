// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_emc_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlateEmcRequestDto _$PlateEmcRequestDtoFromJson(Map<String, dynamic> json) =>
    PlateEmcRequestDto(
      intitialNo: json['intitialno'] as String?,
      number: json['number'] as String?,
      provcode: json['provcode'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlateEmcRequestDtoToJson(PlateEmcRequestDto instance) =>
    <String, dynamic>{
      'intitialno': instance.intitialNo,
      'number': instance.number,
      'provcode': instance.provcode,
      'lat': instance.lat,
      'lon': instance.lon,
    };
