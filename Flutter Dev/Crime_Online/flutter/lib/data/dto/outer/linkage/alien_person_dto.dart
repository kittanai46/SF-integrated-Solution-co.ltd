import 'package:json_annotation/json_annotation.dart';

part 'alien_person_dto.g.dart';

@JsonSerializable()
class AlienPersonDto {
  AlienPersonDto({
    this.personalID,
    this.bloodType,
    this.dateInThai,
    this.dateOfBirth,
    this.doeNumber,
    this.father_name,
    this.father_nationalityDesc,
    this.father_personalID,
    this.firstName,
    this.genderDesc,
    this.houseID,
    this.lastName,
    this.marryStatus,
    this.mother_name,
    this.mother_nationalityDesc,
    this.mother_personalID,
    this.nationalityDesc,
    this.passport_expireDate,
    this.passport_documentNo,
    this.passport_documentIssuePlace,
    this.passport_documentType,
    this.passport_issueDate,
    this.personAddDate,
    this.religion,
    this.spouseName,
    this.statusAdded,
    this.statusOfPersonDesc,
    this.terminateDate,
    this.titleDesc,
    this.visa_documentIssuePlace,
    this.visa_documentNo,
    this.visa_expireDate,
    this.visa_issueDate,
    this.visa_visaRequestType,
    this.visa_visaType,
  });

  factory AlienPersonDto.fromJson(Map<String, dynamic> json) => _$AlienPersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AlienPersonDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'bloodType') String? bloodType;
  @JsonKey(name: 'dateInThai') String? dateInThai;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'doeNumber') String? doeNumber;
  @JsonKey(name: 'father.name') String? father_name;
  @JsonKey(name: 'father.nationalityDesc') String? father_nationalityDesc;
  @JsonKey(name: 'father.personalID') String? father_personalID;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  @JsonKey(name: 'houseID') String? houseID;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'marryStatus') String? marryStatus;
  @JsonKey(name: 'mother.name') String? mother_name;
  @JsonKey(name: 'mother.nationalityDesc') String? mother_nationalityDesc;
  @JsonKey(name: 'mother.personalID') String? mother_personalID;
  @JsonKey(name: 'nationalityDesc') String? nationalityDesc;
  @JsonKey(name: 'passport.expireDate') String? passport_expireDate;
  @JsonKey(name: 'passport.documentNo') String? passport_documentNo;
  @JsonKey(name: 'passport.documentIssuePlace') String? passport_documentIssuePlace;
  @JsonKey(name: 'passport.documentType') String? passport_documentType;
  @JsonKey(name: 'passport.issueDate') String? passport_issueDate;
  @JsonKey(name: 'personAddDate') String? personAddDate;
  @JsonKey(name: 'religion') String? religion;
  @JsonKey(name: 'spouseName') String? spouseName;
  @JsonKey(name: 'statusAdded') String? statusAdded;
  @JsonKey(name: 'statusOfPersonDesc') String? statusOfPersonDesc;
  @JsonKey(name: 'terminateDate') String? terminateDate;
  @JsonKey(name: 'titleDesc') String? titleDesc;
  @JsonKey(name: 'visa.documentIssuePlace') String? visa_documentIssuePlace;
  @JsonKey(name: 'visa.documentNo') String? visa_documentNo;
  @JsonKey(name: 'visa.expireDate') String? visa_expireDate;
  @JsonKey(name: 'visa.issueDate') String? visa_issueDate;
  @JsonKey(name: 'visa.visaRequestType') String? visa_visaRequestType;
  @JsonKey(name: 'visa.visaType') String? visa_visaType;

}

@JsonSerializable()
class ListAlienPersonDto {
  ListAlienPersonDto({
    this.status,
    this.data,
  });

  factory ListAlienPersonDto.fromJson(Map<String, dynamic> json) => _$ListAlienPersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListAlienPersonDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<AlienPersonDto>? data;
}

class AlienPersonConstant {
  AlienPersonConstant._();

  static const String m_personalID = 'เลขประจำตัวคนต่างด้าว';
  static const String m_bloodType = 'หมู่เลือด';
  static const String m_dateInThai = 'วันที่เข้ามาในประเทศไทย';
  static const String m_dateOfBirth = 'วันเดือนปีเกิด';
  static const String m_doeNumber = 'เลขอ้างอิงจากกรมการจัดหางาน';
  static const String m_father_name = 'ชื่อ-ชื่อสกุลบิดา';
  static const String m_father_nationalityDesc = 'สัญชาติบิดา';
  static const String m_father_personalID = 'เลขประจำตัวประชาชนบิดา';
  static const String m_firstName = 'ชื่อตัว';
  static const String m_genderDesc = 'เพศ';
  static const String m_houseID = 'เลขรหัสประจำบ้านที่อาศัยอยู่';
  static const String m_lastName = 'ชื่อสกุล';
  static const String m_marryStatus = 'สถานภาพสมรส';
  static const String m_mother_name = 'ชื่อ-ชื่อสกุลมารดา';
  static const String m_mother_nationalityDesc = 'สัญชาติมารดา';
  static const String m_mother_personalID = 'เลขประจำตัวประชาชนมารดา';
  static const String m_nationalityDesc = 'สัญชาติ';
  static const String m_passport_expireDate = 'วันที่หมดอายุหนังสือเดินทาง';
  static const String m_passport_documentNo = 'เลขที่หนังสือต้นทาง';
  static const String m_passport_documentIssuePlace = 'สถานที่ออกหนังสือเดินทาง';
  static const String m_passport_documentType = 'ประเภทหนังสือเดินทาง';
  static const String m_passport_issueDate = 'วันที่ออกหนังสือเดินทาง';
  static const String m_personAddDate = 'วันที่่ทำการเพิ่มคนต่างด้าว';
  static const String m_religion = 'ศาสนา';
  static const String m_spouseName = 'ชื่อคู่สมรส';
  static const String m_statusAdded = 'สถานะการเพิ่มคนต่างด้าว';
  static const String m_statusOfPersonDesc = 'สถานภาพบุคคล';
  static const String m_terminateDate = 'วันที่จำหน่ายบุคคล';
  static const String m_titleDesc = 'คำนำหน้านาม';
  static const String m_visa_documentIssuePlace = 'สถานที่ออกวีซ่า';
  static const String m_visa_documentNo = 'เลขวีซ่า';
  static const String m_visa_expireDate = 'วันที่หมดอายุวีซ่า';
  static const String m_visa_issueDate = 'วันที่ออกวีซ่า';
  static const String m_visa_visaRequestType = 'ประเภทคำร้องขอออกวีซ่า';
  static const String m_visa_visaType = 'ประเภทวีซ่า';

}