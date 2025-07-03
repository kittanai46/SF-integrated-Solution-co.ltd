// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_rescue_volunteer_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonRvResponseDto _$PersonRvResponseDtoFromJson(Map<String, dynamic> json) =>
    PersonRvResponseDto(
      listPersonRvDto: json['list_person_rv'] == null
          ? null
          : ListPersonRvDto.fromJson(
              json['list_person_rv'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonRvResponseDtoToJson(
        PersonRvResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_person_rv': instance.listPersonRvDto,
    };
