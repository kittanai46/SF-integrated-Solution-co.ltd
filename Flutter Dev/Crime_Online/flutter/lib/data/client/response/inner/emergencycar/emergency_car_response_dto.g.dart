// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_car_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmgcCarResponseDto _$EmgcCarResponseDtoFromJson(Map<String, dynamic> json) =>
    EmgcCarResponseDto(
      listEmergencyCarDto: json['list_emgc_car'] == null
          ? null
          : ListEmergencyCarDto.fromJson(
              json['list_emgc_car'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EmgcCarResponseDtoToJson(EmgcCarResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_emgc_car': instance.listEmergencyCarDto,
    };
