// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseDto _$CommonResponseDtoFromJson(Map<String, dynamic> json) =>
    CommonResponseDto(
      data: json['data'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CommonResponseDtoToJson(CommonResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
