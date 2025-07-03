// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtensionResponseDto _$ExtensionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ExtensionResponseDto(
      listExtensionDto: json['list_extension'] == null
          ? null
          : ListExtensionDto.fromJson(
              json['list_extension'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ExtensionResponseDtoToJson(
        ExtensionResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_extension': instance.listExtensionDto,
    };
