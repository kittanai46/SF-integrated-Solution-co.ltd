import 'package:json_annotation/json_annotation.dart';

part 'move_lk_dto.g.dart';

@JsonSerializable()
class MoveLkDto {
  MoveLkDto({
    this.description,
    this.documentNo,
    this.alleyDesc,
    this.alleyWayDesc,
    this.districtDesc,
    this.houseNo,
    this.provinceDesc,
    this.roadDesc,
    this.subdistrictDesc,
    this.villageNo,
    this.houseID,
    this.houseOwner,
    this.moveDate,
    this.rcodeCode,
    this.rcodeDesc,
    this.oldDateMoveIn,
    this.dateOfBirth,
    this.fatherName,
    this.fatherNationalityDesc,
    this.fatherPersonalID,
    this.firstName,
    this.gender,
    this.lastName,
    this.middleName,
    this.motherName,
    this.motherNationalityDesc,
    this.motherPersonalID,
    this.nationalityDesc,
    this.personalID,
    this.titleDesc,
    this.petitionNo,
    this.terminateDate,
    this.type,
  });

  factory MoveLkDto.fromJson(Map<String, dynamic> json) => _$MoveLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MoveLkDtoToJson(this);

  @JsonKey(name: 'move.description') String? description;
  @JsonKey(name: 'move.documentNo') String? documentNo;
  @JsonKey(name: 'move.house.address.alleyDesc') String? alleyDesc;
  @JsonKey(name: 'move.house.address.alleyWayDesc') String? alleyWayDesc;
  @JsonKey(name: 'move.house.address.districtDesc') String? districtDesc;
  @JsonKey(name: 'move.house.address.houseNo') String? houseNo;
  @JsonKey(name: 'move.house.address.provinceDesc') String? provinceDesc;
  @JsonKey(name: 'move.house.address.roadDesc') String? roadDesc;
  @JsonKey(name: 'move.house.address.subdistrictDesc') String? subdistrictDesc;
  @JsonKey(name: 'move.house.address.villageNo') String? villageNo;
  @JsonKey(name: 'move.house.houseID') String? houseID;
  @JsonKey(name: 'move.house.houseOwner') String? houseOwner;
  @JsonKey(name: 'move.house.moveDate') String? moveDate;
  @JsonKey(name: 'move.inform.rcodeCode') String? rcodeCode;
  @JsonKey(name: 'move.inform.rcodeDesc') String? rcodeDesc;
  @JsonKey(name: 'move.oldDateMoveIn') String? oldDateMoveIn;
  @JsonKey(name: 'move.own.dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'move.own.father.name') String? fatherName;
  @JsonKey(name: 'move.own.father.nationalityDesc') String? fatherNationalityDesc;
  @JsonKey(name: 'move.own.father.personalID') String? fatherPersonalID;
  @JsonKey(name: 'move.own.firstName') String? firstName;
  @JsonKey(name: 'move.own.gender') String? gender;
  @JsonKey(name: 'move.own.lastName') String? lastName;
  @JsonKey(name: 'move.own.middleName') String? middleName;
  @JsonKey(name: 'move.own.mother.name') String? motherName;
  @JsonKey(name: 'move.own.mother.nationalityDesc') String? motherNationalityDesc;
  @JsonKey(name: 'move.own.mother.personalID') String? motherPersonalID;
  @JsonKey(name: 'move.own.nationalityDesc') String? nationalityDesc;
  @JsonKey(name: 'move.own.personalID') String? personalID;
  @JsonKey(name: 'move.own.titleDesc') String? titleDesc;
  @JsonKey(name: 'move.petitionNo') String? petitionNo;
  @JsonKey(name: 'move.terminateDate') String? terminateDate;
  @JsonKey(name: 'move.type') String? type;
 

}

@JsonSerializable()
class ListMoveLkDto {
  ListMoveLkDto({
    this.status,
    this.data,
  });

  factory ListMoveLkDto.fromJson(Map<String, dynamic> json) => _$ListMoveLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListMoveLkDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<MoveLkDto>? data;
}

class MoveLkConstant {
  MoveLkConstant._();

  static const String m_description = 'ประเภทการย้าย';
  static const String m_documentNo = 'เลขที่เอกสาร';
  static const String m_alleyDesc = 'ซอย';
  static const String m_alleyWayDesc = 'ตรอก';
  static const String m_districtDesc = 'อำเภอ';
  static const String m_houseNo = 'บ้านเลขที่';
  static const String m_provinceDesc = 'จังหวัด';
  static const String m_roadDesc = 'ถนน';
  static const String m_subdistrictDesc = 'ตำบล';
  static const String m_villageNo = 'หมู่ที่';
  static const String m_houseID = 'เลขรหัสประจำบ้าน';
  static const String m_houseOwner = 'ชื่อเจ้าของบ้านที่ย้ายเข้า';
  static const String m_moveDate = 'วันที่ย้าย';
  static const String m_rcodeCode = 'รหัสสำนักทะเบียนที่รับแจ้ง';
  static const String m_rcodeDesc = 'ชื่อสำนักทะเบียนที่รับแจ้ง';
  static const String m_oldDateMoveIn = 'ปีเดือนวันที่ย้ายเข้าของบ้านเดิม';
  static const String m_dateOfBirth = 'ปีเดือนวันเกิด';
  static const String m_fatherName = 'ชื่อบิดา';
  static const String m_fatherNationalityDesc = 'สัญชาติบิดา';
  static const String m_fatherPersonalID = 'เลขประจำตัวประชาชนบิดา';
  static const String m_firstName = 'ชื่อตัว';
  static const String m_gender = 'เพศ';
  static const String m_lastName = 'ชื่อสกุล';
  static const String m_middleName = 'ชื่อรอง';
  static const String m_motherName = 'ชื่อมารดา';
  static const String m_motherNationalityDesc = 'สัญชาติมารดา';
  static const String m_motherPersonalID = 'เลขประจำตัวประชาชนมารดา';
  static const String m_nationalityDesc = 'สัญชาติ';
  static const String m_personalID = 'เลขประจำตัวประชาชน';
  static const String m_titleDesc = 'คำนำหน้านาม';
  static const String m_petitionNo = 'เลขที่ใบคำร้อง';
  static const String m_terminateDate = 'วันที่ยกเลิก';
  static const String m_type = 'รหัสประเภทการย้าย (1:ย้ายเข้า 2:ย้ายออก)';

}