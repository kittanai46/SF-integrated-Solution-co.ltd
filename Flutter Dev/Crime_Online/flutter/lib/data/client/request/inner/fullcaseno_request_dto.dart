import 'package:json_annotation/json_annotation.dart';

part 'fullcaseno_request_dto.g.dart';

@JsonSerializable()
class FullcaseNoRequestDto {
  FullcaseNoRequestDto({this.orgCode, this.crimeCaseYear, this.crimeCaseNo,this.lat, this.lon});

  factory FullcaseNoRequestDto.fromJson(Map<String, dynamic> json) => _$FullcaseNoRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FullcaseNoRequestDtoToJson(this);

  @JsonKey(name: 'orgcode') String? orgCode;
  @JsonKey(name: 'crimecaseyear') String? crimeCaseYear;
  @JsonKey(name: 'crimecaseno') String? crimeCaseNo;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}