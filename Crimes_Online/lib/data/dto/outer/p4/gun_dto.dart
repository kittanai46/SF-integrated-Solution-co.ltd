import 'package:json_annotation/json_annotation.dart';

part 'gun_dto.g.dart';

@JsonSerializable()
class GunDto {
  GunDto({
    this.docDate,
    this.docPlaceDesc,
    this.docPlaceProvince,
    this.docID,
    this.expireDate,
    this.applicantType,
    this.signTitleDesc,
    this.signFullName,
    this.gunRegistrationId,
    this.gunSerialNo,
    this.gunType,
    this.gunCharacteristic,
    this.gunSize,
    this.gunProduct,
    this.remark,
    this.personalId,
    this.titleDesc,
    this.firstName,
    this.middleName,
    this.lastName,
    this.genderDesc,
    this.fullNameAndRank,
    this.hid,
    this.hidRcodeDesc,
    this.hno,
    this.trok,
    this.soi,
    this.thanon,
    this.districtDesc,
    this.amphorDesc,
    this.provinceDesc,
    this.personalId2,
    this.titleDesc2,
    this.firstName2,
    this.middleName2,
    this.lastName2,
    this.fullNameAndRank2,
    this.genderDesc2,
    this.businessType,
    this.businessName,
    this.hid2,
    this.hidRcodeDesc2,
    this.hno2,
    this.trok2,
    this.soi2,
    this.thanon2,
    this.districtDesc2,
    this.amphorDesc2,
    this.provinceDesc2,
  });

  factory GunDto.fromJson(Map<String, dynamic> json) => _$GunDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GunDtoToJson(this);

  @JsonKey(name: 'docDate') String? docDate;
  @JsonKey(name: 'docPlaceDesc') String? docPlaceDesc;
  @JsonKey(name: 'docPlaceProvince') String? docPlaceProvince;
  @JsonKey(name: 'docID') String? docID;
  @JsonKey(name: 'expireDate') String? expireDate;
  @JsonKey(name: 'applicantType') String? applicantType;
  @JsonKey(name: 'signTitleDesc') String? signTitleDesc;
  @JsonKey(name: 'signFullName') String? signFullName;
  @JsonKey(name: 'gunRegistrationId') String? gunRegistrationId;
  @JsonKey(name: 'gunSerialNo') String? gunSerialNo;
  @JsonKey(name: 'gunType') String? gunType;
  @JsonKey(name: 'gunCharacteristic') String? gunCharacteristic;
  @JsonKey(name: 'gunSize') String? gunSize;
  @JsonKey(name: 'gunProduct') String? gunProduct;
  @JsonKey(name: 'remark') String? remark;
  @JsonKey(name: 'personalId') String? personalId;
  @JsonKey(name: 'titleDesc') String? titleDesc;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'middleName') String? middleName;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  @JsonKey(name: 'fullNameAndRank') String? fullNameAndRank;
  @JsonKey(name: 'hid') String? hid;
  @JsonKey(name: 'hidRcodeDesc') String? hidRcodeDesc;
  @JsonKey(name: 'hno') String? hno;
  @JsonKey(name: 'trok') String? trok;
  @JsonKey(name: 'soi') String? soi;
  @JsonKey(name: 'thanon') String? thanon;
  @JsonKey(name: 'districtDesc') String? districtDesc;
  @JsonKey(name: 'amphorDesc') String? amphorDesc;
  @JsonKey(name: 'provinceDesc') String? provinceDesc;
  @JsonKey(name: 'personalId2') String? personalId2;
  @JsonKey(name: 'titleDesc2') String? titleDesc2;
  @JsonKey(name: 'firstName2') String? firstName2;
  @JsonKey(name: 'middleName2') String? middleName2;
  @JsonKey(name: 'lastName2') String? lastName2;
  @JsonKey(name: 'fullNameAndRank2') String? fullNameAndRank2;
  @JsonKey(name: 'genderDesc2') String? genderDesc2;
  @JsonKey(name: 'businessType') String? businessType;
  @JsonKey(name: 'businessName') String? businessName;
  @JsonKey(name: 'hid2') String? hid2;
  @JsonKey(name: 'hidRcodeDesc2') String? hidRcodeDesc2;
  @JsonKey(name: 'hno2') String? hno2;
  @JsonKey(name: 'trok2') String? trok2;
  @JsonKey(name: 'soi2') String? soi2;
  @JsonKey(name: 'thanon2') String? thanon2;
  @JsonKey(name: 'districtDesc2') String? districtDesc2;
  @JsonKey(name: 'amphorDesc2') String? amphorDesc2;
  @JsonKey(name: 'provinceDesc2') String? provinceDesc2;

}

