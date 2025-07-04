import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/profile/news_dto.dart';

part 'news_response_dto.g.dart';

@JsonSerializable()
class NewsResponseDto with ApiStatusResponse{
  NewsResponseDto({
    this.listNewsDto,
  });

  factory NewsResponseDto.fromJson(Map<String, dynamic> json) => _$NewsResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseDtoToJson(this);

  @JsonKey(name: 'list_news') ListNewsDto? listNewsDto;

}