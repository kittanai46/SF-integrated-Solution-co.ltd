import 'package:json_annotation/json_annotation.dart';

part 'person_nonthai_dto.g.dart';

@JsonSerializable()
class PersonNonThaiDto {
  PersonNonThaiDto({
    this.personalID,
    this.address_houseAlley,
    this.address_houseAlleyWay,
    this.address_houseDistrict,
    this.address_houseNo,
    this.address_houseProvince,
    this.address_houseRoad,
    this.address_houseSubDistrict,
    this.address_houseVillageNo,
    this.blood,
    this.cardExpireDate,
    this.cardIssueDate,
    this.dateOfBirth,
    this.genderText,
    this.nameEN_firstName,
    this.nameEN_lastName,
    this.nameEN_middleName,
    this.nameEN_title,
    this.nameTH_firstName,
    this.nameTH_lastName,
    this.nameTH_middleName,
    this.nameTH_title,
    this.nationalityCode,
    this.nationalityText,

  });

  factory PersonNonThaiDto.fromJson(Map<String, dynamic> json) => _$PersonNonThaiDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonNonThaiDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'address.houseAlley') String? address_houseAlley;
  @JsonKey(name: 'address.houseAlleyWay') String? address_houseAlleyWay;
  @JsonKey(name: 'address.houseDistrict') String? address_houseDistrict;
  @JsonKey(name: 'address.houseNo') String? address_houseNo;
  @JsonKey(name: 'address.houseProvince') String? address_houseProvince;
  @JsonKey(name: 'address.houseRoad') String? address_houseRoad;
  @JsonKey(name: 'address.houseSubDistrict') String? address_houseSubDistrict;
  @JsonKey(name: 'address.houseVillageNo') String? address_houseVillageNo;
  @JsonKey(name: 'blood') String? blood;
  @JsonKey(name: 'cardExpireDate') String? cardExpireDate;
  @JsonKey(name: 'cardIssueDate') String? cardIssueDate;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'genderText') String? genderText;
  @JsonKey(name: 'nameEN.firstName') String? nameEN_firstName;
  @JsonKey(name: 'nameEN.lastName') String? nameEN_lastName;
  @JsonKey(name: 'nameEN.middleName') String? nameEN_middleName;
  @JsonKey(name: 'nameEN.title') String? nameEN_title;
  @JsonKey(name: 'nameTH.firstName') String? nameTH_firstName;
  @JsonKey(name: 'nameTH.lastName') String? nameTH_lastName;
  @JsonKey(name: 'nameTH.middleName') String? nameTH_middleName;
  @JsonKey(name: 'nameTH.title') String? nameTH_title;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityText') String? nationalityText;

}

@JsonSerializable()
class ListPersonNonThaiDto {
  ListPersonNonThaiDto({
    this.status,
    this.data,
  });

  factory ListPersonNonThaiDto.fromJson(Map<String, dynamic> json) => _$ListPersonNonThaiDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPersonNonThaiDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PersonNonThaiDto>? data;
}

class PersonNonThaiConstant {
  PersonNonThaiConstant._();

  static const String m_personalID = 'เลขบัตรประจำตัว';
  static const String m_address_houseAlley = 'ซอย';
  static const String m_address_houseAlleyWay = 'ตรอก';
  static const String m_address_houseDistrict = 'อำเภอ';
  static const String m_address_houseNo = 'บ้านเลขที่';
  static const String m_address_houseProvince = 'จังหวัด';
  static const String m_address_houseRoad = 'ถนน';
  static const String m_address_houseSubDistrict = 'ตำบล';
  static const String m_address_houseVillageNo = 'หมู่ที่';
  static const String m_blood = 'กรุ๊ปเลือด';
  static const String m_cardExpireDate = 'วันที่หมดอายุ';
  static const String m_cardIssueDate = 'วันที่ออกบัตร';
  static const String m_dateOfBirth = 'วันเดือนปีเกิด';
  static const String m_genderText = 'เพศ';
  static const String m_nameEN_firstName = 'ชื่อภาษาอังกฤษ';
  static const String m_nameEN_lastName = 'ชื่อสกุลภาษาอังกฤษ';
  static const String m_nameEN_middleName = 'ชื่อกลางภาษาอังกฤษ';
  static const String m_nameEN_title = 'เพศ';
  static const String m_nameTH_firstName = 'คำนำหน้าชื่อภาษาไทย';
  static const String m_nameTH_lastName = 'ชื่อสกุลภาษาไทย';
  static const String m_nameTH_middleName = 'ชื่อกลางภาษาไทย';
  static const String m_nameTH_title = 'คำนำหน้าชื่อภาษาไทย';
  static const String m_nationalityCode = 'รหัสสัญชาติ';
  static const String m_nationalityText = 'สัญชาติ';

}