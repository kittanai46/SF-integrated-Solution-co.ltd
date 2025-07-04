// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trafficcase_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTrafficCaseResponseDto _$GetTrafficCaseResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetTrafficCaseResponseDto(
      listTrafficCase: json['list_trafficcase'] == null
          ? null
          : ListTrafficCaseDto.fromJson(
              json['list_trafficcase'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetTrafficCaseResponseDtoToJson(
        GetTrafficCaseResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_trafficcase': instance.listTrafficCase,
    };
