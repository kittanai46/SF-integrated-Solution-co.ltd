// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authsoc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSocDto _$AuthSocDtoFromJson(Map<String, dynamic> json) => AuthSocDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AuthSocDtoToJson(AuthSocDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'url': instance.url,
    };
