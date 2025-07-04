// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idc_bp1_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdcBp1ResponseDto _$IdcBp1ResponseDtoFromJson(Map<String, dynamic> json) =>
    IdcBp1ResponseDto(
      listIdcBp1Dto: json['list_idc_bp1'] == null
          ? null
          : ListIdcBp1Dto.fromJson(
              json['list_idc_bp1'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$IdcBp1ResponseDtoToJson(IdcBp1ResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_idc_bp1': instance.listIdcBp1Dto,
    };
