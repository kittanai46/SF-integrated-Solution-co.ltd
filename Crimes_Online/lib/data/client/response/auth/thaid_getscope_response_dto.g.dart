// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thaid_getscope_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThaIDGetScopeResponseDto _$ThaIDGetScopeResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ThaIDGetScopeResponseDto(
      thaidStatus: json['status'] as String?,
      thaidMessage: json['message'] as String?,
      thaidPoliceID: json['thaid_policeid'] as String?,
    );

Map<String, dynamic> _$ThaIDGetScopeResponseDtoToJson(
        ThaIDGetScopeResponseDto instance) =>
    <String, dynamic>{
      'status': instance.thaidStatus,
      'message': instance.thaidMessage,
      'thaid_policeid': instance.thaidPoliceID,
    };
