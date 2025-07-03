import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_scanqr_response_dto.g.dart';

@JsonSerializable()
class LoginScanQrResponseDto  with ApiStatusResponse {
  LoginScanQrResponseDto({this.key});

  factory LoginScanQrResponseDto.fromJson(Map<String, dynamic> json) => _$LoginScanQrResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginScanQrResponseDtoToJson(this);

  @JsonKey(name: 'key') String? key;
}