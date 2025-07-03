// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseResponseDto _$HouseResponseDtoFromJson(Map<String, dynamic> json) =>
    HouseResponseDto(
      listHouseDto: json['list_house'] == null
          ? null
          : ListHouseDto.fromJson(json['list_house'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HouseResponseDtoToJson(HouseResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_house': instance.listHouseDto,
    };
