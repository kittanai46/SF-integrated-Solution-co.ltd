// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trafficcase_person_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTrafficCasePersonResponseDto _$GetTrafficCasePersonResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetTrafficCasePersonResponseDto(
      listTrafficCasePerson: json['list_trafficcase_person'] == null
          ? null
          : ListTrafficCasePersonDto.fromJson(
              json['list_trafficcase_person'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetTrafficCasePersonResponseDtoToJson(
        GetTrafficCasePersonResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_trafficcase_person': instance.listTrafficCasePerson,
    };
