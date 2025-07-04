import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto {
  ImageDto({
    this.image,
    this.mineType,
    //this.personalID,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
 
  @JsonKey(name: 'image') String? image;
  @JsonKey(name: 'mineType') String? mineType;
  //@JsonKey(name: 'personalID') String personalID;

}

@JsonSerializable()
class ListImageDto {
  ListImageDto({
    this.status,
    this.data,
  });

  factory ListImageDto.fromJson(Map<String, dynamic> json) => _$ListImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListImageDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<ImageDto>? data;
}

class ImageConstant {
  ImageConstant._();

  static const String m_image = 'ภาพใบหน้า';
  static const String m_mineType = 'ชนิดไฟล์รูปภาพ';
  static const String m_personalID = 'เลขประจำตัวประชาชน';
}