// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponseDto _$NewsResponseDtoFromJson(Map<String, dynamic> json) =>
    NewsResponseDto(
      listNewsDto: json['list_news'] == null
          ? null
          : ListNewsDto.fromJson(json['list_news'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$NewsResponseDtoToJson(NewsResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_news': instance.listNewsDto,
    };
