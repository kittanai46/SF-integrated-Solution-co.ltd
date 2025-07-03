// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_warrantcourt_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWarrantCourtResponseDto _$GetWarrantCourtResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetWarrantCourtResponseDto(
      listWarrantCourt: json['list_warrant_court'] == null
          ? null
          : ListWarrantCourtDto.fromJson(
              json['list_warrant_court'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetWarrantCourtResponseDtoToJson(
        GetWarrantCourtResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_warrant_court': instance.listWarrantCourt,
    };
