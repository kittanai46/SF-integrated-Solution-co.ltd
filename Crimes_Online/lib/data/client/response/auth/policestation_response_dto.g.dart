// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policestation_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliceStationResponseDto _$PoliceStationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PoliceStationResponseDto(
      listPoliceStationDto: json['list_policestation'] == null
          ? null
          : ListPoliceStationDto.fromJson(
              json['list_policestation'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PoliceStationResponseDtoToJson(
        PoliceStationResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_policestation': instance.listPoliceStationDto,
    };
