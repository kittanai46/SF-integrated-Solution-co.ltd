// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_nonthai_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonNonThaiResponseDto _$PersonNonThaiResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PersonNonThaiResponseDto(
      listPersonNonThaiDto: json['list_person_nonthai'] == null
          ? null
          : ListPersonNonThaiDto.fromJson(
              json['list_person_nonthai'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonNonThaiResponseDtoToJson(
        PersonNonThaiResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_person_nonthai': instance.listPersonNonThaiDto,
    };
