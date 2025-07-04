// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_rescue_volunteer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonRvDto _$PersonRvDtoFromJson(Map<String, dynamic> json) => PersonRvDto(
      org_name: json['org_name'] as String?,
      pid: json['pid'] as String?,
      fullname: json['fullname'] as String?,
      issue_date: json['issue_date'] as String?,
      expire_date: json['expire_date'] as String?,
      isexpire: json['isexpire'] as String?,
    );

Map<String, dynamic> _$PersonRvDtoToJson(PersonRvDto instance) =>
    <String, dynamic>{
      'org_name': instance.org_name,
      'pid': instance.pid,
      'fullname': instance.fullname,
      'issue_date': instance.issue_date,
      'expire_date': instance.expire_date,
      'isexpire': instance.isexpire,
    };

ListPersonRvDto _$ListPersonRvDtoFromJson(Map<String, dynamic> json) =>
    ListPersonRvDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PersonRvDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPersonRvDtoToJson(ListPersonRvDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
