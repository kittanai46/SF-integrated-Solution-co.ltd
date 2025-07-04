import 'package:json_annotation/json_annotation.dart';

part 'prisoner_dto.g.dart';

@JsonSerializable()
class PrisonerDto {
  PrisonerDto({
  this.recDate,
  this.rowNum,
  this.generalSex,
  this.generalBlemish,
  this.relAmphur,
  this.raceName,
  this.nationalityName,
  this.relTumbon,
  this.prisonProvinceName,
  this.caseBase,
  this.prisonLname,
  this.histIdCard,
  this.distDate,
  this.prisonerId,
  this.age,
  this.imposeEndDate,
  this.prisonCode,
  this.relAddrLine1,
  this.relAddrLine2,
  this.prisonRegionCode,
  this.generalDob,
  this.relContactName,
  this.domicileProvinceName,
  this.prisonName,
  this.prisonAreaName,
    this.prisonFname,
  this.title,
  this.imposeStartDate,
  this.relAddrLine3,
  this.relProvince,
  this.contactTelNo1,
    this.punismentType,
  this.image,
  });

  factory PrisonerDto.fromJson(Map<String, dynamic> json) => _$PrisonerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PrisonerDtoToJson(this);

  @JsonKey(name: 'REC_DATE') String? recDate;
  @JsonKey(name: 'ROWNUM') String? rowNum;
  @JsonKey(name: 'GENERAL_SEX') String? generalSex;
  @JsonKey(name: 'GENERAL_BLEMISH') String? generalBlemish;
  @JsonKey(name: 'REL_AMPHUR') String? relAmphur;
  @JsonKey(name: 'RACE_NAME') String? raceName;
  @JsonKey(name: 'NATIONALITY_NAME') String? nationalityName;
  @JsonKey(name: 'REL_TUMBON') String? relTumbon;
  @JsonKey(name: 'PRISON_PROVINCE_NAME') String? prisonProvinceName;
  @JsonKey(name: 'CASE_BASE') String? caseBase;
  @JsonKey(name: 'PRISON_LNAME') String? prisonLname;
  @JsonKey(name: 'HIST_ID_CARD') String? histIdCard;
  @JsonKey(name: 'DIST_DATE') String? distDate;
  @JsonKey(name: 'PRISONER_ID') String? prisonerId;
  @JsonKey(name: 'AGE') String? age;
  @JsonKey(name: 'IMPOSE_END_DATE') String? imposeEndDate;
  @JsonKey(name: 'PRISON_CODE') String? prisonCode;
  @JsonKey(name: 'REL_ADDR_LINE_1') String? relAddrLine1;
  @JsonKey(name: 'REL_ADDR_LINE_2') String? relAddrLine2;
  @JsonKey(name: 'PRISON_REGION_CODE') String? prisonRegionCode;
  @JsonKey(name: 'GENERAL_DOB') String? generalDob;
  @JsonKey(name: 'REL_CONTACT_NAME') String? relContactName;
  @JsonKey(name: 'DOMICILE_PROVINCE_NAME') String? domicileProvinceName;
  @JsonKey(name: 'PRISON_NAME') String? prisonName;
  @JsonKey(name: 'PRISON_AREA_NAME') String? prisonAreaName;
  @JsonKey(name: 'PRISON_FNAME') String? prisonFname;
  @JsonKey(name: 'TITLE') String? title;
  @JsonKey(name: 'IMPOSE_START_DATE') String? imposeStartDate;
  @JsonKey(name: 'REL_ADDR_LINE_3') String? relAddrLine3;
  @JsonKey(name: 'REL_PROVINCE') String? relProvince;
  @JsonKey(name: 'CONTACT_TEL_NO_1') String? contactTelNo1;
  @JsonKey(name: 'PUNISHMENT_TYPE') String? punismentType;
  @JsonKey(name: 'IMAGE') String? image;
  @JsonKey(name: 'Img') String? img;

  void setImage(String input){
    img = input;
  }
}

@JsonSerializable()
class ListPrisonerDto {
  ListPrisonerDto({
    this.status,
    this.data,
  });

  factory ListPrisonerDto.fromJson(Map<String, dynamic> json) => _$ListPrisonerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPrisonerDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PrisonerDto>? data;
}

