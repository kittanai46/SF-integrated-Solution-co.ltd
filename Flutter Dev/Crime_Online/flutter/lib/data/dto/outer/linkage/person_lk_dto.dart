import 'package:json_annotation/json_annotation.dart';

part 'person_lk_dto.g.dart';

@JsonSerializable()
class PersonLkDto {
  PersonLkDto({
    this.age,
    this.dateOfBirth,
    this.dateOfMoveIn,
    this.englishFirstName,
    this.englishLastName,
    this.englishMiddleName,
    this.englishTitleDesc,
    this.fatherName,
    this.fatherNationalityCode,
    this.fatherNationalityDesc,
    this.fatherPersonalID,
    this.firstName,
    this.fullnameAndRank,
    this.genderCode,
    this.genderDesc,
    this.lastName,
    this.middleName,
    this.motherName,
    this.motherNationalityCode,
    this.motherNationalityDesc,
    this.motherPersonalID,
    this.nationalityCode,
    this.nationalityDesc,
    this.ownerStatusDesc,
    this.pid,
    this.recordNumber,
    this.statusOfPersonCode,
    this.statusOfPersonDesc,
    this.titleCode,
    this.titleDesc,
    this.titleName,
    this.titleSex,
    this.totalRecord,
  });

  factory PersonLkDto.fromJson(Map<String, dynamic> json) => _$PersonLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonLkDtoToJson(this);
 
  @JsonKey(name: 'age') String? age;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'dateOfMoveIn') String? dateOfMoveIn;
  @JsonKey(name: 'englishFirstName') String? englishFirstName;
  @JsonKey(name: 'englishLastName') String? englishLastName;
  @JsonKey(name: 'englishMiddleName') String? englishMiddleName;
  @JsonKey(name: 'englishTitleDesc') String? englishTitleDesc;
  @JsonKey(name: 'fatherName') String? fatherName;
  @JsonKey(name: 'fatherNationalityCode') String? fatherNationalityCode;
  @JsonKey(name: 'fatherNationalityDesc') String? fatherNationalityDesc;
  @JsonKey(name: 'fatherPersonalID') String? fatherPersonalID;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'fullnameAndRank') String? fullnameAndRank;
  @JsonKey(name: 'genderCode') String? genderCode;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'middleName') String? middleName;
  @JsonKey(name: 'motherName') String? motherName;
  @JsonKey(name: 'motherNationalityCode') String? motherNationalityCode;
  @JsonKey(name: 'motherNationalityDesc') String? motherNationalityDesc;
  @JsonKey(name: 'motherPersonalID') String? motherPersonalID;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityDesc') String? nationalityDesc;
  @JsonKey(name: 'ownerStatusDesc') String? ownerStatusDesc;
  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'recordNumber') int? recordNumber;
  @JsonKey(name: 'statusOfPersonCode') String? statusOfPersonCode;
  @JsonKey(name: 'statusOfPersonDesc') String? statusOfPersonDesc;
  @JsonKey(name: 'titleCode') String? titleCode;
  @JsonKey(name: 'titleDesc') String? titleDesc;
  @JsonKey(name: 'titleName') String? titleName;
  @JsonKey(name: 'titleSex') String? titleSex;
  @JsonKey(name: 'totalRecord') int? totalRecord;

}

@JsonSerializable()
class ListPersonLkDto {
  ListPersonLkDto({
    this.status,
    this.data,
  });

  factory ListPersonLkDto.fromJson(Map<String, dynamic> json) => _$ListPersonLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPersonLkDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PersonLkDto>? data;
}

class PersonLkConstant {
  PersonLkConstant._();

  static const String m_age = 'อายุ';
  static const String m_dateOfBirth = 'วันเดือนปี เกิด';
  static const String m_dateOfMoveIn = 'วันเดือนปี ที่ย้ายเข้ามาในบ้าน';
  static const String m_englishFirstName = 'ชื่อตัว (ภาษาอังกฤษ)';
  static const String m_englishLastName = 'ชื่อสกุล (ภาษาอังกฤษ)';
  static const String m_englishMiddleName = 'ชื่อกลาง (ภาษาอังกฤษ)';
  static const String m_englishTitleDesc = 'คำนำหน้านาม (ภาษาอังกฤษ)';
  static const String m_fatherName = 'ชื่อบิดา';
  static const String m_fatherNationalityCode = 'รหัสสัญชาติ บิดา';
  static const String m_fatherNationalityDesc = 'สัญชาติ บิดา';
  static const String m_fatherPersonalID = 'เลขประจำตัวประชาชน';  //เลขประจำตัวประชาชน บิดา
  static const String m_firstName = 'ชื่อตัว';
  static const String m_fullnameAndRank = 'ชื่อเต็ม';
  static const String m_genderCode = 'รหัสเพศ';
  static const String m_genderDesc = 'เพศ';
  static const String m_lastName = 'ชื่อสกุล';
  static const String m_middleName = 'ชื่อกลาง';
  static const String m_motherName = 'ชื่อมารดา';
  static const String m_motherNationalityCode = 'รหัสสัญชาติ มารดา';
  static const String m_motherNationalityDesc = 'สัญชาติ มารดา';
  static const String m_motherPersonalID = 'เลขประจำตัวประชาชน';  //เลขประจำตัวประชาชน มารดา
  static const String m_nationalityCode = 'รหัสสัญชาติ';
  static const String m_nationalityDesc = 'สัญชาติ';
  static const String m_ownerStatusDesc = 'สถานะภาพเจ้าบ้าน';
  static const String m_pid = 'เลขประจำตัวประชาชน';
  static const String m_recordNumber = 'ลำดับที่ของข้อมูล';
  static const String m_statusOfPersonCode = 'รหัสสถานะภาพบุคคล';
  static const String m_statusOfPersonDesc = 'สถานภาพบุคคล';
  static const String m_titleCode = 'รหัสคำนำหน้านาม';
  static const String m_titleDesc = 'คำนำหน้านาม';
  static const String m_titleName = 'คำนำหน้านามแบบเต็ม';
  static const String m_titleSex = 'รหัสตรวจสอบคำนำหน้านาม';
  static const String m_totalRecord = 'จำนวนข้อมูลที่พบ';
}