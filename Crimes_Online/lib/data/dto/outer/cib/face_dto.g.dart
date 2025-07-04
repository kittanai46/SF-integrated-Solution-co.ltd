// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaceDto _$FaceDtoFromJson(Map<String, dynamic> json) => FaceDto(
      personalid: json['personalid'] as String?,
      countrycode: json['countrycode'] as String?,
      score: FaceDto._toString(json['score']),
    );

Map<String, dynamic> _$FaceDtoToJson(FaceDto instance) => <String, dynamic>{
      'personalid': instance.personalid,
      'countrycode': instance.countrycode,
      'score': instance.score,
    };

ListFaceDto _$ListFaceDtoFromJson(Map<String, dynamic> json) => ListFaceDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FaceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListFaceDtoToJson(ListFaceDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
