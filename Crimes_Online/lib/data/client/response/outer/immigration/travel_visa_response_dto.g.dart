// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_visa_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelVisaResponseDto _$TravelVisaResponseDtoFromJson(
        Map<String, dynamic> json) =>
    TravelVisaResponseDto(
      listTravelVisaDto: json['list_travel_visa'] == null
          ? null
          : ListTravelVisaDto.fromJson(
              json['list_travel_visa'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TravelVisaResponseDtoToJson(
        TravelVisaResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_travel_visa': instance.listTravelVisaDto,
    };
