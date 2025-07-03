import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable()
class NewsDto {
  NewsDto({
    this.title,
    this.url,
    this.img,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDtoToJson(this);
 
  @JsonKey(name: 'title') String? title;
  @JsonKey(name: 'url') String? url;
  @JsonKey(name: 'img') String? img;

  Uint8List get imgByte => img!=null ? base64Decode(img!) : Uint8List(0);
}

@JsonSerializable()
class ListNewsDto {
  ListNewsDto({
    this.status,
    this.data,
  });

  factory ListNewsDto.fromJson(Map<String, dynamic> json) => _$ListNewsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListNewsDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<NewsDto>? data;
}