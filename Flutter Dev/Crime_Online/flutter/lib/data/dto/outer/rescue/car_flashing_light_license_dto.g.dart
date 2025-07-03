// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_flashing_light_license_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarFllDto _$CarFllDtoFromJson(Map<String, dynamic> json) => CarFllDto(
      org_name: json['org_name'] as String?,
      org_no: json['org_no'] as String?,
      org_road: json['org_road'] as String?,
      org_tambon: json['org_tambon'] as String?,
      org_amphur: json['org_amphur'] as String?,
      org_province: json['org_province'] as String?,
      car_type: json['car_type'] as String?,
      car_plate: json['car_plate'] as String?,
      car_brand: json['car_brand'] as String?,
      car_model: json['car_model'] as String?,
      car_color: json['car_color'] as String?,
      car_body: json['car_body'] as String?,
      use_in_business: json['use_in_business'] as String?,
      permitted_light_colors: json['permitted_light_colors'] as String?,
      issue_date: json['issue_date'] as String?,
      expire_date: json['expire_date'] as String?,
      isexpire: json['isexpire'] as String?,
    );

Map<String, dynamic> _$CarFllDtoToJson(CarFllDto instance) => <String, dynamic>{
      'org_name': instance.org_name,
      'org_no': instance.org_no,
      'org_road': instance.org_road,
      'org_tambon': instance.org_tambon,
      'org_amphur': instance.org_amphur,
      'org_province': instance.org_province,
      'car_type': instance.car_type,
      'car_plate': instance.car_plate,
      'car_brand': instance.car_brand,
      'car_model': instance.car_model,
      'car_color': instance.car_color,
      'car_body': instance.car_body,
      'use_in_business': instance.use_in_business,
      'permitted_light_colors': instance.permitted_light_colors,
      'issue_date': instance.issue_date,
      'expire_date': instance.expire_date,
      'isexpire': instance.isexpire,
    };

ListCarFllDto _$ListCarFllDtoFromJson(Map<String, dynamic> json) =>
    ListCarFllDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CarFllDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCarFllDtoToJson(ListCarFllDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
