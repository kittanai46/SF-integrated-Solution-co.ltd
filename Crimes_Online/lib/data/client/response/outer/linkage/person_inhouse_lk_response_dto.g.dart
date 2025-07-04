// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_inhouse_lk_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInHouseLkResponseDto _$PersonInHouseLkResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PersonInHouseLkResponseDto(
      listPersonInHouseLkDto: json['list_person_inhouse_lk'] == null
          ? null
          : ListPersonInHouseLkDto.fromJson(
              json['list_person_inhouse_lk'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PersonInHouseLkResponseDtoToJson(
        PersonInHouseLkResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_person_inhouse_lk': instance.listPersonInHouseLkDto,
    };
