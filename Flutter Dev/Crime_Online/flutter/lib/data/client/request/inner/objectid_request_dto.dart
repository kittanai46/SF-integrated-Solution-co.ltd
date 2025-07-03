import 'package:json_annotation/json_annotation.dart';

part 'objectid_request_dto.g.dart';

@JsonSerializable()
class ObjectIdRequestDto {
  ObjectIdRequestDto({this.objectId,this.lat, this.lon});

  factory ObjectIdRequestDto.fromJson(Map<String, dynamic> json) => _$ObjectIdRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectIdRequestDtoToJson(this);

  @JsonKey(name: 'object_id') String? objectId;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}