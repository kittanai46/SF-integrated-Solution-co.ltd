// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employer_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployerResponseDto _$EmployerResponseDtoFromJson(Map<String, dynamic> json) =>
    EmployerResponseDto(
      listEmployerDto: json['list_employer'] == null
          ? null
          : ListEmployerDto.fromJson(
              json['list_employer'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EmployerResponseDtoToJson(
        EmployerResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_employer': instance.listEmployerDto,
    };
