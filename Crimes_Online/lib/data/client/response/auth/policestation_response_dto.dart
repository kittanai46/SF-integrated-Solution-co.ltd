import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/profile/policestation_dto.dart';

part 'policestation_response_dto.g.dart';

@JsonSerializable()
class PoliceStationResponseDto with ApiStatusResponse{
  PoliceStationResponseDto({
    this.listPoliceStationDto,
  });

  factory PoliceStationResponseDto.fromJson(Map<String, dynamic> json) => _$PoliceStationResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PoliceStationResponseDtoToJson(this);

  @JsonKey(name: 'list_policestation') ListPoliceStationDto? listPoliceStationDto;

}