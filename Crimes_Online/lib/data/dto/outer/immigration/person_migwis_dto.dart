import 'package:json_annotation/json_annotation.dart';

part 'person_migwis_dto.g.dart';

@JsonSerializable()
class PersonMigwisDto {
  PersonMigwisDto({
    this.keyValue,
    this.alienNumber,
    this.alienNationality,
    this.alienDocNumber,
    this.alienDocExpirydate,
    this.alienDocIssuectry,
    this.alienSurname,
    this.alienGivenname,
    this.alienMiddlename,
    this.alienDob,
    this.alienSex,
    this.enrollmentReason,
    this.contact,
    this.note,
    this.insAt,
    this.createdBy,
    this.borderpost,
    this.images,
    this.createdate,
  });


  factory PersonMigwisDto.fromJson(Map<String, dynamic> json) => _$PersonMigwisDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonMigwisDtoToJson(this);

  @JsonKey(name: 'KEY_VALUE')
  String? keyValue;

  @JsonKey(name: 'ALIEN_NUMBER')
  String? alienNumber;

  @JsonKey(name: 'ALIEN_NATIONALITY')
  String? alienNationality;

  @JsonKey(name: 'ALIEN_DOC_NUMBER')
  String? alienDocNumber;

  @JsonKey(name: 'ALIEN_DOC_EXPIRYDATE')
  String? alienDocExpirydate;

  @JsonKey(name: 'ALIEN_DOC_ISSUECTRY')
  String? alienDocIssuectry;

  @JsonKey(name: 'ALIEN_SURNAME')
  String? alienSurname;

  @JsonKey(name: 'ALIEN_GIVENNAME')
  String? alienGivenname;

  @JsonKey(name: 'ALIEN_MIDDLENAME')
  String? alienMiddlename;

  @JsonKey(name: 'ALIEN_DOB')
  String? alienDob;

  @JsonKey(name: 'ALIEN_SEX')
  String? alienSex;

  @JsonKey(name: 'ENROLLMENT_REASON')
  String? enrollmentReason;

  @JsonKey(name: 'CONTACT')
  String? contact;

  @JsonKey(name: 'NOTE')
  String? note;

  @JsonKey(name: 'INS_AT')
  String? insAt;

  @JsonKey(name: 'CREATED_BY')
  String? createdBy;

  @JsonKey(name: 'BORDERPOST')
  String? borderpost;

  @JsonKey(name: 'IMAGES')
  String? images;

  @JsonKey(name: 'CREATEDATE')
  String? createdate;
}

@JsonSerializable()
class ListMigwisDto {
  ListMigwisDto({
    this.status,
    this.data,
  });

  factory ListMigwisDto.fromJson(Map<String, dynamic> json) =>
      _$ListMigwisDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListMigwisDtoToJson(this);

  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  List<PersonMigwisDto>? data;
}

class PersonMigwisConstant {
  PersonMigwisConstant._();

  static const String m_KEY_VALUE = 'รหัสทะเบียนแรงงาน';
  static const String m_ALIEN_NUMBER = 'เลขทะเบียนแรงงาน';
  static const String m_ALIEN_NATIONALITY = 'สัญชาติ';
  static const String m_ALIEN_DOC_NUMBER = 'เลขที่เอกสาร';
  static const String m_ALIEN_DOC_EXPIRYDATE = 'วันหมดอายุเอกสาร';
  static const String m_ALIEN_DOC_ISSUECTRY = 'ประเทศที่ออกเอกสาร';
  static const String m_ALIEN_SURNAME = 'นามสกุล';
  static const String m_ALIEN_GIVENNAME = 'ชื่อ';
  static const String m_ALIEN_MIDDLENAME = 'ชื่อกลาง';
  static const String m_ALIEN_DOB = 'วันเกิด';
  static const String m_ALIEN_SEX = 'เพศ';
  static const String m_ENROLLMENT_REASON = 'เหตุผลในการลงทะเบียน';
  static const String m_CONTACT = 'ข้อมูลติดต่อ';
  static const String m_NOTE = 'หมายเหตุ';
  static const String m_INS_AT = 'วันที่ INS_AT';
  static const String m_CREATED_BY = 'ผู้สร้างข้อมูล';
  static const String m_BORDERPOST = 'ด่านตรวจคนเข้าเมือง';
  static const String m_IMAGES = 'ภาพถ่าย';
  static const String m_CREATEDATE = 'วันที่สร้างข้อมูล';
}
