// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changename_lk_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeNameLkResponseDto _$ChangeNameLkResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ChangeNameLkResponseDto(
      listChangeNameLkDto: json['list_changename_lk'] == null
          ? null
          : ListChangeNameLkDto.fromJson(
              json['list_changename_lk'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeNameLkResponseDtoToJson(
        ChangeNameLkResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_changename_lk': instance.listChangeNameLkDto,
    };
