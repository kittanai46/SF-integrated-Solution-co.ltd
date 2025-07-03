import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_scanqr_crimes_response_dto.g.dart';

@JsonSerializable()
class LoginScanQrCRIMESResponseDto  with ApiStatusResponse {
  LoginScanQrCRIMESResponseDto({this.key});

  factory LoginScanQrCRIMESResponseDto.fromJson(Map<String, dynamic> json) => _$LoginScanQrCRIMESResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginScanQrCRIMESResponseDtoToJson(this);

  @JsonKey(name: 'key') String? key;
}