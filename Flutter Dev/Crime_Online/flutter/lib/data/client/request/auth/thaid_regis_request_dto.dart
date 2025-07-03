import 'package:json_annotation/json_annotation.dart';

part 'thaid_regis_request_dto.g.dart';

@JsonSerializable()
class ThaIDRegisRequestDto {
  ThaIDRegisRequestDto({
    this.deviceUDID,
    this.deviceName,
    this.brand,
    this.pushToken,
    this.osName,
    this.osVersion,
    this.buildNumber,
    this.manufacturer,
    this.model,
    this.clientPublicKey,
    this.hasFingerPrint,
    this.thaidState,
    this.thaidCode,
  });

  factory ThaIDRegisRequestDto.fromJson(Map<String, dynamic> json) => _$ThaIDRegisRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThaIDRegisRequestDtoToJson(this);

  @JsonKey(name: 'device_udid') String? deviceUDID;
  @JsonKey(name: 'device_name') String? deviceName;
  @JsonKey(name: 'brand') String? brand;
  @JsonKey(name: 'push_token') String? pushToken;
  @JsonKey(name: 'os_name') String? osName;
  @JsonKey(name: 'os_version') String? osVersion;
  @JsonKey(name: 'build_number') String? buildNumber;
  @JsonKey(name: 'manufacturer') String? manufacturer;
  @JsonKey(name: 'model') String? model;
  @JsonKey(name: 'client_public_key') String? clientPublicKey;
  @JsonKey(name: 'has_fingerprint') String? hasFingerPrint;
  @JsonKey(name: 'thaid_state') String? thaidState;
  @JsonKey(name: 'thaid_code') String? thaidCode;

}