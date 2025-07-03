import 'package:json_annotation/json_annotation.dart';

part 'check_activate_request_dto.g.dart';

@JsonSerializable()
class CheckActivateRequestDto {
  CheckActivateRequestDto({
    this.policeId,
  });

  factory CheckActivateRequestDto.fromJson(Map<String, dynamic> json) => _$CheckActivateRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CheckActivateRequestDtoToJson(this);

  @JsonKey(name: 'police_id') String? policeId;


}