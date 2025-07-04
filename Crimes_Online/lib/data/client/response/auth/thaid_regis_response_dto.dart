import 'package:json_annotation/json_annotation.dart';

part 'thaid_regis_response_dto.g.dart';

@JsonSerializable()
class ThaIDRegisResponseDto {
  ThaIDRegisResponseDto({
    this.status,
    this.message,
    this.thaidPoliceID,
    this.key,

  });

  factory ThaIDRegisResponseDto.fromJson(Map<String, dynamic> json) => _$ThaIDRegisResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThaIDRegisResponseDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'message') String? message;
  @JsonKey(name: 'thaid_policeid') String? thaidPoliceID;
  @JsonKey(name: 'key') String? key;

}