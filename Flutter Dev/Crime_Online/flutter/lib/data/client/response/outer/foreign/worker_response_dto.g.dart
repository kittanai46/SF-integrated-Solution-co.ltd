// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerResponseDto _$WorkerResponseDtoFromJson(Map<String, dynamic> json) =>
    WorkerResponseDto(
      listWorkerDto: json['list_worker'] == null
          ? null
          : ListWorkerDto.fromJson(json['list_worker'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$WorkerResponseDtoToJson(WorkerResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_worker': instance.listWorkerDto,
    };
