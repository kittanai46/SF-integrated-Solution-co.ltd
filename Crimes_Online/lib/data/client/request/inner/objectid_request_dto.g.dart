// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectid_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectIdRequestDto _$ObjectIdRequestDtoFromJson(Map<String, dynamic> json) =>
    ObjectIdRequestDto(
      objectId: json['object_id'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ObjectIdRequestDtoToJson(ObjectIdRequestDto instance) =>
    <String, dynamic>{
      'object_id': instance.objectId,
      'lat': instance.lat,
      'lon': instance.lon,
    };
