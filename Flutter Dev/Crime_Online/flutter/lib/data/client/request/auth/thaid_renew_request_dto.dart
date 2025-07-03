import 'package:json_annotation/json_annotation.dart';

part 'thaid_renew_request_dto.g.dart';

@JsonSerializable()
class ThaIDRenewRequestDto {
  ThaIDRenewRequestDto({
    this.pid,
    this.thaidState,
    this.thaidCode,
  });

  factory ThaIDRenewRequestDto.fromJson(Map<String, dynamic> json) => _$ThaIDRenewRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThaIDRenewRequestDtoToJson(this);

  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'thaid_state') String? thaidState;
  @JsonKey(name: 'thaid_code') String? thaidCode;

}