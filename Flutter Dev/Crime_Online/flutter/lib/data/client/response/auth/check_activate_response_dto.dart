import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_activate_response_dto.g.dart';

@JsonSerializable()
class CheckActivateResponseDto with ApiStatusResponse {
  CheckActivateResponseDto({
    this.state,
  });

  factory CheckActivateResponseDto.fromJson(Map<String, dynamic> json) => _$CheckActivateResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CheckActivateResponseDtoToJson(this);

  @JsonKey(name: 'state') int? state;


}