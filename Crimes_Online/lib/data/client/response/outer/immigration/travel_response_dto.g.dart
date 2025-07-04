// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelResponseDto _$TravelResponseDtoFromJson(Map<String, dynamic> json) =>
    TravelResponseDto(
      listTravelDto: json['list_travel'] == null
          ? null
          : ListTravelDto.fromJson(json['list_travel'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TravelResponseDtoToJson(TravelResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_travel': instance.listTravelDto,
    };
