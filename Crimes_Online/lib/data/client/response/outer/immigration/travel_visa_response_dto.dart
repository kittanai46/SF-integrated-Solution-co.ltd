import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/immigration/travel_visa_dto.dart';

part 'travel_visa_response_dto.g.dart';

@JsonSerializable()
class TravelVisaResponseDto with ApiStatusResponse{
  TravelVisaResponseDto({
    this.listTravelVisaDto,
  });

  factory TravelVisaResponseDto.fromJson(Map<String, dynamic> json) => _$TravelVisaResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TravelVisaResponseDtoToJson(this);

  @JsonKey(name: 'list_travel_visa') ListTravelVisaDto? listTravelVisaDto;

}