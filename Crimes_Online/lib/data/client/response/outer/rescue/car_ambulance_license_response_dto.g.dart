// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_ambulance_license_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarAmlResponseDto _$CarAmlResponseDtoFromJson(Map<String, dynamic> json) =>
    CarAmlResponseDto(
      listCarAmlDto: json['list_car_aml'] == null
          ? null
          : ListCarAmlDto.fromJson(
              json['list_car_aml'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CarAmlResponseDtoToJson(CarAmlResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_car_aml': instance.listCarAmlDto,
    };
