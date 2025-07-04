// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thaid_regis_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThaIDRegisRequestDto _$ThaIDRegisRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ThaIDRegisRequestDto(
      deviceUDID: json['device_udid'] as String?,
      deviceName: json['device_name'] as String?,
      brand: json['brand'] as String?,
      pushToken: json['push_token'] as String?,
      osName: json['os_name'] as String?,
      osVersion: json['os_version'] as String?,
      buildNumber: json['build_number'] as String?,
      manufacturer: json['manufacturer'] as String?,
      model: json['model'] as String?,
      clientPublicKey: json['client_public_key'] as String?,
      hasFingerPrint: json['has_fingerprint'] as String?,
      thaidState: json['thaid_state'] as String?,
      thaidCode: json['thaid_code'] as String?,
    );

Map<String, dynamic> _$ThaIDRegisRequestDtoToJson(
        ThaIDRegisRequestDto instance) =>
    <String, dynamic>{
      'device_udid': instance.deviceUDID,
      'device_name': instance.deviceName,
      'brand': instance.brand,
      'push_token': instance.pushToken,
      'os_name': instance.osName,
      'os_version': instance.osVersion,
      'build_number': instance.buildNumber,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'client_public_key': instance.clientPublicKey,
      'has_fingerprint': instance.hasFingerPrint,
      'thaid_state': instance.thaidState,
      'thaid_code': instance.thaidCode,
    };
