import 'package:json_annotation/json_annotation.dart';

part 'health_dto.g.dart';

@JsonSerializable()
class HealthDto {
  HealthDto({
    this.healthFirst,
    this.hospitalFirst,
    this.sDateFirst,
    this.eDateFirst,
    this.healthSecond,
    this.hospitalSecond,
  });

  factory HealthDto.fromJson(Map<String, dynamic> json) => _$HealthDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HealthDtoToJson(this);

  @JsonKey(name: 'HealthFirst') String? healthFirst;
  @JsonKey(name: 'HospitalFirst') String? hospitalFirst;
  @JsonKey(name: 'SDateFirst') String? sDateFirst;
  @JsonKey(name: 'EDateFirst') String? eDateFirst;
  @JsonKey(name: 'HealthSecond') String? healthSecond;
  @JsonKey(name: 'HospitalSecond') String? hospitalSecond;

}

@JsonSerializable()
class ListHealthDto {
  ListHealthDto({
    this.status,
    this.data,
  });

  factory ListHealthDto.fromJson(Map<String, dynamic> json) => _$ListHealthDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListHealthDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<HealthDto>? data;
}

class HealthConstant {
  HealthConstant._();

  static const String m_healthFirst = 'สิทธิประกันสุขภาพ';
  static const String m_hospitalFirst = 'ชื่อหน่วยบริการ';
  static const String m_sDateFirst = 'วันที่ออกบัตร';
  static const String m_eDateFirst = 'วันหมดอายุ';
  static const String m_healthSecond = 'สิทธิประกันสุขภาพ';
  static const String m_hospitalSecond = 'ชื่อหน่วยบริการ';
}