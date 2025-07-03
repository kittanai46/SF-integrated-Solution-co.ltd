// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalResponseDto _$HospitalResponseDtoFromJson(Map<String, dynamic> json) =>
    HospitalResponseDto(
      listHospitalDto: json['list_hospital'] == null
          ? null
          : ListHospitalDto.fromJson(
              json['list_hospital'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HospitalResponseDtoToJson(
        HospitalResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_hospital': instance.listHospitalDto,
    };
