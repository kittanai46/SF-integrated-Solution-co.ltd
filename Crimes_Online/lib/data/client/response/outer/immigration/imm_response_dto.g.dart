// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imm_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImmResponseDto _$ImmResponseDtoFromJson(Map<String, dynamic> json) =>
    ImmResponseDto(
      listImmDto: json['list_imm'] == null
          ? null
          : ListImmDto.fromJson(json['list_imm'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ImmResponseDtoToJson(ImmResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_imm': instance.listImmDto,
    };
