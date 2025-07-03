// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alien_person_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlienPersonResponseDto _$AlienPersonResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AlienPersonResponseDto(
      listAlienPersonDto: json['list_alien_person'] == null
          ? null
          : ListAlienPersonDto.fromJson(
              json['list_alien_person'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AlienPersonResponseDtoToJson(
        AlienPersonResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_alien_person': instance.listAlienPersonDto,
    };
