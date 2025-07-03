import 'package:json_annotation/json_annotation.dart';

part 'pasid_request_dto.g.dart';

@JsonSerializable()
class PasIdRequestDto {
  PasIdRequestDto({this.pasId, this.nation, this.lat, this.lon});

  factory PasIdRequestDto.fromJson(Map<String, dynamic> json) => _$PasIdRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PasIdRequestDtoToJson(this);

  @JsonKey(name: 'pasid') String? pasId;
  @JsonKey(name: 'nation') String? nation;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}