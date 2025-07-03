// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crimecase_vehicle_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCrimeCaseVehicleResponseDto _$GetCrimeCaseVehicleResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetCrimeCaseVehicleResponseDto(
      listCrimeCaseVehicle: json['list_crimecase_vehicle'] == null
          ? null
          : ListCrimeCaseVehicleDto.fromJson(
              json['list_crimecase_vehicle'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetCrimeCaseVehicleResponseDtoToJson(
        GetCrimeCaseVehicleResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_crimecase_vehicle': instance.listCrimeCaseVehicle,
    };
