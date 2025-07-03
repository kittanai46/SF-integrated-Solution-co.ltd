// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_name_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeNameDto _$ChangeNameDtoFromJson(Map<String, dynamic> json) =>
    ChangeNameDto(
      nameChangeTypeID: json['NameChangeTypeID'] as String?,
      nameChangeType: json['NameChangeType'] as String?,
      nameChangeDate: json['NameChangeDate'] as String?,
      oldName: json['OldName'] as String?,
      newName: json['NewName'] as String?,
      lacationChange: json['LacationChange'] as String?,
    );

Map<String, dynamic> _$ChangeNameDtoToJson(ChangeNameDto instance) =>
    <String, dynamic>{
      'NameChangeTypeID': instance.nameChangeTypeID,
      'NameChangeType': instance.nameChangeType,
      'NameChangeDate': instance.nameChangeDate,
      'OldName': instance.oldName,
      'NewName': instance.newName,
      'LacationChange': instance.lacationChange,
    };

ListChangeNameDto _$ListChangeNameDtoFromJson(Map<String, dynamic> json) =>
    ListChangeNameDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChangeNameDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListChangeNameDtoToJson(ListChangeNameDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
