import 'package:json_annotation/json_annotation.dart';

part 'alienno_request_dto.g.dart';

@JsonSerializable()
class AlienNoRequestDto {
  AlienNoRequestDto({
    this.alien_no,this.lat,this.lon
  });

  factory AlienNoRequestDto.fromJson(Map<String, dynamic> json) => _$AlienNoRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AlienNoRequestDtoToJson(this);

  @JsonKey(name: 'alien_no') String? alien_no;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}