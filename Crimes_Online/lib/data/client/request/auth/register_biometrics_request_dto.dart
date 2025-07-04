import 'package:json_annotation/json_annotation.dart';

part 'register_biometrics_request_dto.g.dart';

@JsonSerializable()
class RegisterBiometricsRequestDto {
  RegisterBiometricsRequestDto({
    this.biometricsToken,
  });

  factory RegisterBiometricsRequestDto.fromJson(Map<String, dynamic> json) => _$RegisterBiometricsRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterBiometricsRequestDtoToJson(this);

  @JsonKey(name: 'biometrics_token') String? biometricsToken;


}