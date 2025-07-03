// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDto _$HealthDtoFromJson(Map<String, dynamic> json) => HealthDto(
      healthFirst: json['HealthFirst'] as String?,
      hospitalFirst: json['HospitalFirst'] as String?,
      sDateFirst: json['SDateFirst'] as String?,
      eDateFirst: json['EDateFirst'] as String?,
      healthSecond: json['HealthSecond'] as String?,
      hospitalSecond: json['HospitalSecond'] as String?,
    );

Map<String, dynamic> _$HealthDtoToJson(HealthDto instance) => <String, dynamic>{
      'HealthFirst': instance.healthFirst,
      'HospitalFirst': instance.hospitalFirst,
      'SDateFirst': instance.sDateFirst,
      'EDateFirst': instance.eDateFirst,
      'HealthSecond': instance.healthSecond,
      'HospitalSecond': instance.hospitalSecond,
    };

ListHealthDto _$ListHealthDtoFromJson(Map<String, dynamic> json) =>
    ListHealthDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HealthDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHealthDtoToJson(ListHealthDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
