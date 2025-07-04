// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notify_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotifyResponseDto _$GetNotifyResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetNotifyResponseDto(
      listNotifyDto: json['list_notify'] == null
          ? null
          : ListNotifyDto.fromJson(json['list_notify'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetNotifyResponseDtoToJson(
        GetNotifyResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_notify': instance.listNotifyDto,
    };
