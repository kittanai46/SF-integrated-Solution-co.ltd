import 'package:json_annotation/json_annotation.dart';

part 'thaid_lk2_request_dto.g.dart';

@JsonSerializable()
class ThaIDLk2RequestDto {
  ThaIDLk2RequestDto({
    this.state,
    this.code,
  });

  factory ThaIDLk2RequestDto.fromJson(Map<String, dynamic> json) => _$ThaIDLk2RequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThaIDLk2RequestDtoToJson(this);

  @JsonKey(name: 'state') String? state;
  @JsonKey(name: 'code') String? code;

}