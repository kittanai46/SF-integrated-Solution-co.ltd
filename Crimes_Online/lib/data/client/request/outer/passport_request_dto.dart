import 'package:json_annotation/json_annotation.dart';

part 'passport_request_dto.g.dart';

@JsonSerializable()
class PassportRequestDto {
  PassportRequestDto({
    this.passportNo,this.lat,this.lon
  });

  factory PassportRequestDto.fromJson(Map<String, dynamic> json) => _$PassportRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PassportRequestDtoToJson(this);

  @JsonKey(name: 'passportno') String? passportNo;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}