// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migwis_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MigwisResponseDto _$MigwisResponseDtoFromJson(Map<String, dynamic> json) =>
    MigwisResponseDto(
      listMigwisDto: json['list_migwis'] == null
          ? null
          : ListMigwisDto.fromJson(json['list_migwis'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MigwisResponseDtoToJson(MigwisResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_migwis': instance.listMigwisDto,
    };
