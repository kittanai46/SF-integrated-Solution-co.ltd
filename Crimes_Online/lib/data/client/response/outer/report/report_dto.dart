import 'package:json_annotation/json_annotation.dart';

part 'report_dto.g.dart';

@JsonSerializable()
class ReportDto {
  ReportDto({
    this.linkdownload,
  });

  factory ReportDto.fromJson(Map<String, dynamic> json) => _$ReportDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportDtoToJson(this);

  @JsonKey(name: 'linkdownload') String? linkdownload;


}

@JsonSerializable()
class ListReportDto {
  ListReportDto({
    this.status,
    this.data,
  });

  factory ListReportDto.fromJson(Map<String, dynamic> json) => _$ListReportDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListReportDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<ReportDto>? data;
}

