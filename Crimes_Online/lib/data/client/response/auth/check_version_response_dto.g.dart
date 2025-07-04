// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_version_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckVersionResponseDto _$CheckVersionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CheckVersionResponseDto(
      result: json['result'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..appStoreId = json['app_store_id'] as String?;

Map<String, dynamic> _$CheckVersionResponseDtoToJson(
        CheckVersionResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
      'app_store_id': instance.appStoreId,
    };
