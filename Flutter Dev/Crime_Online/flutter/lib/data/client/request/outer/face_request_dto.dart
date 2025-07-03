import 'package:json_annotation/json_annotation.dart';

part 'face_request_dto.g.dart';

@JsonSerializable()
class FaceRequestDto {
  FaceRequestDto({this.face_image,this.lat,this.lon});

  factory FaceRequestDto.fromJson(Map<String, dynamic> json) => _$FaceRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FaceRequestDtoToJson(this);

  @JsonKey(name: 'face_image') String? face_image;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}