import 'package:json_annotation/json_annotation.dart';

part 'update_notify_request_dto.g.dart';

@JsonSerializable()
class UpdateNotifyRequestDto {
  UpdateNotifyRequestDto({this.mx_id,});

  factory UpdateNotifyRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateNotifyRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateNotifyRequestDtoToJson(this);

  @JsonKey(name: 'mx_id') String? mx_id;
}