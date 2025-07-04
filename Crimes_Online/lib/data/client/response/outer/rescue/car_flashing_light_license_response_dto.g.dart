// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_flashing_light_license_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarFllResponseDto _$CarFllResponseDtoFromJson(Map<String, dynamic> json) =>
    CarFllResponseDto(
      listCarFllDto: json['list_car_fll'] == null
          ? null
          : ListCarFllDto.fromJson(
              json['list_car_fll'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CarFllResponseDtoToJson(CarFllResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_car_fll': instance.listCarFllDto,
    };
