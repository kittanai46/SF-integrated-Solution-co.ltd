// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceRequestDto _$FaceRequestDtoFromJson(Map<String, dynamic> json) =>
    FaceRequestDto(
      face_image: json['face_image'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FaceRequestDtoToJson(FaceRequestDto instance) =>
    <String, dynamic>{
      'face_image': instance.face_image,
      'lat': instance.lat,
      'lon': instance.lon,
    };
