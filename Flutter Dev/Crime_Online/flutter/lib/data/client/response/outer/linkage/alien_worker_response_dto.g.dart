// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alien_worker_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlienWorkerResponseDto _$AlienWorkerResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AlienWorkerResponseDto(
      listAlienWorkerDto: json['list_alien_worker'] == null
          ? null
          : ListAlienWorkerDto.fromJson(
              json['list_alien_worker'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AlienWorkerResponseDtoToJson(
        AlienWorkerResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_alien_worker': instance.listAlienWorkerDto,
    };
