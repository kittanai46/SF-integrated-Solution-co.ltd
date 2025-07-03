// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteDto _$FavoriteDtoFromJson(Map<String, dynamic> json) => FavoriteDto(
      category: json['category'] as String?,
      title: json['title'] as String?,
      choices: (json['list_choice'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      innerDbs: (json['list_inner_db'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      outerDbs: (json['list_outer_db'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isDefault: json['is_default'] as String?,
    );

Map<String, dynamic> _$FavoriteDtoToJson(FavoriteDto instance) =>
    <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'list_choice': instance.choices,
      'list_inner_db': instance.innerDbs,
      'list_outer_db': instance.outerDbs,
      'is_default': instance.isDefault,
    };

ListFavoriteDto _$ListFavoriteDtoFromJson(Map<String, dynamic> json) =>
    ListFavoriteDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FavoriteDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListFavoriteDtoToJson(ListFavoriteDto instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
