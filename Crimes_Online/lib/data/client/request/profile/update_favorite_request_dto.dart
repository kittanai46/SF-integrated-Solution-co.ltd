import 'package:json_annotation/json_annotation.dart';

part 'update_favorite_request_dto.g.dart';

@JsonSerializable()
class UpdateFavoriteRequestDto {
  UpdateFavoriteRequestDto({this.favorite,});

  factory UpdateFavoriteRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateFavoriteRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateFavoriteRequestDtoToJson(this);

  @JsonKey(name: 'favorite') String? favorite;
}