import 'package:json_annotation/json_annotation.dart';

part 'employment_dto.g.dart';

@JsonSerializable()
class EmploymentDto {
  EmploymentDto({
    this.ssoNum,
    this.idType,
    this.idDesc,
    this.titleCode,
    this.titleCodeDesc,
    this.firstName,
    this.lastName,
    this.empBirthDate,
    this.gender,
    this.genderDesc,
    this.activeStatus,
    this.activeStatusDesc,
    this.expirationDate,
    this.accBran,
    this.accNo,
    this.companyName,
    this.employStatus,
    this.employStatusDesc,
    this.empResignDate,
    this.expStartDate,
  });

  factory EmploymentDto.fromJson(Map<String, dynamic> json) => _$EmploymentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EmploymentDtoToJson(this);

  @JsonKey(name: 'ssoNum') String? ssoNum;
  @JsonKey(name: 'idType') String? idType;
  @JsonKey(name: 'idDesc') String? idDesc;
  @JsonKey(name: 'titleCode') String? titleCode;
  @JsonKey(name: 'titleCodeDesc') String? titleCodeDesc;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'empBirthDate') String? empBirthDate;
  @JsonKey(name: 'gender') String? gender;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  @JsonKey(name: 'activeStatus') String? activeStatus;
  @JsonKey(name: 'activeStatusDesc') String? activeStatusDesc;
  @JsonKey(name: 'expirationDate') String? expirationDate;
  @JsonKey(name: 'accBran') String? accBran;
  @JsonKey(name: 'accNo') String? accNo;
  @JsonKey(name: 'companyName') String? companyName;
  @JsonKey(name: 'employStatus') String? employStatus;
  @JsonKey(name: 'employStatusDesc') String? employStatusDesc;
  @JsonKey(name: 'empResignDate') String? empResignDate;
  @JsonKey(name: 'expStartDate') String? expStartDate;

}

@JsonSerializable()
class ListEmploymentDto {
  ListEmploymentDto({
    this.status,
    this.data,
  });

  factory ListEmploymentDto.fromJson(Map<String, dynamic> json) => _$ListEmploymentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListEmploymentDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<EmploymentDto>? data;
}

class EmploymentConstant {
  EmploymentConstant._();

  static const String m_ssoNum = 'เลขที่บัตร';
  static const String m_idType = 'รหัสประเภทบัตร';
  static const String m_idDesc = 'ประเภทบัตร';
  static const String m_titleCode = 'รหัสคำนำหน้าชื่อ';
  static const String m_titleCodeDesc = 'คำนำหน้าชื่อ';
  static const String m_firstName = 'ชื่อ';
  static const String m_lastName = 'นามสกุล';
  static const String m_empBirthDate = 'วันเกิด';
  static const String m_gender = 'รหัสเพศ';
  static const String m_genderDesc = 'เพศ';
  static const String m_activeStatus = 'รหัสสถานะผู้ประกันตน';
  static const String m_activeStatusDesc = 'สถานะผู้ประกันตน';
  static const String m_expirationDate = 'วันที่มรณะ';
  static const String m_accBran = 'รหัสสาขา';
  static const String m_accNo = 'รหัสสถานที่ทำงาน';
  static const String m_companyName = 'ชื่อสถานที่ทำงาน';
  static const String m_employStatus = 'รหัสสถานะพนักงาน';
  static const String m_employStatusDesc = 'สถานะพนักงาน';
  static const String m_empResignDate = 'วันที่ลาออก';
  static const String m_expStartDate = 'วันที่เริ่มงาน';
}