// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trafficcase_vehicle_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTrafficCaseVehicleResponseDto _$GetTrafficCaseVehicleResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetTrafficCaseVehicleResponseDto(
      listTrafficCaseVehicle: json['list_trafficcase_vehicle'] == null
          ? null
          : ListTrafficCaseVehicleDto.fromJson(
              json['list_trafficcase_vehicle'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetTrafficCaseVehicleResponseDtoToJson(
        GetTrafficCaseVehicleResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_trafficcase_vehicle': instance.listTrafficCaseVehicle,
    };
