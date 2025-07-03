// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_info_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVehicleInfoResponseDto _$GetVehicleInfoResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetVehicleInfoResponseDto(
      listVehicleInfo: json['list_vehicle_info'] == null
          ? null
          : ListVehicleInfoDto.fromJson(
              json['list_vehicle_info'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetVehicleInfoResponseDtoToJson(
        GetVehicleInfoResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_vehicle_info': instance.listVehicleInfo,
    };
