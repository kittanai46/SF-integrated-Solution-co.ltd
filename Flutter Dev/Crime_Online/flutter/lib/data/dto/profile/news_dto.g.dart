// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) => NewsDto(
      title: json['title'] as String?,
      url: json['url'] as String?,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$NewsDtoToJson(NewsDto instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'img': instance.img,
    };

ListNewsDto _$ListNewsDtoFromJson(Map<String, dynamic> json) => ListNewsDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NewsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNewsDtoToJson(ListNewsDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
