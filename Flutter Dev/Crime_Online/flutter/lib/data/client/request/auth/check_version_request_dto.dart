import 'package:json_annotation/json_annotation.dart';

part 'check_version_request_dto.g.dart';

@JsonSerializable()
class CheckVersionRequestDto {
  CheckVersionRequestDto({
    this.version,
    this.platform,
  });

  factory CheckVersionRequestDto.fromJson(Map<String, dynamic> json) => _$CheckVersionRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CheckVersionRequestDtoToJson(this);

  @JsonKey(name: 'version') String? version;
  @JsonKey(name: 'platform') String? platform;

}