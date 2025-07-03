// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_lk_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonLkResponseDto _$PersonLkResponseDtoFromJson(Map<String, dynamic> json) =>
    PersonLkResponseDto(
      listPersonLkDto: json['list_person_lk'] == null
          ? null
          : ListPersonLkDto.fromJson(
              json['list_person_lk'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonLkResponseDtoToJson(
        PersonLkResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_person_lk': instance.listPersonLkDto,
    };
