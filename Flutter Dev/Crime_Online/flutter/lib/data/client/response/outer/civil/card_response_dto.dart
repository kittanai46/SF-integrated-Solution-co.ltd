import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/card_dto.dart';

part 'card_response_dto.g.dart';

@JsonSerializable()
class CardResponseDto with ApiStatusResponse{
  CardResponseDto({
    this.listCardDto,
  });

  factory CardResponseDto.fromJson(Map<String, dynamic> json) => _$CardResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CardResponseDtoToJson(this);

  @JsonKey(name: 'list_card') ListCardDto? listCardDto;

}