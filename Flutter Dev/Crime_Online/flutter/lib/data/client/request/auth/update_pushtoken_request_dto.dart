import 'package:json_annotation/json_annotation.dart';

part 'update_pushtoken_request_dto.g.dart';

@JsonSerializable()
class UpdatePushTokenRequestDto {
  UpdatePushTokenRequestDto({
    this.pushToken,
  });

  factory UpdatePushTokenRequestDto.fromJson(Map<String, dynamic> json) => _$UpdatePushTokenRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePushTokenRequestDtoToJson(this);

  @JsonKey(name: 'push_token') String? pushToken;

}