import 'package:json_annotation/json_annotation.dart';

part 'person_noregis_dto.g.dart';

@JsonSerializable()
class PersonNoRegisDto {
  PersonNoRegisDto({
    this.personalID,
    this.address_houseAlley,
    this.address_houseAlleyWay,
    this.address_houseDistrict,
    this.address_houseNo,
    this.address_houseProvince,
    this.address_houseRoad,
    this.address_houseSubDistrict,
    this.address_houseVillageNo,
    this.cardExpireDate,
    this.cardIssueDate,
    this.dateOfBirth,
    this.firstName,
    this.genderText,
    this.lastName,
    this.nationalityCode,
    this.nationalityText,
    this.title,
  });

  factory PersonNoRegisDto.fromJson(Map<String, dynamic> json) => _$PersonNoRegisDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonNoRegisDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'address.houseAlley') String? address_houseAlley;
  @JsonKey(name: 'address.houseAlleyWay') String? address_houseAlleyWay;
  @JsonKey(name: 'address.houseDistrict') String? address_houseDistrict;
  @JsonKey(name: 'address.houseNo') String? address_houseNo;
  @JsonKey(name: 'address.houseProvince') String? address_houseProvince;
  @JsonKey(name: 'address.houseRoad') String? address_houseRoad;
  @JsonKey(name: 'address.houseSubDistrict') String? address_houseSubDistrict;
  @JsonKey(name: 'address.houseVillageNo') String? address_houseVillageNo;
  @JsonKey(name: 'cardExpireDate') String? cardExpireDate;
  @JsonKey(name: 'cardIssueDate') String? cardIssueDate;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'genderText') String? genderText;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityText') String? nationalityText;
  @JsonKey(name: 'title') String? title;

}

@JsonSerializable()
class ListPersonNoRegisDto {
  ListPersonNoRegisDto({
    this.status,
    this.data,
  });

  factory ListPersonNoRegisDto.fromJson(Map<String, dynamic> json) => _$ListPersonNoRegisDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPersonNoRegisDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PersonNoRegisDto>? data;
}

class PersonNoRegisConstant {
  PersonNoRegisConstant._();

  static const String m_personalID = 'เลขบัตรประจำตัว';
  static const String m_address_houseAlley = 'ซอย';
  static const String m_address_houseAlleyWay = 'ตรอก';
  static const String m_address_houseDistrict = 'อำเภอ';
  static const String m_address_houseNo = 'บ้านเลขที่';
  static const String m_address_houseProvince = 'จังหวัด';
  static const String m_address_houseRoad = 'ถนน';
  static const String m_address_houseSubDistrict = 'ตำบล';
  static const String m_address_houseVillageNo = 'หมู่ที่';
  static const String m_cardExpireDate = 'วันที่หมดอายุ';
  static const String m_cardIssueDate = 'วันที่ออกบัตร';
  static const String m_dateOfBirth = 'วันเดือนปีเกิด';
  static const String m_firstName = 'ชื่อ';
  static const String m_genderText = 'เพศ';
  static const String m_lastName = 'ชื่อสกุล';
  static const String m_nationalityCode = 'รหัสสัญชาติ';
  static const String m_nationalityText = 'สัญชาติ';
  static const String m_title = 'คำนำหน้านาม';

}