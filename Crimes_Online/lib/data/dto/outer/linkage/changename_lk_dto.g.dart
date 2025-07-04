// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changename_lk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeNameLkDto _$ChangeNameLkDtoFromJson(Map<String, dynamic> json) =>
    ChangeNameLkDto(
      fDateOfChange: json['firstName.dateOfChange'] as String?,
      fNewValue: json['firstName.newValue'] as String?,
      fOldValue: json['firstName.oldValue'] as String?,
      fRcodeCode: json['firstName.rcodeCode'] as String?,
      fRcodeDesc: json['firstName.rcodeDesc'] as String?,
      lDateOfChange: json['lastName.dateOfChange'] as String?,
      lNewValue: json['lastName.newValue'] as String?,
      lOldValue: json['lastName.oldValue'] as String?,
      lRcodeCode: json['lastName.rcodeCode'] as String?,
      lRcodeDesc: json['lastName.rcodeDesc'] as String?,
    );

Map<String, dynamic> _$ChangeNameLkDtoToJson(ChangeNameLkDto instance) =>
    <String, dynamic>{
      'firstName.dateOfChange': instance.fDateOfChange,
      'firstName.newValue': instance.fNewValue,
      'firstName.oldValue': instance.fOldValue,
      'firstName.rcodeCode': instance.fRcodeCode,
      'firstName.rcodeDesc': instance.fRcodeDesc,
      'lastName.dateOfChange': instance.lDateOfChange,
      'lastName.newValue': instance.lNewValue,
      'lastName.oldValue': instance.lOldValue,
      'lastName.rcodeCode': instance.lRcodeCode,
      'lastName.rcodeDesc': instance.lRcodeDesc,
    };

ListChangeNameLkDto _$ListChangeNameLkDtoFromJson(Map<String, dynamic> json) =>
    ListChangeNameLkDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChangeNameLkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListChangeNameLkDtoToJson(
        ListChangeNameLkDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
