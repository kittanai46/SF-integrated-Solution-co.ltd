// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_activate_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckActivateResponseDto _$CheckActivateResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CheckActivateResponseDto(
      state: json['state'] as int?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CheckActivateResponseDtoToJson(
        CheckActivateResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'state': instance.state,
    };
