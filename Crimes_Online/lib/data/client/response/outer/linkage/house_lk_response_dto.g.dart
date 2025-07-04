// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_lk_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseLkResponseDto _$HouseLkResponseDtoFromJson(Map<String, dynamic> json) =>
    HouseLkResponseDto(
      listHouseLkDto: json['list_house_lk'] == null
          ? null
          : ListHouseLkDto.fromJson(
              json['list_house_lk'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HouseLkResponseDtoToJson(HouseLkResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_house_lk': instance.listHouseLkDto,
    };
