import 'package:json_annotation/json_annotation.dart';

part 'hospital_dto.g.dart';

@JsonSerializable()
class HospitalDto {
  HospitalDto({
    this.activeStatus,
    this.activeStatusDesc,
    this.empBirthDate,
    this.expirationDate,
    this.firstName,
    this.gender,
    this.genderDesc,
    this.idDesc,
    this.idType,
    this.lastName,
    this.ssoNum,
    this.titleCode,
    this.titleCodeDesc,
    this.hospitalCode,
    this.hospitalName,
    this.medYY,
    this.mselExpireDate,
    this.mselLastChange,
    this.mselStartDate,
    this.mselStatus,
    this.mselStatusDesc,
    this.ssoBranchCode,
    this.ssoBranchName,
  });

  factory HospitalDto.fromJson(Map<String, dynamic> json) => _$HospitalDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalDtoToJson(this);

  @JsonKey(name: 'activeStatus') String? activeStatus;
  @JsonKey(name: 'activeStatusDesc') String? activeStatusDesc;
  @JsonKey(name: 'empBirthDate') String? empBirthDate;
  @JsonKey(name: 'expirationDate') String? expirationDate;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'gender') String? gender;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  @JsonKey(name: 'idDesc') String? idDesc;
  @JsonKey(name: 'idType') String? idType;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'ssoNum') String? ssoNum;
  @JsonKey(name: 'titleCode') String? titleCode;
  @JsonKey(name: 'titleCodeDesc') String? titleCodeDesc;
  @JsonKey(name: 'hospitalCode') String? hospitalCode;
  @JsonKey(name: 'hospitalName') String? hospitalName;
  @JsonKey(name: 'medYY') String? medYY;
  @JsonKey(name: 'mselExpireDate') String? mselExpireDate;
  @JsonKey(name: 'mselLastChange') String? mselLastChange;
  @JsonKey(name: 'mselStartDate') String? mselStartDate;
  @JsonKey(name: 'mselStatus') String? mselStatus;
  @JsonKey(name: 'mselStatusDesc') String? mselStatusDesc;
  @JsonKey(name: 'ssoBranchCode') String? ssoBranchCode;
  @JsonKey(name: 'ssoBranchName') String? ssoBranchName;

}

@JsonSerializable()
class ListHospitalDto {
  ListHospitalDto({
    this.status,
    this.data,
  });

  factory ListHospitalDto.fromJson(Map<String, dynamic> json) => _$ListHospitalDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListHospitalDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<HospitalDto>? data;
}

class HospitalConstant {
  HospitalConstant._();

  static const String m_activeStatus = 'รหัสสถานะผู้ประกันตน';
  static const String m_activeStatusDesc = 'สถานะผู้ประกันตน';
  static const String m_empBirthDate = 'วันเกิด';
  static const String m_expirationDate = 'วันที่มรณะ';
  static const String m_firstName = 'ชื่อ';
  static const String m_gender = 'รหัสเพศ';
  static const String m_genderDesc = 'เพศ';
  static const String m_idDesc = 'ประเภทบัตร';
  static const String m_idType = 'รหัสประเภทบัตร';
  static const String m_lastName = 'นามสกุล';
  static const String m_ssoNum = 'เลขที่บัตร';
  static const String m_titleCode = 'รหัสคำนำหน้าชื่อ';
  static const String m_titleCodeDesc = 'คำนำหน้าชื่อ';
  static const String m_hospitalCode = 'รหัสสถานพยาบาล';
  static const String m_hospitalName = 'สถานพยาบาล';
  static const String m_medYY = 'ปีที่เลือก รพ';
  static const String m_mselExpireDate = 'บัตรหมดอายุ';
  static const String m_mselLastChange = 'เปลี่ยนแปลงครั้งสุดท้าย';
  static const String m_mselStartDate = 'วันออกบัตร';
  static const String m_mselStatus = 'รหัสสถานการอนุมัติ';
  static const String m_mselStatusDesc = 'สถานะการอนุมัติ';
  static const String m_ssoBranchCode = 'รหัสสปส.รับผิดชอบ';
  static const String m_ssoBranchName = 'สปส.รับผิดชอบ';
}