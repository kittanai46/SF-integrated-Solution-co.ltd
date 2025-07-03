import 'package:json_annotation/json_annotation.dart';

part 'person_rescue_training_dto.g.dart';

@JsonSerializable()
class PersonRtDto {
  PersonRtDto({
    this.course_name,
    this.training_site,
    this.training_results,
    this.pid,
    this.fullname,
    this.training_date,
    this.expire_date,
    this.isexpire,

  });

  factory PersonRtDto.fromJson(Map<String, dynamic> json) => _$PersonRtDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonRtDtoToJson(this);

  @JsonKey(name: 'course_name') String? course_name;
  @JsonKey(name: 'training_site') String? training_site;
  @JsonKey(name: 'training_results') String? training_results;
  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'fullname') String? fullname;
  @JsonKey(name: 'training_date') String? training_date;
  @JsonKey(name: 'expire_date') String? expire_date;
  @JsonKey(name: 'isexpire') String? isexpire;

}

@JsonSerializable()
class ListPersonRtDto {
  ListPersonRtDto({
    this.status,
    this.data,
  });

  factory ListPersonRtDto.fromJson(Map<String, dynamic> json) => _$ListPersonRtDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPersonRtDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PersonRtDto>? data;
}

class PersonRtConstant {
  PersonRtConstant._();

  static const String m_course_name = 'ชื่อหลักสูตรฝึกอบรม';
  static const String m_training_site = 'สถานที่ฝึกอบรม';
  static const String m_training_results = 'ผลการฝึกอบรม';
  static const String m_pid = 'เลขประจำตัวประชาชน';
  static const String m_fullname = 'ชื่อ สกุล';
  static const String m_training_date = 'วันที่ฝึกอบรม';
  static const String m_expire_date = 'วันที่หมดอายุ';
  static const String m_isexpire = 'สถานะการหมดอายุ';
}