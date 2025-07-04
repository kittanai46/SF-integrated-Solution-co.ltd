// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policestation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliceStationDto _$PoliceStationDtoFromJson(Map<String, dynamic> json) =>
    PoliceStationDto(
      org_name: json['org_name'] as String?,
      org_code: json['org_code'] as String?,
    );

Map<String, dynamic> _$PoliceStationDtoToJson(PoliceStationDto instance) =>
    <String, dynamic>{
      'org_name': instance.org_name,
      'org_code': instance.org_code,
    };

ListPoliceStationDto _$ListPoliceStationDtoFromJson(
        Map<String, dynamic> json) =>
    ListPoliceStationDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PoliceStationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPoliceStationDtoToJson(
        ListPoliceStationDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
