// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_rescue_training_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonRtDto _$PersonRtDtoFromJson(Map<String, dynamic> json) => PersonRtDto(
      course_name: json['course_name'] as String?,
      training_site: json['training_site'] as String?,
      training_results: json['training_results'] as String?,
      pid: json['pid'] as String?,
      fullname: json['fullname'] as String?,
      training_date: json['training_date'] as String?,
      expire_date: json['expire_date'] as String?,
      isexpire: json['isexpire'] as String?,
    );

Map<String, dynamic> _$PersonRtDtoToJson(PersonRtDto instance) =>
    <String, dynamic>{
      'course_name': instance.course_name,
      'training_site': instance.training_site,
      'training_results': instance.training_results,
      'pid': instance.pid,
      'fullname': instance.fullname,
      'training_date': instance.training_date,
      'expire_date': instance.expire_date,
      'isexpire': instance.isexpire,
    };

ListPersonRtDto _$ListPersonRtDtoFromJson(Map<String, dynamic> json) =>
    ListPersonRtDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PersonRtDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPersonRtDtoToJson(ListPersonRtDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
