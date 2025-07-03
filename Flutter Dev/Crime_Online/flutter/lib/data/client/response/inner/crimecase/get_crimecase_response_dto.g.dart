// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crimecase_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCrimeCaseResponseDto _$GetCrimeCaseResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetCrimeCaseResponseDto(
      listCrimeCase: json['list_crimecase'] == null
          ? null
          : ListCrimeCaseDto.fromJson(
              json['list_crimecase'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetCrimeCaseResponseDtoToJson(
        GetCrimeCaseResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_crimecase': instance.listCrimeCase,
    };
