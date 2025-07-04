// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDto _$ReportDtoFromJson(Map<String, dynamic> json) => ReportDto(
      linkdownload: json['linkdownload'] as String?,
    );

Map<String, dynamic> _$ReportDtoToJson(ReportDto instance) => <String, dynamic>{
      'linkdownload': instance.linkdownload,
    };

ListReportDto _$ListReportDtoFromJson(Map<String, dynamic> json) =>
    ListReportDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReportDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListReportDtoToJson(ListReportDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
