// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crimecase_person_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCrimeCasePersonResponseDto _$GetCrimeCasePersonResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetCrimeCasePersonResponseDto(
      listCrimeCasePerson: json['list_crimecase_person'] == null
          ? null
          : ListCrimeCasePersonDto.fromJson(
              json['list_crimecase_person'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetCrimeCasePersonResponseDtoToJson(
        GetCrimeCasePersonResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_crimecase_person': instance.listCrimeCasePerson,
    };
