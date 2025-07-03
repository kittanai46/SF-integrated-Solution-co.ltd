import 'package:json_annotation/json_annotation.dart';

part 'alien_worker_dto.g.dart';

@JsonSerializable()
class AlienWorkerDto {
  AlienWorkerDto({
    this.personalID,
    this.address_alleyDesc,
    this.address_alleyWayDesc,
    this.address_ccaattmm,
    this.address_districtDesc,
    this.address_houseID,
    this.address_houseNo,
    this.address_provinceDesc,
    this.address_roadDesc,
    this.address_subdistrictDesc,
    this.address_villageNo,
    this.cardExpireDate,
    this.cardIssueDate,
    this.dateOfBirth,
    this.englishName,
    this.entrepreneurAddress_alleyDesc,
    this.entrepreneurAddress_alleyWayDesc,
    this.entrepreneurAddress_ccaattmm,
    this.entrepreneurAddress_districtDesc,
    this.entrepreneurAddress_houseID,
    this.entrepreneurAddress_houseNo,
    this.entrepreneurAddress_provinceDesc,
    this.entrepreneurAddress_roadDesc,
    this.entrepreneurAddress_subdistrictDesc,
    this.entrepreneurAddress_villageNo,
    this.entrepreneurId,
    this.entrepreneurName,
    this.firstName,
    this.genderCode,
    this.genderText,
    this.healthCareProvider,
    this.healthCareResult,
    this.lastName,
    this.nationalityCode,
    this.nationalityDesc,
    this.occupationCode,
    this.occupationDesc,
    this.occupationTypeCode,
    this.occupationTypeDesc,
    this.titleCode,
    this.titleDesc,
    this.workPerminExpireDate,
    this.workPermitIssueDate,
    this.workPlaceAddress_alleyDesc,
    this.workPlaceAddress_alleyWayDesc,
    this.workPlaceAddress_ccaattmm,
    this.workPlaceAddress_districtDesc,
    this.workPlaceAddress_houseID,
    this.workPlaceAddress_houseNo,
    this.workPlaceAddress_provinceDesc,
    this.workPlaceAddress_roadDesc,
    this.workPlaceAddress_subdistrictDesc,
    this.workPlaceAddress_villageNo,
    this.workPlaceDescription,

  });

