// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      image: json['image'] as String?,
      mineType: json['mineType'] as String?,
    );

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) => <String, dynamic>{
      'image': instance.image,
      'mineType': instance.mineType,
    };

ListImageDto _$ListImageDtoFromJson(Map<String, dynamic> json) => ListImageDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListImageDtoToJson(ListImageDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
