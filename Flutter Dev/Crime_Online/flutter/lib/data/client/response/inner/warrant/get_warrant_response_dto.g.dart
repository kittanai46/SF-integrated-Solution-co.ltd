// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_warrant_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWarrantResponseDto _$GetWarrantResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetWarrantResponseDto(
      listWarrant: json['list_warrant'] == null
          ? null
          : ListWarrantDto.fromJson(
              json['list_warrant'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetWarrantResponseDtoToJson(
        GetWarrantResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_warrant': instance.listWarrant,
    };
