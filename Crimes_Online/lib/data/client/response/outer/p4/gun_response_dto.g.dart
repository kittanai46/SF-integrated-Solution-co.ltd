// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gun_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GunResponseDto _$GunResponseDtoFromJson(Map<String, dynamic> json) =>
    GunResponseDto(
      listGunDto: json['list_gun'] == null
          ? null
          : ListGunDto.fromJson(json['list_gun'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GunResponseDtoToJson(GunResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_gun': instance.listGunDto,
    };
