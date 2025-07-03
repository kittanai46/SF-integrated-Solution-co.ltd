// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idc_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdcResponseDto _$IdcResponseDtoFromJson(Map<String, dynamic> json) =>
    IdcResponseDto(
      listIdcDto: json['list_idc'] == null
          ? null
          : ListIdcDto.fromJson(json['list_idc'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$IdcResponseDtoToJson(IdcResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_idc': instance.listIdcDto,
    };
