import 'package:json_annotation/json_annotation.dart';

part 'register_pin_request_dto.g.dart';

@JsonSerializable()
class RegisterPinRequestDto {
  RegisterPinRequestDto({
    this.pin,
  });

  factory RegisterPinRequestDto.fromJson(Map<String, dynamic> json) => _$RegisterPinRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPinRequestDtoToJson(this);

  @JsonKey(name: 'pin') String? pin;


}