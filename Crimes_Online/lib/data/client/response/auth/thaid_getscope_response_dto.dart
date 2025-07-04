import 'package:json_annotation/json_annotation.dart';

part 'thaid_getscope_response_dto.g.dart';

@JsonSerializable()
class ThaIDGetScopeResponseDto {
  ThaIDGetScopeResponseDto({
    this.thaidStatus,
    this.thaidMessage,
    this.thaidPoliceID,

  });

  factory ThaIDGetScopeResponseDto.fromJson(Map<String, dynamic> json) => _$ThaIDGetScopeResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThaIDGetScopeResponseDtoToJson(this);

  @JsonKey(name: 'status') String? thaidStatus;
  @JsonKey(name: 'message') String? thaidMessage;
  @JsonKey(name: 'thaid_policeid') String? thaidPoliceID;

}