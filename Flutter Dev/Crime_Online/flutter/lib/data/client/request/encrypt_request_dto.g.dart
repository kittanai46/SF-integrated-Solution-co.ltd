// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypt_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptRequestDto _$EncryptRequestDtoFromJson(Map<String, dynamic> json) =>
    EncryptRequestDto(
      data: json['data'] as String,
      nonce: json['nonce'] as String,
    );

Map<String, dynamic> _$EncryptRequestDtoToJson(EncryptRequestDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'nonce': instance.nonce,
    };
