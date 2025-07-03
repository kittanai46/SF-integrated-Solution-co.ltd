// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_resident_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberResidentResponseDto _$NumberResidentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    NumberResidentResponseDto(
      listNumberResidentDto: json['list_number_resident'] == null
          ? null
          : ListNumberResidentDto.fromJson(
              json['list_number_resident'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$NumberResidentResponseDtoToJson(
        NumberResidentResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_number_resident': instance.listNumberResidentDto,
    };
