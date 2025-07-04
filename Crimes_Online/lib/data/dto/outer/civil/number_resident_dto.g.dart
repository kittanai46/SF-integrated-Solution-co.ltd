// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_resident_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberResidentDto _$NumberResidentDtoFromJson(Map<String, dynamic> json) =>
    NumberResidentDto(
      status: json['Status'] as String?,
      count: json['Count'] as String?,
    );

Map<String, dynamic> _$NumberResidentDtoToJson(NumberResidentDto instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Count': instance.count,
    };

ListNumberResidentDto _$ListNumberResidentDtoFromJson(
        Map<String, dynamic> json) =>
    ListNumberResidentDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NumberResidentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNumberResidentDtoToJson(
        ListNumberResidentDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
