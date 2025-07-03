// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rednotice_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRedNoticeResponseDto _$GetRedNoticeResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetRedNoticeResponseDto(
      listWarrant: json['list_warrant'] == null
          ? null
          : ListRedNoticeDto.fromJson(
              json['list_warrant'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetRedNoticeResponseDtoToJson(
        GetRedNoticeResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_warrant': instance.listWarrant,
    };
