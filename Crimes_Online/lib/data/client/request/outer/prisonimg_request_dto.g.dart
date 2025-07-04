// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prisonimg_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrisonImgRequestDto _$PrisonImgRequestDtoFromJson(Map<String, dynamic> json) =>
    PrisonImgRequestDto(
      imgUrl: json['img_url'] as String?,
      imgNo: json['img_no'] as String?,
      prisonerId: json['prisoner_id'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PrisonImgRequestDtoToJson(
        PrisonImgRequestDto instance) =>
    <String, dynamic>{
      'img_url': instance.imgUrl,
      'img_no': instance.imgNo,
      'prisoner_id': instance.prisonerId,
      'lat': instance.lat,
      'lon': instance.lon,
    };
