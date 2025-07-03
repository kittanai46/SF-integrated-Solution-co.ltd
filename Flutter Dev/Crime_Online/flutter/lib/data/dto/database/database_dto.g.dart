// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseDto _$DatabaseDtoFromJson(Map<String, dynamic> json) => DatabaseDto(
      title: json['title'] as String?,
      checked: json['checked'] as bool?,
      category: json['category'] as String?,
      enable: json['enable'] as bool? ?? false,
      hintKeyword: json['hintKeyword'] as String? ?? "โปรดระบุ",
    );

Map<String, dynamic> _$DatabaseDtoToJson(DatabaseDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'checked': instance.checked,
      'category': instance.category,
      'enable': instance.enable,
      'hintKeyword': instance.hintKeyword,
    };
