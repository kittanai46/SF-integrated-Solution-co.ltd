import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_passcode_response_dto.g.dart';

@JsonSerializable()
class GeneratePasscodeResponseDto with ApiStatusResponse{
  GeneratePasscodeResponseDto({
    this.passcode,
  });

  factory GeneratePasscodeResponseDto.fromJson(Map<String, dynamic> json) => _$GeneratePasscodeResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GeneratePasscodeResponseDtoToJson(this);

  @JsonKey(name: 'passcode') String? passcode;

}