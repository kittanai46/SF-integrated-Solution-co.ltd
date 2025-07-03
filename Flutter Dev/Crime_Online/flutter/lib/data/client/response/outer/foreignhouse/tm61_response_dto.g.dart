// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tm61_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tm61ResponseDto _$Tm61ResponseDtoFromJson(Map<String, dynamic> json) =>
    Tm61ResponseDto(
      listTm61Dto: json['list_tm61'] == null
          ? null
          : ListTm61Dto.fromJson(json['list_tm61'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$Tm61ResponseDtoToJson(Tm61ResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_tm61': instance.listTm61Dto,
    };
