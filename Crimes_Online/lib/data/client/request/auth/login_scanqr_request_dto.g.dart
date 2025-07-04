// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_scanqr_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginScanQrRequestDto _$LoginScanQrRequestDtoFromJson(
        Map<String, dynamic> json) =>
    LoginScanQrRequestDto(
      policeId: json['police_id'] as String?,
      qrcode: json['qrcode'] as String?,
      deviceUdid: json['device_udid'] as String?,
      deviceName: json['device_name'] as String?,
      brand: json['brand'] as String?,
      pushToken: json['push_token'] as String?,
      osName: json['os_name'] as String?,
      osVersion: json['os_version'] as String?,
      buildNumber: json['build_number'] as String?,
      manufacturer: json['manufacturer'] as String?,
      model: json['model'] as String?,
      publicKey: json['client_public_key'] as String?,
      hasFingerprint: json['has_fingerprint'] as String?,
    );

Map<String, dynamic> _$LoginScanQrRequestDtoToJson(
        LoginScanQrRequestDto instance) =>
    <String, dynamic>{
      'police_id': instance.policeId,
      'qrcode': instance.qrcode,
      'device_udid': instance.deviceUdid,
      'device_name': instance.deviceName,
      'brand': instance.brand,
      'push_token': instance.pushToken,
      'os_name': instance.osName,
      'os_version': instance.osVersion,
      'build_number': instance.buildNumber,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'client_public_key': instance.publicKey,
      'has_fingerprint': instance.hasFingerprint,
    };
