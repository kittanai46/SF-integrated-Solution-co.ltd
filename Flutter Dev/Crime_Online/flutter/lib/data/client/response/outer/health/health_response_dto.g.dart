// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthResponseDto _$HealthResponseDtoFromJson(Map<String, dynamic> json) =>
    HealthResponseDto(
      listHealthDto: json['list_health'] == null
          ? null
          : ListHealthDto.fromJson(json['list_health'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HealthResponseDtoToJson(HealthResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_health': instance.listHealthDto,
    };
