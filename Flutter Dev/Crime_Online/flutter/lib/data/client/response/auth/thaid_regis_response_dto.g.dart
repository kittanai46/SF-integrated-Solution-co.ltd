// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thaid_regis_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThaIDRegisResponseDto _$ThaIDRegisResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ThaIDRegisResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      thaidPoliceID: json['thaid_policeid'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ThaIDRegisResponseDtoToJson(
        ThaIDRegisResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'thaid_policeid': instance.thaidPoliceID,
      'key': instance.key,
    };
