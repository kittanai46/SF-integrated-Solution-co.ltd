// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_plt_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamePltRequestDto _$NamePltRequestDtoFromJson(Map<String, dynamic> json) =>
    NamePltRequestDto(
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      pltcode: json['pltcode'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NamePltRequestDtoToJson(NamePltRequestDto instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'pltcode': instance.pltcode,
      'lat': instance.lat,
      'lon': instance.lon,
    };
