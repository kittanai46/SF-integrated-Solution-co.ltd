import 'package:json_annotation/json_annotation.dart';

part 'login_scanqr_request_dto.g.dart';

@JsonSerializable()
class LoginScanQrRequestDto {
  LoginScanQrRequestDto({
    this.policeId,
    this.qrcode,
    this.deviceUdid,
    this.deviceName,
    this.brand,
    this.pushToken,
    this.osName,
    this.osVersion,
    this.buildNumber,
    this.manufacturer,
    this.model,
    this.publicKey,
    this.hasFingerprint,
  });

  factory LoginScanQrRequestDto.fromJson(Map<String, dynamic> json) => _$LoginScanQrRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginScanQrRequestDtoToJson(this);

  @JsonKey(name: 'police_id') String? policeId;
  @JsonKey(name: 'qrcode') String? qrcode;
  @JsonKey(name: 'device_udid') String? deviceUdid;
  @JsonKey(name: 'device_name') String? deviceName;
  @JsonKey(name: 'brand') String? brand;
  @JsonKey(name: 'push_token') String? pushToken;
  @JsonKey(name: 'os_name') String? osName;
  @JsonKey(name: 'os_version') String? osVersion;
  @JsonKey(name: 'build_number') String? buildNumber;
  @JsonKey(name: 'manufacturer') String? manufacturer;
  @JsonKey(name: 'model') String? model;
  @JsonKey(name: 'client_public_key') String? publicKey;
  @JsonKey(name: 'has_fingerprint') String? hasFingerprint;



}