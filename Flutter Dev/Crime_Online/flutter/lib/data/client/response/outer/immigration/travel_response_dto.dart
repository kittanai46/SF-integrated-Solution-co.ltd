import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/immigration/travel_dto.dart';

part 'travel_response_dto.g.dart';

@JsonSerializable()
class TravelResponseDto with ApiStatusResponse{
  TravelResponseDto({
    this.listTravelDto,
  });

  factory TravelResponseDto.fromJson(Map<String, dynamic> json) => _$TravelResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TravelResponseDtoToJson(this);

  @JsonKey(name: 'list_travel') ListTravelDto? listTravelDto;

}