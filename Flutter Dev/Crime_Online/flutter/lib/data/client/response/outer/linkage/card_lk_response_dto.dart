import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/card_lk_dto.dart';

part 'card_lk_response_dto.g.dart';

@JsonSerializable()
class CardLkResponseDto with ApiStatusResponse{
  CardLkResponseDto({
    this.listCardLkDto,
  });

  factory CardLkResponseDto.fromJson(Map<String, dynamic> json) => _$CardLkResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CardLkResponseDtoToJson(this);

  @JsonKey(name: 'list_card_lk') ListCardLkDto? listCardLkDto;

}