  factory AlienWorkerDto.fromJson(Map<String, dynamic> json) => _$AlienWorkerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AlienWorkerDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'address.alleyDesc') String? address_alleyDesc;
  @JsonKey(name: 'address.alleyWayDesc') String? address_alleyWayDesc;
  @JsonKey(name: 'address.ccaattmm') String? address_ccaattmm;
  @JsonKey(name: 'address.districtDesc') String? address_districtDesc;
  @JsonKey(name: 'address.houseID') String? address_houseID;
  @JsonKey(name: 'address.houseNo') String? address_houseNo;
  @JsonKey(name: 'address.provinceDesc') String? address_provinceDesc;
  @JsonKey(name: 'address.roadDesc') String? address_roadDesc;
  @JsonKey(name: 'address.subdistrictDesc') String? address_subdistrictDesc;
  @JsonKey(name: 'address.villageNo') String? address_villageNo;
  @JsonKey(name: 'cardExpireDate') String? cardExpireDate;
  @JsonKey(name: 'cardIssueDate') String? cardIssueDate;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'englishName') String? englishName;
  @JsonKey(name: 'entrepreneurAddress.alleyDesc') String? entrepreneurAddress_alleyDesc;
  @JsonKey(name: 'entrepreneurAddress.alleyWayDesc') String? entrepreneurAddress_alleyWayDesc;
  @JsonKey(name: 'entrepreneurAddress.ccaattmm') String? entrepreneurAddress_ccaattmm;
  @JsonKey(name: 'entrepreneurAddress.districtDesc') String? entrepreneurAddress_districtDesc;
  @JsonKey(name: 'entrepreneurAddress.houseID') String? entrepreneurAddress_houseID;
  @JsonKey(name: 'entrepreneurAddress.houseNo') String? entrepreneurAddress_houseNo;
  @JsonKey(name: 'entrepreneurAddress.provinceDesc') String? entrepreneurAddress_provinceDesc;
  @JsonKey(name: 'entrepreneurAddress.roadDesc') String? entrepreneurAddress_roadDesc;
  @JsonKey(name: 'entrepreneurAddress.subdistrictDesc') String? entrepreneurAddress_subdistrictDesc;
  @JsonKey(name: 'entrepreneurAddress.villageNo') String? entrepreneurAddress_villageNo;
  @JsonKey(name: 'entrepreneurId') String? entrepreneurId;
  @JsonKey(name: 'entrepreneurName') String? entrepreneurName;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'genderCode') String? genderCode;
  @JsonKey(name: 'genderText') String? genderText;
  @JsonKey(name: 'healthCareProvider') String? healthCareProvider;
  @JsonKey(name: 'healthCareResult') String? healthCareResult;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityDesc') String? nationalityDesc;
  @JsonKey(name: 'occupationCode') String? occupationCode;
  @JsonKey(name: 'occupationDesc') String? occupationDesc;
  @JsonKey(name: 'occupationTypeCode') String? occupationTypeCode;
  @JsonKey(name: 'occupationTypeDesc') String? occupationTypeDesc;
  @JsonKey(name: 'titleCode') String? titleCode;
  @JsonKey(name: 'titleDesc') String? titleDesc;
  @JsonKey(name: 'workPerminExpireDate') String? workPerminExpireDate;
  @JsonKey(name: 'workPermitIssueDate') String? workPermitIssueDate;
  @JsonKey(name: 'workPlaceAddress.alleyDesc') String? workPlaceAddress_alleyDesc;
  @JsonKey(name: 'workPlaceAddress.alleyWayDesc') String? workPlaceAddress_alleyWayDesc;
  @JsonKey(name: 'workPlaceAddress.ccaattmm') String? workPlaceAddress_ccaattmm;
  @JsonKey(name: 'workPlaceAddress.districtDesc') String? workPlaceAddress_districtDesc;
  @JsonKey(name: 'workPlaceAddress.houseID') String? workPlaceAddress_houseID;
  @JsonKey(name: 'workPlaceAddress.houseNo') String? workPlaceAddress_houseNo;
  @JsonKey(name: 'workPlaceAddress.provinceDesc') String? workPlaceAddress_provinceDesc;
  @JsonKey(name: 'workPlaceAddress.roadDesc') String? workPlaceAddress_roadDesc;
  @JsonKey(name: 'workPlaceAddress.subdistrictDesc') String? workPlaceAddress_subdistrictDesc;
  @JsonKey(name: 'workPlaceAddress.villageNo') String? workPlaceAddress_villageNo;
  @JsonKey(name: 'workPlaceDescription') String? workPlaceDescription;

}

@JsonSerializable()
class ListAlienWorkerDto {
  ListAlienWorkerDto({
    this.status,
    this.data,
  });

  factory ListAlienWorkerDto.fromJson(Map<String, dynamic> json) => _$ListAlienWorkerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListAlienWorkerDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<AlienWorkerDto>? data;
}

class AlienWorkerConstant {
  AlienWorkerConstant._();

