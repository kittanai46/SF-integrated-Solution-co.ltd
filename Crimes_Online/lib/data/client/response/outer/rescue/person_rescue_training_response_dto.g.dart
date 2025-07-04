// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_rescue_training_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonRtResponseDto _$PersonRtResponseDtoFromJson(Map<String, dynamic> json) =>
    PersonRtResponseDto(
      listPersonRtDto: json['list_person_rt'] == null
          ? null
          : ListPersonRtDto.fromJson(
              json['list_person_rt'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonRtResponseDtoToJson(
        PersonRtResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_person_rt': instance.listPersonRtDto,
    };
