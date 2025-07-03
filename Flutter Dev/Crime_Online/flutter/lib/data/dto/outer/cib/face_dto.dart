import 'package:json_annotation/json_annotation.dart';

part 'face_dto.g.dart';

@JsonSerializable()
class FaceDto {
  FaceDto({
    this.personalid,
    this.countrycode,
    this.score,

  });

  factory FaceDto.fromJson(Map<String, dynamic> json) => _$FaceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FaceDtoToJson(this);

  @JsonKey(name: 'personalid') String? personalid;
  @JsonKey(name: 'countrycode') String? countrycode;
  // @JsonKey(name: 'score') String? score;
  @JsonKey(name: 'score', fromJson: _toString) final String? score;

  static String? _toString(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }


}

@JsonSerializable()
class ListFaceDto {
  ListFaceDto({
    this.status,
    this.data,
  });

  factory ListFaceDto.fromJson(Map<String, dynamic> json) => _$ListFaceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListFaceDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<FaceDto>? data;
}

class FaceConstant {
  FaceConstant._();

  static const String m_personalid = 'เลขบัตรประชาชน';
  static const String m_countrycode = 'รหัสประเทศ';
  static const String m_score = 'คะแนน';

}