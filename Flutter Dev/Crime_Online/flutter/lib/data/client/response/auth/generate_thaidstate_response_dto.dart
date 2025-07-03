import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_thaidstate_response_dto.g.dart';

@JsonSerializable()
class GenerateThaIDStateResponseDto  with ApiStatusResponse {
  GenerateThaIDStateResponseDto({
    this.thaidState,
    this.thaidHost
  });

  factory GenerateThaIDStateResponseDto.fromJson(Map<String, dynamic> json) => _$GenerateThaIDStateResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GenerateThaIDStateResponseDtoToJson(this);

  @JsonKey(name: 'thaid_state') String? thaidState;
  @JsonKey(name: 'thaid_host') String? thaidHost;
}