// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonResponseDto _$PersonResponseDtoFromJson(Map<String, dynamic> json) =>
    PersonResponseDto(
      listPersonDto: json['list_person'] == null
          ? null
          : ListPersonDto.fromJson(json['list_person'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonResponseDtoToJson(PersonResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_person': instance.listPersonDto,
    };
