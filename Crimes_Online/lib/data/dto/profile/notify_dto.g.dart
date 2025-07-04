// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyDto _$NotifyDtoFromJson(Map<String, dynamic> json) => NotifyDto(
      title: json['title'] as String?,
      content: json['content'] as String?,
      readFlag: json['read_flag'] as String?,
      readDate: json['read_date'] as String?,
      newFlag: json['new_flag'] as String?,
      createdDate: json['created_date'] as String?,
      createdDateSort: json['created_date_sort'] as String?,
      notifyId: json['notify_id'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NotifyDtoToJson(NotifyDto instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'read_flag': instance.readFlag,
      'read_date': instance.readDate,
      'new_flag': instance.newFlag,
      'created_date': instance.createdDate,
      'created_date_sort': instance.createdDateSort,
      'notify_id': instance.notifyId,
      'type': instance.type,
      'url': instance.url,
    };

ListNotifyDto _$ListNotifyDtoFromJson(Map<String, dynamic> json) =>
    ListNotifyDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotifyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNotifyDtoToJson(ListNotifyDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
