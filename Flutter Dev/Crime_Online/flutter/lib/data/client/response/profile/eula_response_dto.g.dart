// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eula_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EulaResponseDto _$EulaResponseDtoFromJson(Map<String, dynamic> json) =>
    EulaResponseDto(
      listEulaDto: json['list_eula'] == null
          ? null
          : ListEulaDto.fromJson(json['list_eula'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EulaResponseDtoToJson(EulaResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_eula': instance.listEulaDto,
    };
