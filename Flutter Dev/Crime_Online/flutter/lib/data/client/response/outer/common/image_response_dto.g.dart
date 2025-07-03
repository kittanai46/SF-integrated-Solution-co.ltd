// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponseDto _$ImageResponseDtoFromJson(Map<String, dynamic> json) =>
    ImageResponseDto(
      listImageDto: json['list_image'] == null
          ? null
          : ListImageDto.fromJson(json['list_image'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ImageResponseDtoToJson(ImageResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_image': instance.listImageDto,
    };
