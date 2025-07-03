import 'package:json_annotation/json_annotation.dart';

part 'report_request_dto.g.dart';

@JsonSerializable()
class ReportRequestDto {
  ReportRequestDto({
    this.jsonMsg,this.lat,this.lon
  });

  factory ReportRequestDto.fromJson(Map<String, dynamic> json) => _$ReportRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportRequestDtoToJson(this);

  @JsonKey(name: 'json_msg') String? jsonMsg;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}