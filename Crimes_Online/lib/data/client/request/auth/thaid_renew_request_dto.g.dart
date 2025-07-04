// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thaid_renew_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThaIDRenewRequestDto _$ThaIDRenewRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ThaIDRenewRequestDto(
      pid: json['pid'] as String?,
      thaidState: json['thaid_state'] as String?,
      thaidCode: json['thaid_code'] as String?,
    );

Map<String, dynamic> _$ThaIDRenewRequestDtoToJson(
        ThaIDRenewRequestDto instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'thaid_state': instance.thaidState,
      'thaid_code': instance.thaidCode,
    };
