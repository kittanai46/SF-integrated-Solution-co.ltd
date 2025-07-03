// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenResponseDto _$GetTokenResponseDtoFromJson(Map<String, dynamic> json) =>
    GetTokenResponseDto(
      url: json['url'] as String?,
      baseUrl: json['base_url'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetTokenResponseDtoToJson(
        GetTokenResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'url': instance.url,
      'base_url': instance.baseUrl,
    };
