import 'package:json_annotation/json_annotation.dart';

part 'person_rescue_volunteer_dto.g.dart';

@JsonSerializable()
class PersonRvDto {
  PersonRvDto({
    this.org_name,
    this.pid,
    this.fullname,
    this.issue_date,
    this.expire_date,
    this.isexpire,

  });

  factory PersonRvDto.fromJson(Map<String, dynamic> json) => _$PersonRvDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonRvDtoToJson(this);

  @JsonKey(name: 'org_name') String? org_name;
  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'fullname') String? fullname;
  @JsonKey(name: 'issue_date') String? issue_date;
  @JsonKey(name: 'expire_date') String? expire_date;
  @JsonKey(name: 'isexpire') String? isexpire;

}

@JsonSerializable()
class ListPersonRvDto {
  ListPersonRvDto({
    this.status,
    this.data,
  });

  factory ListPersonRvDto.fromJson(Map<String, dynamic> json) => _$ListPersonRvDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPersonRvDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PersonRvDto>? data;
}

class PersonRvConstant {
  PersonRvConstant._();

  static const String m_org_name = 'ชื่อหน่วยงาน';
  static const String m_pid = 'เลขประจำตัวประชาชน';
  static const String m_fullname = 'ชื่อ สกุล';
  static const String m_issue_date = 'วันที่ออกใบอนุญาต';
  static const String m_expire_date = 'วันที่หมดอายุ';
  static const String m_isexpire = 'สถานะการหมดอายุ';
}