import 'package:json_annotation/json_annotation.dart';

part 'login_scanqr_crimes_request_dto.g.dart';

@JsonSerializable()
class LoginScanQrCRIMESRequestDto {
  LoginScanQrCRIMESRequestDto({
    this.token_sid,

  });

  factory LoginScanQrCRIMESRequestDto.fromJson(Map<String, dynamic> json) => _$LoginScanQrCRIMESRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginScanQrCRIMESRequestDtoToJson(this);

  @JsonKey(name: 'token_sid') String? token_sid;

}