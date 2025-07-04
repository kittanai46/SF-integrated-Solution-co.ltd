// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_ambulance_license_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarAmlDto _$CarAmlDtoFromJson(Map<String, dynamic> json) => CarAmlDto(
      org_name_allow: json['org_name_allow'] as String?,
      car_type: json['car_type'] as String?,
      car_plate: json['car_plate'] as String?,
      car_brand: json['car_brand'] as String?,
      car_model: json['car_model'] as String?,
      car_color: json['car_color'] as String?,
      car_body: json['car_body'] as String?,
      occ_pid: json['occ_pid'] as String?,
      occ_fullname: json['occ_fullname'] as String?,
      applicant_pid: json['applicant_pid'] as String?,
      applicant_fullname: json['applicant_fullname'] as String?,
      issue_date: json['issue_date'] as String?,
      expire_date: json['expire_date'] as String?,
      isexpire: json['isexpire'] as String?,
    );

Map<String, dynamic> _$CarAmlDtoToJson(CarAmlDto instance) => <String, dynamic>{
      'org_name_allow': instance.org_name_allow,
      'car_type': instance.car_type,
      'car_plate': instance.car_plate,
      'car_brand': instance.car_brand,
      'car_model': instance.car_model,
      'car_color': instance.car_color,
      'car_body': instance.car_body,
      'occ_pid': instance.occ_pid,
      'occ_fullname': instance.occ_fullname,
      'applicant_pid': instance.applicant_pid,
      'applicant_fullname': instance.applicant_fullname,
      'issue_date': instance.issue_date,
      'expire_date': instance.expire_date,
      'isexpire': instance.isexpire,
    };

ListCarAmlDto _$ListCarAmlDtoFromJson(Map<String, dynamic> json) =>
    ListCarAmlDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CarAmlDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCarAmlDtoToJson(ListCarAmlDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
