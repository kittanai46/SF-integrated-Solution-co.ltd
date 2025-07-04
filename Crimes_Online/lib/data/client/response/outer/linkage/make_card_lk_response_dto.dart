import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/make_card_lk_dto.dart';

part 'make_card_lk_response_dto.g.dart';

@JsonSerializable()
class MakeCardLkResponseDto with ApiStatusResponse{
  MakeCardLkResponseDto({
    this.listMakeCardLkDto,
  });

  factory MakeCardLkResponseDto.fromJson(Map<String, dynamic> json) => _$MakeCardLkResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MakeCardLkResponseDtoToJson(this);

  @JsonKey(name: 'list_make_card_lk') ListMakeCardLkDto? listMakeCardLkDto;

}