@JsonSerializable()
class ListGunDto {
  ListGunDto({
    this.status,
    this.data,
  });

  factory ListGunDto.fromJson(Map<String, dynamic> json) => _$ListGunDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListGunDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<GunDto>? data;
}

class GunConstant {
  GunConstant._();

  static const String m_docDate = 'วัน เดือน ปีที่ออกใบอนุญาต';
  static const String m_docPlaceDesc = 'สำนักทะเบียนที่ออกใบอนุญาต / ใบแทน';
  static const String m_docPlaceProvince = 'จังหวัดที่ออกใบอนุญาต / ใบแทน';
  static const String m_docID = 'เลขที่ใบอนุญาต';
  static const String m_expireDate = 'วัน เดือน ปีที่ใบอนุญาต สิ้นอายุ';
  static const String m_applicantType = 'ประเภทผู้ยื่นคำร้อง';
  static const String m_signTitleDesc = 'คำนำหน้านามผู้ลงนามใบอนุญาต';
  static const String m_signFullName = 'ชื่อนามสกุลผู้ลงนามใบอนุญาต';
  static const String m_gunRegistrationId = 'เครื่องหมายทะเบียนปืน';
  static const String m_gunSerialNo = 'เลขหมายประจำปืน';
  static const String m_gunType = 'ประเภทอาวุธ';
  static const String m_gunCharacteristic = 'ชนิดอาวุธปืน';
  static const String m_gunSize = 'ขนาดอาวุธปืน';
  static const String m_gunProduct = 'ผู้ผลิต';
  static const String m_remark = 'หมายเหตุ';
  static const String m_personalId = 'เลขประจำตัวประชาชนผู้รับใบอนุญาต';
  static const String m_titleDesc = 'คำนำหน้าชื่อ';
  static const String m_firstName = 'ชื่อตัว';
  static const String m_middleName = 'ชื่อกลาง';
  static const String m_lastName = 'ชื่อสกุล';
  static const String m_genderDesc = 'เพศผู้ขอใบอนุญาต';
  static const String m_fullNameAndRank = 'ชื่อเต็มผู้ขอใบอนุญาต';
  static const String m_hid = 'เลขรหัสประจำบ้านผู้รับใบอนุญาต';
  static const String m_hidRcodeDesc = 'สนท. ตามที่อยู่';
  static const String m_hno = 'บ้านเลขที่ ตามที่อยู่';
  static const String m_trok = 'ตรอก ตามที่อยู่';
  static const String m_soi = 'ซอย ตามที่อยู่';
  static const String m_thanon = 'ถนน ตามที่อยู่';
  static const String m_districtDesc = 'ตำบล ตามที่อยู่';
  static const String m_amphorDesc = 'อำเภอ ตามที่อยู่';
  static const String m_provinceDesc = 'จังหวัด ตามที่อยู่';
  static const String m_personalId2 = 'เลขประจำตัวประชาชนตัวแทนนิติบุคคล คนที่ 2';
  static const String m_titleDesc2 = 'คำนำหน้านาม คนที่ 2';
  static const String m_firstName2 = 'ชื่อตัว คนที่ 2';
  static const String m_middleName2 = 'ชื่อกลาง คนที่ 2';
  static const String m_lastName2 = 'ชื่อสกุล คนที่ 2';
  static const String m_fullNameAndRank2 = 'ชื่อเต็มผู้รับใบอนุญาต คนที่ 2';
  static const String m_genderDesc2 = 'เพศผู้รับใบอนุญาต คนที่ 2';
  static const String m_businessType = 'ประเภทนิติบุคคล';
  static const String m_businessName = 'ชื่อนิติบุคคล';
  static const String m_hid2 = 'เลขรหัสประจำบ้านผู้รับใบอนุญาต คนที่ 2';
  static const String m_hidRcodeDesc2 = 'สนท. ตามที่อยู่ คนที่ 2';
  static const String m_hno2 = 'บ้านเลขที่ ตามที่อยู่ คนที่ 2';
  static const String m_trok2 = 'ตรอก ตามที่อยู่ คนที่ 2';
  static const String m_soi2 = 'ซอย ตามที่อยู่ คนที่ 2';
  static const String m_thanon2 = 'ถนน ตามที่อยู่ คนที่ 2';
  static const String m_districtDesc2 = 'ตำบล ตามที่อยู่ คนที่ 2';
  static const String m_amphorDesc2 = 'อำเภอ ตามที่อยู่ คนที่ 2';
  static const String m_provinceDesc2 = 'จังหวัด ตามที่อยู่ คนที่ 2';
}