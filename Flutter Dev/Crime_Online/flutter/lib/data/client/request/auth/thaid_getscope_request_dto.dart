import 'package:json_annotation/json_annotation.dart';

part 'thaid_getscope_request_dto.g.dart';

@JsonSerializable()
class ThaIDGetScopeRequestDto {
  ThaIDGetScopeRequestDto({
    this.thaidState,

  });

  factory ThaIDGetScopeRequestDto.fromJson(Map<String, dynamic> json) => _$ThaIDGetScopeRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThaIDGetScopeRequestDtoToJson(this);

  @JsonKey(name: 'thaid_state') String? thaidState;

}