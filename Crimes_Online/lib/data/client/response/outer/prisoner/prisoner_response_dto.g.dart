// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prisoner_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrisonerResponseDto _$PrisonerResponseDtoFromJson(Map<String, dynamic> json) =>
    PrisonerResponseDto(
      listPrisonerDto: json['list_Prisoner'] == null
          ? null
          : ListPrisonerDto.fromJson(
              json['list_Prisoner'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PrisonerResponseDtoToJson(
        PrisonerResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_Prisoner': instance.listPrisonerDto,
    };
