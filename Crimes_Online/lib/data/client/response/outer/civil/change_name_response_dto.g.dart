// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_name_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeNameResponseDto _$ChangeNameResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ChangeNameResponseDto(
      listChangeNameDto: json['list_change_name'] == null
          ? null
          : ListChangeNameDto.fromJson(
              json['list_change_name'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeNameResponseDtoToJson(
        ChangeNameResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_change_name': instance.listChangeNameDto,
    };
