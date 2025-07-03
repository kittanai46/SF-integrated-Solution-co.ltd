// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_noregis_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonNoRegisResponseDto _$PersonNoRegisResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PersonNoRegisResponseDto(
      listPersonNoRegisDto: json['list_person_noregis'] == null
          ? null
          : ListPersonNoRegisDto.fromJson(
              json['list_person_noregis'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonNoRegisResponseDtoToJson(
        PersonNoRegisResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_person_noregis': instance.listPersonNoRegisDto,
    };
