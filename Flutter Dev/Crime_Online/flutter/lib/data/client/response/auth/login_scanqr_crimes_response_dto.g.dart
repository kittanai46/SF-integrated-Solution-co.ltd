// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_scanqr_crimes_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginScanQrCRIMESResponseDto _$LoginScanQrCRIMESResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LoginScanQrCRIMESResponseDto(
      key: json['key'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginScanQrCRIMESResponseDtoToJson(
        LoginScanQrCRIMESResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'key': instance.key,
    };
