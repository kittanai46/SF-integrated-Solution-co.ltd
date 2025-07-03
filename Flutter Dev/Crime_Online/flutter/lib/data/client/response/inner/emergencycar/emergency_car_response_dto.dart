import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../dto/inner/emergency/emergency_car_dto.dart';

part 'emergency_car_response_dto.g.dart';

@JsonSerializable()
class EmgcCarResponseDto with ApiStatusResponse{
  EmgcCarResponseDto({
    this.listEmergencyCarDto,
  });

  factory EmgcCarResponseDto.fromJson(Map<String, dynamic> json) => _$EmgcCarResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EmgcCarResponseDtoToJson(this);

  @JsonKey(name: 'list_emgc_car') ListEmergencyCarDto? listEmergencyCarDto;

}