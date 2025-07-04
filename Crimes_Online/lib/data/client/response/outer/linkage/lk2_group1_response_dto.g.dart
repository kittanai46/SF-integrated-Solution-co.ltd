// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lk2_group1_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lk2Group1ResponseDto _$Lk2Group1ResponseDtoFromJson(
        Map<String, dynamic> json) =>
    Lk2Group1ResponseDto(
      listLk2Group1Dto: json['list_lk2_group1'] == null
          ? null
          : ListLk2Group1Dto.fromJson(
              json['list_lk2_group1'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$Lk2Group1ResponseDtoToJson(
        Lk2Group1ResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_lk2_group1': instance.listLk2Group1Dto,
    };
