import 'package:json_annotation/json_annotation.dart';

part 'prisonimg_request_dto.g.dart';

@JsonSerializable()
class PrisonImgRequestDto {
  PrisonImgRequestDto({
    this.imgUrl,this.imgNo,this.prisonerId,this.lat,this.lon
  });

  factory PrisonImgRequestDto.fromJson(Map<String, dynamic> json) => _$PrisonImgRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PrisonImgRequestDtoToJson(this);

  @JsonKey(name: 'img_url') String? imgUrl;
  @JsonKey(name: 'img_no') String? imgNo;
  @JsonKey(name: 'prisoner_id') String? prisonerId;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}