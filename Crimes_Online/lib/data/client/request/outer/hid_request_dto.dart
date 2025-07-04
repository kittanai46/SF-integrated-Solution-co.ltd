import 'package:json_annotation/json_annotation.dart';

part 'hid_request_dto.g.dart';

@JsonSerializable()
class HidRequestDto {
  HidRequestDto({this.hid, this.lat, this.lon});

  factory HidRequestDto.fromJson(Map<String, dynamic> json) => _$HidRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HidRequestDtoToJson(this);

  @JsonKey(name: 'hid') String? hid;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}