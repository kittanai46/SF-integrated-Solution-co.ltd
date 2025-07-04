// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentResponseDto _$EmploymentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    EmploymentResponseDto(
      listEmploymentDto: json['list_employment'] == null
          ? null
          : ListEmploymentDto.fromJson(
              json['list_employment'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EmploymentResponseDtoToJson(
        EmploymentResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_employment': instance.listEmploymentDto,
    };
