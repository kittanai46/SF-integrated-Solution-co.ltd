import 'package:json_annotation/json_annotation.dart';

part 'extension_dto.g.dart';

@JsonSerializable()
class ExtensionDto {
  ExtensionDto({
    this.passportno,
    this.tm6no,
    this.documentno,
    this.firstname,
    this.middlename,
    this.surname,
    this.gender,
    this.dob,
    this.birthplace,
    this.nationality,
    this.countryNameEn,
    this.countryNameTh,
    this.issueDate,
    this.expiryDate,
    this.inDate,
    this.extDate,
    this.extDay,
    this.flightno,
    this.visaDesc,
    this.visaExpiryDate,
    this.building,
    this.address,
    this.road,
    this.province,
    this.district,
    this.subdistrict,
    this.postcode,
    this.tel,
    this.permitDate,
    this.reference,
    this.reason,
    this.imgpass,
    this.livephoto,
  });

  factory ExtensionDto.fromJson(Map<String, dynamic> json) => _$ExtensionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExtensionDtoToJson(this);

  @JsonKey(name: 'passportno') String? passportno;
  @JsonKey(name: 'tm6no') String? tm6no;
  @JsonKey(name: 'documentno') String? documentno;
  @JsonKey(name: 'firstname') String? firstname;
  @JsonKey(name: 'middlename') String? middlename;
  @JsonKey(name: 'surname') String? surname;
  @JsonKey(name: 'gender') String? gender;
  @JsonKey(name: 'dob') String? dob;
  @JsonKey(name: 'birthplace') String? birthplace;
  @JsonKey(name: 'nationality') String? nationality;
  @JsonKey(name: 'country_name_en') String? countryNameEn;
  @JsonKey(name: 'country_name_th') String? countryNameTh;
  @JsonKey(name: 'issue_date') String? issueDate;
  @JsonKey(name: 'expiry_date') String? expiryDate;
  @JsonKey(name: 'in_date') String? inDate;
  @JsonKey(name: 'ext_date') String? extDate;
  @JsonKey(name: 'ext_day') String? extDay;
  @JsonKey(name: 'flightno') String? flightno;
  @JsonKey(name: 'visa_desc') String? visaDesc;
  @JsonKey(name: 'visa_expiry_date') String? visaExpiryDate;
  @JsonKey(name: 'building') String? building;
  @JsonKey(name: 'address') String? address;
  @JsonKey(name: 'road') String? road;
  @JsonKey(name: 'province') String? province;
  @JsonKey(name: 'district') String? district;
  @JsonKey(name: 'subdistrict') String? subdistrict;
  @JsonKey(name: 'postcode') String? postcode;
  @JsonKey(name: 'tel') String? tel;
  @JsonKey(name: 'permit_date') String? permitDate;
  @JsonKey(name: 'reference') String? reference;
  @JsonKey(name: 'reason') String? reason;
  @JsonKey(name: 'imgpass') String? imgpass;
  @JsonKey(name: 'livephoto') String? livephoto;
}

@JsonSerializable()
class ListExtensionDto {
  ListExtensionDto({
    this.status,
    this.data,
  });

  factory ListExtensionDto.fromJson(Map<String, dynamic> json) => _$ListExtensionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListExtensionDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<ExtensionDto>? data;
}

class ExtensionConstant {
  ExtensionConstant._();

  static const String m_passportno = 'หมายเลขพาสปอร์ต';
  static const String m_tm6no = 'เลขบัตร ตม.6';
  static const String m_documentno = 'หมายเลขเอกสาร';
  static const String m_firstname = 'ชื่อตัวภาษาอังกฤษ';
  static const String m_middlename = 'ชื่อรองภาษาอังกฤษ';
  static const String m_surname = 'ชื่อสกุลภาษาอังกฤษ';
  static const String m_gender = 'เพศ';
  static const String m_dob = 'วันเกิด';
  static const String m_birthplace = 'สถานที่เกิด';
  static const String m_nationality = 'สัญชาติ';
  static const String m_country_name_en = 'ชื่อสัญชาติ(EN)';
  static const String m_country_name_th = 'ชื่อสัญชาติ(TH)';
  static const String m_issue_date = 'วันที่ออกหนังสือเดินทาง';
  static const String m_expiry_date = 'วันที่หมดอายุหนังสือเดินทาง';
  static const String m_in_date = 'วันที่เดินทาง';
  static const String m_ext_date = 'วันที่รับเรื่องขออยู่ต่อ';
  static const String m_ext_day = 'จำนวนวันที่ขออยู่ต่อ';
  static const String m_flightno = 'เลขที่ยานพาหนะ';
  static const String m_visa_desc = 'ประเภทการตรวจลงตรา';
  static const String m_visa_expiry_date = 'วันหมดอายุของ VISA';
  static const String m_building = 'อาคาร';
  static const String m_address = 'ที่อยู่';
  static const String m_road = 'ถนน';
  static const String m_province = 'จังหวัด';
  static const String m_district = 'อำเภอ';
  static const String m_subdistrict = 'ตำบล';
  static const String m_postcode = 'รหัสไปรษีย์';
  static const String m_tel = 'หมายเลขโทรศัพท์';
  static const String m_permit_date = 'วันครบกำหนดอนุญาตขออยู่ต่อ';
  static const String m_reference = 'บุคคลอ้างอิง';
  static const String m_reason = 'เหตุผล';
  static const String m_imgpass = 'รูปภาพหนังสือเดินทาง';
  static const String m_livephoto = 'รูปภาพผู้ขออยู่ต่อ';
}