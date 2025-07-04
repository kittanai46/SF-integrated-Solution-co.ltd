// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_scanqr_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginScanQrResponseDto _$LoginScanQrResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LoginScanQrResponseDto(
      key: json['key'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginScanQrResponseDtoToJson(
        LoginScanQrResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'key': instance.key,
    };
