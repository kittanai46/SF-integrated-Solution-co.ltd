import 'package:json_annotation/json_annotation.dart';

part 'idc_bp1_dto.g.dart';

@JsonSerializable()
class IdcBp1Dto {
  IdcBp1Dto({
    this.pB1Number,
    this.pID,
    this.birthDate,
    this.gender,
    this.blood,
    this.microNo,
    this.marryStatus,
    this.religion,
    this.occupation,
    this.reqHaveCardNo,
    this.reqCardNo,
    this.cardStatus,
    this.printCardDate,
    this.lostCardDate,
    this.causeCardCancel,
    this.causeCardCancelDesc,
    this.cardCancelDate,
    this.houseID,
    this.zipCode,
    this.title,
    this.firstName,
    this.lastName,
    this.lastNameDesc,
    this.religionDesc,
    this.printCardBy,
    this.regOffName,
    this.houseNo,
    this.moo,
    this.alley,
    this.soi,
    this.road,
    this.tambon,
    this.amphur,
    this.province,
    this.tel,
    this.record,
  });

  factory IdcBp1Dto.fromJson(Map<String, dynamic> json) => _$IdcBp1DtoFromJson(json);
  Map<String, dynamic> toJson() => _$IdcBp1DtoToJson(this);
 
  @JsonKey(name: 'PB1Number') String? pB1Number;
  @JsonKey(name: 'PID') String? pID;
  @JsonKey(name: 'BirthDate') String? birthDate;
  @JsonKey(name: 'Gender') String? gender;
  @JsonKey(name: 'Blood') String? blood;
  @JsonKey(name: 'MicroNo') String? microNo;
  @JsonKey(name: 'MarryStatus') String? marryStatus;
  @JsonKey(name: 'Religion') String? religion;
  @JsonKey(name: 'Occupation') String? occupation;
  @JsonKey(name: 'ReqHaveCardNo') String? reqHaveCardNo;
  @JsonKey(name: 'ReqCardNo') String? reqCardNo;
  @JsonKey(name: 'CardStatus') String? cardStatus;
  @JsonKey(name: 'PrintCardDate') String? printCardDate;
  @JsonKey(name: 'LostCardDate') String? lostCardDate;
  @JsonKey(name: 'CauseCardCancel') String? causeCardCancel;
  @JsonKey(name: 'CauseCardCancelDesc') String? causeCardCancelDesc;
  @JsonKey(name: 'CardCancelDate') String? cardCancelDate;
  @JsonKey(name: 'HouseID') String? houseID;
  @JsonKey(name: 'ZipCode') String? zipCode;
  @JsonKey(name: 'Title') String? title;
  @JsonKey(name: 'FirstName') String? firstName;
  @JsonKey(name: 'LastName') String? lastName;
  @JsonKey(name: 'LastNameDesc') String? lastNameDesc;
  @JsonKey(name: 'ReligionDesc') String? religionDesc;
  @JsonKey(name: 'PrintCardBy') String? printCardBy;
  @JsonKey(name: 'RegOffName') String? regOffName;
  @JsonKey(name: 'HouseNo') String? houseNo;
  @JsonKey(name: 'Moo') String? moo;
  @JsonKey(name: 'Alley') String? alley;
  @JsonKey(name: 'Soi') String? soi;
  @JsonKey(name: 'Road') String? road;
  @JsonKey(name: 'Tambon') String? tambon;
  @JsonKey(name: 'Amphur') String? amphur;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'Tel') String? tel;
  @JsonKey(name: 'Record') String? record;

}

@JsonSerializable()
class ListIdcBp1Dto {
  ListIdcBp1Dto({
    this.status,
    this.data,
  });

  factory ListIdcBp1Dto.fromJson(Map<String, dynamic> json) => _$ListIdcBp1DtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListIdcBp1DtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<IdcBp1Dto>? data;
}

class IdcBp1Constant {
  IdcBp1Constant._();

  static const String m_pB1Number = 'หมายเลข บป. 1';
  static const String m_pID = 'หมายเลขประจำตัวประชาชน';
  static const String m_birthDate = 'วันเดือนปีเกิด';
  static const String m_gender = 'เพศ';
  static const String m_blood = 'รหัสหมู่เลือด';
  static const String m_microNo = 'หมายเลขไมโครฟิมล์ในใบคำขอ บป. 1';
  static const String m_marryStatus = 'สถานภาพสมรส';
  static const String m_religion = 'รหัสศาสนา';
  static const String m_occupation = 'รหัสกลุ่มสาขาอาชีพ *';
  static const String m_reqHaveCardNo = 'รหัสการขอมีบัตร';
  static const String m_reqCardNo = 'รหัสยื่นคำขอกรณี **';
  static const String m_cardStatus = 'สถานะการทำบัตร';
  static const String m_printCardDate = 'วันที่พิมพ์บัตร';
  static const String m_lostCardDate = 'วันที่แจ้งบัตรหาย';
  static const String m_causeCardCancel = 'รหัสสาเหตุการยกเลิกบัตร ***';
  static const String m_causeCardCancelDesc = 'รหัสสาเหตุการยกเลิกรายการบัตร **';
  static const String m_cardCancelDate = 'วันที่ถูกยกเลิกรายการบัตร';
  static const String m_houseID = 'เลขรหัสประจำบ้าน';
  static const String m_zipCode = 'รหัสไปรษณีย์';
  static const String m_title = 'คำนำหน้านาม';
  static const String m_firstName = 'ชื่อผู้ทำบัตร';
  static const String m_lastName = 'ชื่อสกุลผู้ทำบัตร';
  static const String m_lastNameDesc = 'ส่วนต่อท้ายสกุล';
  static const String m_religionDesc = 'รายละเอียดของศาสนา';
  static const String m_printCardBy = 'ชื่อพนักงานผู้พิมพ์บัตร';
  static const String m_regOffName = 'ชื่อสำนักทะเบียน';
  static const String m_houseNo = 'บ้านเลขที่';
  static const String m_moo = 'หมู่ที่';
  static const String m_alley = 'ตรอก';
  static const String m_soi = 'ซอย';
  static const String m_road = 'ถนน';
  static const String m_tambon = 'ตำบล';
  static const String m_amphur = 'อำเภอ';
  static const String m_province = 'จังหวัด';
  static const String m_tel = 'หมายเลขโทรศัพท์';
  static const String m_record = 'บันทึก';
}