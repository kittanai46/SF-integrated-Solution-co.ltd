import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/cib/face_dto.dart';

part 'face_response_dto.g.dart';

@JsonSerializable()
class FaceResponseDto with ApiStatusResponse{
  FaceResponseDto({
    this.listFaceDto,
  });

  factory FaceResponseDto.fromJson(Map<String, dynamic> json) => _$FaceResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FaceResponseDtoToJson(this);

  @JsonKey(name: 'list_face') ListFaceDto? listFaceDto;

}