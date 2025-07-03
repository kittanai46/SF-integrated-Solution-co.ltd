// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_warrant_crd_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWarrantCRDResponseDto _$GetWarrantCRDResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetWarrantCRDResponseDto(
      listWarrant: json['list_warrant'] == null
          ? null
          : ListWarrantCRDDto.fromJson(
              json['list_warrant'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetWarrantCRDResponseDtoToJson(
        GetWarrantCRDResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_warrant': instance.listWarrant,
    };
