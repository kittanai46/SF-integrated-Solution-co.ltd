import 'package:json_annotation/json_annotation.dart';

part 'make_card_lk_dto.g.dart';

@JsonSerializable()
class MakeCardLkDto {
  MakeCardLkDto({
    this.alleyDesc,
    this.alleyWayDesc,
    this.districtDesc,
    this.houseNo,
    this.provinceDesc,
    this.roadDesc,
    this.subdistrictDesc,
    this.villageNo,
    this.birthDate,
    this.blood,
    this.cancelCause,
    this.documentNumber,
    this.expireDate,
    this.foreignCountry,
    this.foreignCountryCity,
    this.issueDate,
    this.issueTime,
    this.firstNameEN,
    this.lastNameEN,
    this.middleNameEN,
    this.titleEN,
    this.firstNameTH,
    this.lastNameTH,
    this.middleNameTH,
    this.titleTH,
    this.religion,
    this.religionOther,
    this.sex,
    this.phoneNumber,
    this.personalID,
  });

  factory MakeCardLkDto.fromJson(Map<String, dynamic> json) => _$MakeCardLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MakeCardLkDtoToJson(this);

  @JsonKey(name: 'address.alleyDesc') String? alleyDesc;
  @JsonKey(name: 'address.alleyWayDesc') String? alleyWayDesc;
  @JsonKey(name: 'address.districtDesc') String? districtDesc;
  @JsonKey(name: 'address.houseNo') String? houseNo;
  @JsonKey(name: 'address.provinceDesc') String? provinceDesc;
  @JsonKey(name: 'address.roadDesc') String? roadDesc;
  @JsonKey(name: 'address.subdistrictDesc') String? subdistrictDesc;
  @JsonKey(name: 'address.villageNo') String? villageNo;
  @JsonKey(name: 'birthDate') String? birthDate;
  @JsonKey(name: 'blood') String? blood;
  @JsonKey(name: 'cancelCause') String? cancelCause;
  @JsonKey(name: 'documentNumber') String? documentNumber;
  @JsonKey(name: 'expireDate') String? expireDate;
  @JsonKey(name: 'foreignCountry') String? foreignCountry;
  @JsonKey(name: 'foreignCountryCity') String? foreignCountryCity;
  @JsonKey(name: 'issueDate') String? issueDate;
  @JsonKey(name: 'issueTime') String? issueTime;
  @JsonKey(name: 'nameEN.firstName') String? firstNameEN;
  @JsonKey(name: 'nameEN.lastName') String? lastNameEN;
  @JsonKey(name: 'nameEN.middleName') String? middleNameEN;
  @JsonKey(name: 'nameEN.title') String? titleEN;
  @JsonKey(name: 'nameTH.firstName') String? firstNameTH;
  @JsonKey(name: 'nameTH.lastName') String? lastNameTH;
  @JsonKey(name: 'nameTH.middleName') String? middleNameTH;
  @JsonKey(name: 'nameTH.title') String? titleTH;
  @JsonKey(name: 'religion') String? religion;
  @JsonKey(name: 'religionOther') String? religionOther;
  @JsonKey(name: 'sex') String? sex;
  @JsonKey(name: 'phoneNumber') String? phoneNumber;
  @JsonKey(name: 'personalID') String? personalID;

}

@JsonSerializable()
class ListMakeCardLkDto {
  ListMakeCardLkDto({
    this.status,
    this.data,
  });

  factory ListMakeCardLkDto.fromJson(Map<String, dynamic> json) => _$ListMakeCardLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListMakeCardLkDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<MakeCardLkDto>? data;
}

class MakeCardLkConstant {
  MakeCardLkConstant._();

  static const String m_alleyDesc = 'ซอย (ณ วันทําบัตร)';
  static const String m_alleyWayDesc = 'ตรอก (ณ วันทําบัตร)';
  static const String m_districtDesc = 'อําเภอ (ณ วันทําบัตร)';
  static const String m_houseNo = 'บ้านเลขที่ (ณ วันทําบัตร)';
  static const String m_provinceDesc = 'จังหวัด (ณ วันทําบัตร)';
  static const String m_roadDesc = 'ถนน (ณ วันทําบัตร)';
  static const String m_subdistrictDesc = 'ตําบล (ณ วันทําบัตร)';
  static const String m_villageNo = 'หมู่ที่ (ณ วันทําบัตร)';
  static const String m_birthDate = 'วันเดือนปี เกิด';
  static const String m_blood = 'หมู่โลหิต';
  static const String m_cancelCause = 'สาเหตุการยกเลิกบัตร';
  static const String m_documentNumber = 'เลขคำขอมีบัตร (บป.1)';
  static const String m_expireDate = 'วันเดือนปี บัตรหมดอายุ';
  static const String m_foreignCountry = 'ประเทศ (กรณีอยู่ต่างประเทศ)';
  static const String m_foreignCountryCity = 'เมือง (กรณีอยู่ต่างประเทศ)';
  static const String m_issueDate = 'วันเดือนปี ที่ออกบัตร';
  static const String m_issueTime = 'เวลา ที่ออกบัตร';
  static const String m_firstNameEN = 'ชื่อตัว (ภาษาอังกฤษ)';
  static const String m_lastNameEN = 'ชื่อสกุล (ภาษาอังกฤษ)';
  static const String m_middleNameEN = 'ชื่อกลาง (ภาษาอังกฤษ)';
  static const String m_titleEN = 'คำนำหน้านาม (ภาษาอังกฤษ)';
  static const String m_firstNameTH = 'ชื่อตัว (ภาษาไทย)';
  static const String m_lastNameTH = 'ชื่อสกุล (ภาษาไทย)';
  static const String m_middleNameTH = 'ชื่อกลาง (ภาษาไทย)';
  static const String m_titleTH = 'คำนำหน้านาม (ภาษาไทย)';
  static const String m_religion = 'ศาสนา';
  static const String m_religionOther = 'ศาสนา(อื่นๆ)';
  static const String m_sex = 'เพศ';
  static const String m_phoneNumber = 'เบอร์โทรศัพท์';
  static const String m_personalID = 'เลขประจำตัวประชาชน';
  
}