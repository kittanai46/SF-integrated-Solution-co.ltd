// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceResponseDto _$FaceResponseDtoFromJson(Map<String, dynamic> json) =>
    FaceResponseDto(
      listFaceDto: json['list_face'] == null
          ? null
          : ListFaceDto.fromJson(json['list_face'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$FaceResponseDtoToJson(FaceResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_face': instance.listFaceDto,
    };
