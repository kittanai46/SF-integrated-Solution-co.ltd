import 'package:json_annotation/json_annotation.dart';

part 'favorite_dto.g.dart';

@JsonSerializable()
class FavoriteDto {
  FavoriteDto({
    this.category,
    this.title,
    this.choices,
    this.innerDbs,
    this.outerDbs,
    this.isDefault
  });

  factory FavoriteDto.fromJson(Map<String, dynamic> json) => _$FavoriteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteDtoToJson(this);

  @JsonKey(name: 'category') String? category;
  @JsonKey(name: 'title') String? title;
  @JsonKey(name: 'list_choice') List<String>? choices;
  @JsonKey(name: 'list_inner_db') List<String>? innerDbs;
  @JsonKey(name: 'list_outer_db') List<String>? outerDbs;
  @JsonKey(name: 'is_default') String? isDefault;
}

@JsonSerializable()
class ListFavoriteDto {
  ListFavoriteDto({
    this.data,
  });

  factory ListFavoriteDto.fromJson(Map<String, dynamic> json) => _$ListFavoriteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListFavoriteDtoToJson(this);

  @JsonKey(name: 'data') List<FavoriteDto>? data;
}