// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pop_house_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopHouseResponseDto _$PopHouseResponseDtoFromJson(Map<String, dynamic> json) =>
    PopHouseResponseDto(
      listPopHouseDto: json['list_pop_house'] == null
          ? null
          : ListPopHouseDto.fromJson(
              json['list_pop_house'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PopHouseResponseDtoToJson(
        PopHouseResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_pop_house': instance.listPopHouseDto,
    };
