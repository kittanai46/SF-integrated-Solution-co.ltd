// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eula_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EulaDto _$EulaDtoFromJson(Map<String, dynamic> json) => EulaDto(
      url: json['url'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$EulaDtoToJson(EulaDto instance) => <String, dynamic>{
      'url': instance.url,
      'version': instance.version,
    };

ListEulaDto _$ListEulaDtoFromJson(Map<String, dynamic> json) => ListEulaDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EulaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListEulaDtoToJson(ListEulaDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
