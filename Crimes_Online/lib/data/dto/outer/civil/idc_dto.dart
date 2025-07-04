import 'package:json_annotation/json_annotation.dart';

part 'idc_dto.g.dart';

@JsonSerializable()
class IdcDto {
  IdcDto({
    this.pB1Number,
    this.pID,
    this.title,
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.blood,
    this.adress,
    this.moo,
    this.tambon,
    this.amphur,
    this.province,
    this.reqType,
    this.reqCardDate,
    this.printCardDate,
    this.religion,
  });

  factory IdcDto.fromJson(Map<String, dynamic> json) => _$IdcDtoFromJson(json);
  Map<String, dynamic> toJson() => _$IdcDtoToJson(this);
 
  @JsonKey(name: 'PB1Number') String? pB1Number;
  @JsonKey(name: 'PID') String? pID;
  @JsonKey(name: 'Title') String? title;
  @JsonKey(name: 'FirstName') String? firstName;
  @JsonKey(name: 'LastName') String? lastName;
  @JsonKey(name: 'Gender') String? gender;
  @JsonKey(name: 'BirthDate') String? birthDate;
  @JsonKey(name: 'Blood') String? blood;
  @JsonKey(name: 'Adress') String? adress;
  @JsonKey(name: 'Moo') String? moo;
  @JsonKey(name: 'Tambon') String? tambon;
  @JsonKey(name: 'Amphur') String? amphur;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'ReqType') String? reqType;
  @JsonKey(name: 'ReqCardDate') String? reqCardDate;
  @JsonKey(name: 'PrintCardDate') String? printCardDate;
  @JsonKey(name: 'Religion') String? religion;

}

@JsonSerializable()
class ListIdcDto {
  ListIdcDto({
    this.status,
    this.data,
  });

  factory ListIdcDto.fromJson(Map<String, dynamic> json) => _$ListIdcDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListIdcDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<IdcDto>? data;
}

class IdcConstant {
  IdcConstant._();

  static const String m_pB1Number = 'หมายเลข บป. 1';
  static const String m_pID = 'เลขบัตรประชาชน';
  static const String m_title = 'คำนำหน้าชื่อ';
  static const String m_firstName = 'ชื่อ';
  static const String m_lastName = 'นามสกุล';
  static const String m_gender = 'เพศ';
  static const String m_birthDate = 'วันเกิด';
  static const String m_blood = 'หมู่เลือด';
  static const String m_adress = 'ที่อยู่';
  static const String m_moo = 'หมู่ที่';
  static const String m_tambon = 'ตำบล';
  static const String m_amphur = 'อำเภอ';
  static const String m_province = 'จังหวัด';
  static const String m_reqType = 'ประเภทการขอมีบัตร';
  static const String m_reqCardDate = 'วันที่ยื่นคำร้องขอมีบัตร';
  // static const String m_printCardDate = 'วันที่พิมพ์บัตร';
  static const String m_printCardDate = 'วันที่บัตรหมดอายุ';
  static const String m_religion = 'ศาสนา';
}