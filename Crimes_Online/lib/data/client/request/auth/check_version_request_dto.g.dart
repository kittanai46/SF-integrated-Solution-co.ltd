// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_version_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckVersionRequestDto _$CheckVersionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CheckVersionRequestDto(
      version: json['version'] as String?,
      platform: json['platform'] as String?,
    );

Map<String, dynamic> _$CheckVersionRequestDtoToJson(
        CheckVersionRequestDto instance) =>
    <String, dynamic>{
      'version': instance.version,
      'platform': instance.platform,
    };
