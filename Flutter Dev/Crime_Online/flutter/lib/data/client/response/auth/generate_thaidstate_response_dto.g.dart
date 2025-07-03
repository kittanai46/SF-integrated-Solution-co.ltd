// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_thaidstate_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateThaIDStateResponseDto _$GenerateThaIDStateResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GenerateThaIDStateResponseDto(
      thaidState: json['thaid_state'] as String?,
      thaidHost: json['thaid_host'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GenerateThaIDStateResponseDtoToJson(
        GenerateThaIDStateResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'thaid_state': instance.thaidState,
      'thaid_host': instance.thaidHost,
    };
