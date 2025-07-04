import 'package:json_annotation/json_annotation.dart';

part 'thaid_renew_response_dto.g.dart';

@JsonSerializable()
class ThaIDRenewResponseDto {
  ThaIDRenewResponseDto({
    this.status,
    this.message,

  });

  factory ThaIDRenewResponseDto.fromJson(Map<String, dynamic> json) => _$ThaIDRenewResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThaIDRenewResponseDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'message') String? message;

}