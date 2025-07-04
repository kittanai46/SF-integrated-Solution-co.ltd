// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_warrantcourt_crd_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWarrantCourtCRDResponseDto _$GetWarrantCourtCRDResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetWarrantCourtCRDResponseDto(
      listWarrant: json['list_warrant'] == null
          ? null
          : ListWarrantCourtCRDDto.fromJson(
              json['list_warrant'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetWarrantCourtCRDResponseDtoToJson(
        GetWarrantCourtCRDResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_warrant': instance.listWarrant,
    };