class PrisonerConstant {
  PrisonerConstant._();
  static const String m_recDate = 'วันที่รับตัว';
  static const String m_rowNum = 'รายการที่';
  static const String m_generalSex = 'เพศ';
  static const String m_generalBlemish = 'ตำหนิรูปพรรณ';
  static const String m_relAmphur = 'อำเภอ';
  static const String m_raceName = 'เชื้อชาติ';
  static const String m_nationalityName = 'สัญชาติ';
  static const String m_relTumbon = 'ตำบล';
  static const String m_prisonProvinceName = 'จังหวัดที่ตั้งเรือนจำ';
  static const String m_caseBase = 'ข้อหาที่ถูกลงโทษ';
  static const String m_prisonLname = 'นามสกุล';
  static const String m_histIdCard = 'หมายเลขปชช.';
  static const String m_distDate = 'วันที่ปล่อยตัว';
  static const String m_prisonerId = 'รหัสผู้ต้องขัง';
  static const String m_age = 'อายุ';
  static const String m_imposeEndDate = 'วันพ้นโทษ';
  static const String m_prisonCode = 'รหัสเรือนจำ';
  static const String m_relAddrLine1 = 'บ้านเลขที่ หมายเลขห้อง ชื่ออาคาร ชื่อหมู่บ้าน';  //ที่อยู่หลังปล่อยตัว(บ้านเลขที่ หมายเลขห้อง ชื่ออาคาร ชื่อหมู่บ้าน)
  static const String m_relAddrLine2 = 'ถนน ซอย หมู่บ้าน';     //ที่อยู่หลังปล่อยตัว(ถนน ซอย หมู่บ้าน)
  static const String m_prisonRegionCode = 'ภาคที่ตั้งเรือนจำ';
  static const String m_generalDob = 'วันเดือนปีเกิด';
  static const String m_relContactName = 'ชื่อผู้ติดต่อหลังพ้นโทษ';
  static const String m_domicileProvinceName = 'จังหวัดภูมิลำเนา';
  static const String m_prisonName = 'ชื่อเรือนจำ';
  static const String m_prisonAreaName = 'เขตที่ตั้งเรือนจำ';
  static const String m_prisonerFname = 'ชื่อ';
  static const String m_title = 'คำนำหน้าชื่อ';
  static const String m_imposeStartDate = 'วันนับแต่';
  static const String m_relAddrLine3 = 'ที่อยู่(อื่นๆ)';  //ที่อยู่หลังปล่อยตัว(อื่นๆ)
  static const String m_relProvince = 'จังหวัด';
  static const String m_contactTelNo1 = 'เบอร์ผู้ติดต่อหลังพ้นโทษ';
  static const String m_punismentType = 'ประเภทการจำคุก';
  static const String m_image = 'image_url';
/*"REC_DATE": "2018-06-20",
      "ROWNUM": "1",
      "GENERAL_SEX": "หญิง",
      "GENERAL_BLEMISH": "แผลเป็นที่นิ้วหัวแม่มือขวา  ขาซ้าย รอยสักไม่มี ไม่พิการ",
      "REL_AMPHUR": "บ้านโป่ง",
      "RACE_NAME": "ไทย",
      "NATIONALITY_NAME": "ไทย",
      "REL_TUMBON": "หนองกบ",
      "PRISON_PROVINCE_NAME": "กาญจนบุรี",
      "CASE_BASE": "1.ฉ้อโกง 2.ฉ้อโกง ",
      "IMAGE": "http://10.14.24.35/correction_ws/correct_image.php?pid=6134001735&tkn=f53b360fed28df6f95e74a3815b11c52938a31dfba8ca8394f0154d9a4d5f3f9&imgType=img",
      "PRISON_LNAME": "ริดแก้ว",
      "HIST_ID_CARD": "3700200446809",
      "DIST_DATE": "2018-06-26",
      "PRISONER_ID": "6134001735",
      "AGE": "52",
      "IMPOSE_END_DATE": "-",
      "PRISON_CODE": "340",
      "REL_ADDR_LINE_1": "199/104",
      "REL_ADDR_LINE_2": "5",
      "PRISON_REGION_CODE": "0",
      "GENERAL_DOB": "1968-11-11",
      "REL_CONTACT_NAME": "นางวันเพ็ญ ถิรปรีดา",
      "DOMICILE_PROVINCE_NAME": "ราชบุรี",
      "FINGER": "http://10.14.24.35/correction_ws/correct_finger.php?pid=6134001735&tkn=f53b360fed28df6f95e74a3815b11c52938a31dfba8ca8394f0154d9a4d5f3f9&imgType=img",
      "PRISON_NAME": "เรือนจำจังหวัดกาญจนบุรี",
      "PRISON_AREA_NAME": "เขต 7",
      "PRISON_FNAME": "สุพาพร",
      "TITLE": "นางสาว",
      "IMPOSE_START_DATE": "-",
      "REL_ADDR_LINE_3": "",
      "REL_PROVINCE": "ราชบุรี",
      "CONTACT_TEL_NO_1": "086-3821264",
      "PUNISHMENT_TYPE": "จำคุก"
      */
}