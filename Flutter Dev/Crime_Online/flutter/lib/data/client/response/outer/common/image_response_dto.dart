import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/common/image_dto.dart';

part 'image_response_dto.g.dart';

@JsonSerializable()
class ImageResponseDto with ApiStatusResponse{
  ImageResponseDto({
    this.listImageDto,
  });

  factory ImageResponseDto.fromJson(Map<String, dynamic> json) => _$ImageResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageResponseDtoToJson(this);

  @JsonKey(name: 'list_image') ListImageDto? listImageDto;

}