  static const String m_personalID = 'เลขประจำตัวคนต่างด้าว';
  static const String m_address_alleyDesc = 'ซอย';
  static const String m_address_alleyWayDesc = 'ตรอก';
  static const String m_address_ccaattmm = 'รหัสจังหวัดอำเภอตำบลหมู่';
  static const String m_address_districtDesc = 'อำเภอ';
  static const String m_address_houseID = 'เลขรหัสประจำบ้าน';
  static const String m_address_houseNo = 'บ้านเลขที่';
  static const String m_address_provinceDesc = 'จังหวัด';
  static const String m_address_roadDesc = 'ถนน';
  static const String m_address_subdistrictDesc = 'ตำบล';
  static const String m_address_villageNo = 'หมู่ที่';
  static const String m_cardExpireDate = 'วันที่หมดอายุ';
  static const String m_cardIssueDate = 'วันที่ออกบัตร';
  static const String m_dateOfBirth = 'วันเดือนปีเกิด';
  static const String m_englishName = 'ชื่อภาษาอังกฤษ';
  static const String m_entrepreneurAddress_alleyDesc = 'ซอย';  //ซอยของบ้านนายจ้าง
  static const String m_entrepreneurAddress_alleyWayDesc = 'ตรอก';  //ตรอกของบ้านนายจ้าง
  static const String m_entrepreneurAddress_ccaattmm = 'รหัสจังหวัดอำเภอตำบลหมู่บ้านนายจ้าง';
  static const String m_entrepreneurAddress_districtDesc = 'อำเภอ'; //อำเภอของบ้านนายจ้าง
  static const String m_entrepreneurAddress_houseID = 'เลขรหัสประจำบ้าน'; //เลขรหัสประจำบ้านนายจ้าง
  static const String m_entrepreneurAddress_houseNo = 'บ้านเลขที่'; //บ้านเลขที่นายจ้าง
  static const String m_entrepreneurAddress_provinceDesc = 'จังหวัด'; //จังหวัดของบ้านนายจ้าง
  static const String m_entrepreneurAddress_roadDesc = 'ถนน'; //ถนนของบ้านนายจ้าง
  static const String m_entrepreneurAddress_subdistrictDesc = 'ตำบล'; //ตำบลของบ้านนายจ้าง
  static const String m_entrepreneurAddress_villageNo = 'หมู่'; //หมู่ของบ้านนายจ้าง
  static const String m_entrepreneurId = 'เลขประจำตัวนายจ้าง';
  static const String m_entrepreneurName = 'ชื่อนายจ้าง';
  static const String m_firstName = 'ชื่อ';
  static const String m_genderCode = 'รหัสเพศ';
  static const String m_genderText = 'เพศ';
  static const String m_healthCareProvider = 'โรงพยาบาลที่มีสิทธิการรักษาพยาบาล';
  static const String m_healthCareResult = 'ผลการตรวจสุขภาพ (P-ผ่าน, N-ไม่ผ่าน)';
  static const String m_lastName = 'ชื่อสกุล';
  static const String m_nationalityCode = 'รหัสสัญชาติ';
  static const String m_nationalityDesc = 'สัญชาติ';
  static const String m_occupationCode = 'รหัสอาชีพ';
  static const String m_occupationDesc = 'อาชีพ';
  static const String m_occupationTypeCode = 'รหัสประเภทกิจการ';
  static const String m_occupationTypeDesc = 'ประเภทกิจการ';
  static const String m_titleCode = 'รหัสคำนำหน้านาม';
  static const String m_titleDesc = 'คำนำหน้านาม';
  static const String m_workPerminExpireDate = 'วันที่หมดอายุใบอนุญาตทำงาน';
  static const String m_workPermitIssueDate = 'วันที่ออกใบอนุญาตทำงาน';
  static const String m_workPlaceAddress_alleyDesc = 'ซอย';   //ชื่อซอยสถานที่ทำงาน
  static const String m_workPlaceAddress_alleyWayDesc = 'ตรอก';   //ชื่อตรอกสถานที่ทำงาน
  static const String m_workPlaceAddress_ccaattmm = 'รหัสจังหวัดอำเภอตำบลหมู่ที่ทำงาน';
  static const String m_workPlaceAddress_districtDesc = 'อำเภอ';   //ชื่อตรอกสถานที่ชื่ออำเภอสถานที่ทำงาน
  static const String m_workPlaceAddress_houseID = 'เลขรหัสประจำบ้าน';   //เลขรหัสประจำบ้านสถานที่ทำงาน
  static const String m_workPlaceAddress_houseNo = 'บ้านเลขที่';   //บ้านเลขที่สถานที่ทำงาน
  static const String m_workPlaceAddress_provinceDesc = 'จังหวัด';   //ชื่อจังหวัดสถานที่ทำงาน
  static const String m_workPlaceAddress_roadDesc = 'ถนน';   //ชื่อถนนสถานที่ทำงาน
  static const String m_workPlaceAddress_subdistrictDesc = 'ตำบล';   //ชื่อตำบลสถานที่ทำงาน
  static const String m_workPlaceAddress_villageNo = 'หมู่ที่';   //หมู่ที่สถานที่ทำงาน
  static const String m_workPlaceDescription = 'ชื่อสถานประกอบการกรณีไม่มีเลขรหัสประจำบ้าน';   //ชื่อสถานประกอบการกรณีไม่มีเลขรหัสประจำบ้าน

}