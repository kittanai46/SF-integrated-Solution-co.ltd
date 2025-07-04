// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypt_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptResponseDto _$EncryptResponseDtoFromJson(Map<String, dynamic> json) =>
    EncryptResponseDto(
      data: json['data'] as String,
      nonce: json['nonce'] as String,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EncryptResponseDtoToJson(EncryptResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'nonce': instance.nonce,
    };
