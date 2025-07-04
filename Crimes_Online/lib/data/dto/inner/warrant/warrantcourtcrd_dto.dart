import 'package:json_annotation/json_annotation.dart';

part 'warrantcourtcrd_dto.g.dart';

@JsonSerializable()
class WarrantCourtCRDDto {
  WarrantCourtCRDDto({
    // this.statusExpired,
    this.id,
    this.court_code,
    this.woa_type,
    this.woa_year,
    this.woa_no,
    this.woa_date,
    this.woa_start_date,
    this.woa_end_date,
    this.req_num_case_type_id,
    this.police_station_id,
    this.black_case_num_prefix,
    this.black_case_num,
    this.black_case_num_year,
    this.red_case_num_prefix,
    this.red_case_num,
    this.red_case_num_year,
    this.fault_type_id,
    this.plaintiff,
    this.accused,
    this.send_to_name,
    this.cause_text,
    this.charge,
    this.charge_type_1,
    this.charge_type_2,
    this.charge_type_2_1,
    this.charge_type_2_2,
    this.charge_type_2_3,
    this.charge_type_3,
    this.charge_other_text,
    this.acc_full_name,
    this.acc_card_type,
    this.acc_card_id,
    this.acc_origin,
    this.acc_nation,
    this.acc_occupation,
    this.acc_addno,
    this.acc_vilno,
    this.acc_road,
    this.acc_soi,
    this.acc_near,
    this.acc_sub_district,
    this.acc_district,
    this.acc_province,
    this.acc_tel,
    this.send_to_court_id,
    this.prescription,
    this.judge_name,
    this.court_injunction,
    this.appointment_type,
    this.appointment_date,
    this.arrest_result,
    this.arrest_date,
    this.arrest_result_other_text,
    this.prescription_unit,
    this.because,
    this.arrest_status,
    this.warrant_doc,
    this.rec_flg,
    this.recieve_date,

  });

  factory WarrantCourtCRDDto.fromJson(Map<String, dynamic> json) => _$WarrantCourtCRDDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantCourtCRDDtoToJson(this);

  @JsonKey(name: 'ID') String? id;
  @JsonKey(name: 'COURT_CODE') String? court_code;
  @JsonKey(name: 'WOA_TYPE') String? woa_type;
  @JsonKey(name: 'WOA_YEAR') String? woa_year;
  @JsonKey(name: 'WOA_NO') String? woa_no;
  @JsonKey(name: 'WOA_DATE') String? woa_date;
  @JsonKey(name: 'WOA_START_DATE') String? woa_start_date;
  @JsonKey(name: 'WOA_END_DATE') String? woa_end_date;
  @JsonKey(name: 'REQ_NUM_CASE_TYPE_ID') String? req_num_case_type_id;
  @JsonKey(name: 'POLICE_STATION_ID') String? police_station_id;
  @JsonKey(name: 'BLACK_CASE_NUM_PREFIX') String? black_case_num_prefix;
  @JsonKey(name: 'BLACK_CASE_NUM') String? black_case_num;
  @JsonKey(name: 'BLACK_CASE_NUM_YEAR') String? black_case_num_year;
  @JsonKey(name: 'RED_CASE_NUM_PREFIX') String? red_case_num_prefix;
  @JsonKey(name: 'RED_CASE_NUM') String? red_case_num;
  @JsonKey(name: 'RED_CASE_NUM_YEAR') String? red_case_num_year;
  @JsonKey(name: 'FAULT_TYPE_ID') String? fault_type_id;
  @JsonKey(name: 'PLAINTIFF') String? plaintiff;
  @JsonKey(name: 'ACCUSED') String? accused;
  @JsonKey(name: 'SEND_TO_NAME') String? send_to_name;
  @JsonKey(name: 'CAUSE_TEXT') String? cause_text;
  @JsonKey(name: 'CHARGE') String? charge;
  @JsonKey(name: 'CHARGE_TYPE_1') String? charge_type_1;
  @JsonKey(name: 'CHARGE_TYPE_2') String? charge_type_2;
  @JsonKey(name: 'CHARGE_TYPE_2_1') String? charge_type_2_1;
  @JsonKey(name: 'CHARGE_TYPE_2_2') String? charge_type_2_2;
  @JsonKey(name: 'CHARGE_TYPE_2_3') String? charge_type_2_3;
  @JsonKey(name: 'CHARGE_TYPE_3') String? charge_type_3;
  @JsonKey(name: 'CHARGE_OTHER_TEXT') String? charge_other_text;
  @JsonKey(name: 'ACC_FULL_NAME') String? acc_full_name;
  @JsonKey(name: 'ACC_CARD_TYPE') String? acc_card_type;
  @JsonKey(name: 'ACC_CARD_ID') String? acc_card_id;
  @JsonKey(name: 'ACC_ORIGIN') String? acc_origin;
  @JsonKey(name: 'ACC_NATION') String? acc_nation;
  @JsonKey(name: 'ACC_OCCUPATION') String? acc_occupation;
  @JsonKey(name: 'ACC_ADDNO') String? acc_addno;
  @JsonKey(name: 'ACC_VILNO') String? acc_vilno;
  @JsonKey(name: 'ACC_ROAD') String? acc_road;
  @JsonKey(name: 'ACC_SOI') String? acc_soi;
  @JsonKey(name: 'ACC_NEAR') String? acc_near;
  @JsonKey(name: 'ACC_SUB_DISTRICT') String? acc_sub_district;
  @JsonKey(name: 'ACC_DISTRICT') String? acc_district;
  @JsonKey(name: 'ACC_PROVINCE') String? acc_province;
  @JsonKey(name: 'ACC_TEL') String? acc_tel;
  @JsonKey(name: 'SEND_TO_COURT_ID') String? send_to_court_id;
  @JsonKey(name: 'PRESCRIPTION') String? prescription;
  @JsonKey(name: 'JUDGE_NAME') String? judge_name;
  @JsonKey(name: 'COURT_INJUNCTION') String? court_injunction;
  @JsonKey(name: 'APPOINTMENT_TYPE') String? appointment_type;
  @JsonKey(name: 'APPOINTMENT_DATE') String? appointment_date;
  @JsonKey(name: 'ARREST_RESULT') String? arrest_result;
  @JsonKey(name: 'ARREST_DATE') String? arrest_date;
  @JsonKey(name: 'ARREST_RESULT_OTHER_TEXT') String? arrest_result_other_text;
  @JsonKey(name: 'PRESCRIPTION_UNIT') String? prescription_unit;
  @JsonKey(name: 'BECAUSE') String? because;
  @JsonKey(name: 'ARREST_STATUS') String? arrest_status;
  @JsonKey(name: 'WARRANT_DOC') String? warrant_doc;
  @JsonKey(name: 'REC_FLG') String? rec_flg;
  @JsonKey(name: 'RECIEVE_DATE') String? recieve_date;

  //@JsonKey(name: 'STATUSEXPIRED') String? statusExpired;//0 ยังไม่หมดอายุ //1 หมดอายุ

}

@JsonSerializable()
class ListWarrantCourtCRDDto {
  ListWarrantCourtCRDDto({
    this.status,
    this.data,
  });

  factory ListWarrantCourtCRDDto.fromJson(Map<String, dynamic> json) => _$ListWarrantCourtCRDDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListWarrantCourtCRDDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<WarrantCourtCRDDto>? data;
}

class WarrantCourtCRDConstant {
  WarrantCourtCRDConstant._();

//   static const String m_ID = 'รหัสหมายจากศาล';
//   static const String m_COURT_CODE = 'ศาล'; //รหัสศาล
// // static const String m_COURT_NAME = 'ศาล';
//   static const String m_WOA_TYPE = 'ประเภทหมายจับ';
//   static const String m_WOA_YEAR = 'ปีของหมายจับ (พ.ศ.)';
//   static const String m_WOA_NO = 'เลขที่หมายจับ';
//   static const String m_WOA_DATE = 'วันที่ออกหมายจับ';
//   static const String m_WOA_START_DATE = 'นับตั้งแต่วันที่';
//   static const String m_WOA_END_DATE = 'แต่ไม่เกินวันที่ (วันที่หมายจับหมดอายุ)';
//   static const String m_REQ_NUM_CASE_TYPE_ID = 'ประเภทคำร้อง';
//   static const String m_POLICE_STATION_ID = 'สถานีตำรวจ/หน่วยงานนอกที่ขอศาลออกหมาย'; //รหัสสถานีตำรวจ/รหัสหน่วยงานนอกที่ขอศาลออกหมาย
// // static const String m_POLICE_STATION_NAME = 'สถานีตำรวจ/หน่วยงานนอกที่ขอศาลออกหมาย';
//   static const String m_BLACK_CASE_NUM_PREFIX = 'อักษรย่อเลขคำ';
//   static const String m_BLACK_CASE_NUM = 'เลขดำ (สำหรับ 47 - ศาลออกเอง)';
//   static const String m_BLACK_CASE_NUM_YEAR = 'เลขดำ พ.ศ. (สำหรับ 47 - ศาลออกเอง)';
//   static const String m_RED_CASE_NUM_PREFIX = 'อักษรย่อเลขแดง';
//   static const String m_RED_CASE_NUM = 'เลขแดง (สำหรับ 47 - ศาลออกเอง)';
//   static const String m_RED_CASE_NUM_YEAR = 'เลขแดง พ.ศ. (สำหรับ 47 - ศาลออกเอง)';
//   static const String m_FAULT_TYPE_ID = 'ความ';
//   static const String m_PLAINTIFF = 'ชื่อผู้ร้อง/โจทย์';
//   static const String m_ACCUSED = 'ชื่อจำเลย (สำหรับ 47 - ศาลออกเอง)';
//   static const String m_SEND_TO_NAME = 'หมายถึง (ส่งหมายถึงใคร)';
//   static const String m_CAUSE_TEXT = 'ด้วย';
//   static const String m_CHARGE = 'ต้องหาว่ากระทำผิดฐาน';
//   static const String m_CHARGE_TYPE_1 = 'ได้หรือน่าจะได้กระทำความผิดอาญาร้ายแรงซึ่งมีอัตราโทษจำคุกอย่างสูงเกิน 3 ปี';
//   static const String m_CHARGE_TYPE_2 = 'ได้หรือน่าจะได้กระทำความผิดอาญาและมีอันควรเชื่อว่า';
//   static const String m_CHARGE_TYPE_2_1 = 'จะหลบหนี';
//   static const String m_CHARGE_TYPE_2_2 = 'จะไปยุ่งกับพยานหลักฐาน';
//   static const String m_CHARGE_TYPE_2_3 = 'ก่อเหตุแันตรายประการอื่น';
//   static const String m_CHARGE_TYPE_3 = 'อื่นๆ';
//   static const String m_CHARGE_OTHER_TEXT = 'ข้อหาอื่นๆ';
//   static const String m_ACC_FULL_NAME = 'ชื่อผู้ต้องหา';
//   static const String m_ACC_CARD_TYPE = 'ประเภทเลขบัตรผู้ต้องหา';
//   static const String m_ACC_CARD_ID = 'เลขบัตรผู้ต้องหา';
//   static const String m_ACC_ORIGIN = 'เชื้อชาติ';
//   static const String m_ACC_NATION = 'สัญชาติ';
//   static const String m_ACC_OCCUPATION = 'อาชีพ';
//   static const String m_ACC_ADDNO = 'บ้านเลขที่ ผู้ต้องหา';
//   static const String m_ACC_VILNO = 'หมู่ที่';
//   static const String m_ACC_ROAD = 'ถนน';
//   static const String m_ACC_SOI = 'ซอย';
//   static const String m_ACC_NEAR = 'ใกล้เคียง';
//   static const String m_ACC_SUB_DISTRICT = 'รหัสตำบล/แขวง';
//   static const String m_ACC_DISTRICT = 'รหัสอำเภอ/เขต';
//   static const String m_ACC_PROVINCE = 'รหัสจังหวัด';
//   static const String m_ACC_TEL = 'เบอร์โทรศัพท์ ผู้ต้องหา';
//   static const String m_SEND_TO_COURT_ID = 'ส่งไปที่ศาล'; //รหัสส่งไปที่ศาล
// // static const String m_SEND_TO_COURT_NAME = 'ส่งไปที่ศาล';
//   static const String m_PRESCRIPTION = 'อายุความ(ปี)';
//   static const String m_JUDGE_NAME = 'ชื่อผู้พิพากษา';
//   static const String m_COURT_INJUNCTION = 'คำสั่งศาล';
//   static const String m_APPOINTMENT_TYPE = 'ประเภทนัดหมาย';
//   static const String m_APPOINTMENT_DATE = 'วันนัด';
//   static const String m_ARREST_RESULT = 'ผลการจับ';
//   static const String m_ARREST_DATE = 'จับได้เมื่อวันที่';
//   static const String m_ARREST_RESULT_OTHER_TEXT = 'ข้อความ กรณีจับไม่ได้หรืออื่นๆ';
//   static const String m_PRESCRIPTION_UNIT = 'หน่วยของอายุความ';
//   static const String m_BECAUSE = 'ยกเลิกหมายจับเพราะว่า';
//   static const String m_ARREST_STATUS = 'สถานะการจับกุมตัว';
//   static const String m_WARRANT_DOC = 'ภาพไฟล์หน้าหมาย';
//   static const String m_REC_FLG = 'สถานะที่ Service ดึงข้อมูลหมายจับจากศาล';
//   static const String m_RECIEVE_DATE = 'วันที่รับข้อมูลจาก AWIS';

  //static const String m_statusExpired = 'สถานะอายุหมายจับ';

  static const String m_id = 'รหัสหมายจากศาล';
  static const String m_court_code = 'ศาล'; //รหัสศาล
// static const String m_court_name = 'ศาล';
  static const String m_woa_type = 'ประเภทหมายจับ';
  static const String m_woa_year = 'ปีของหมายจับ (พ.ศ.)';
  static const String m_woa_no = 'เลขที่หมายจับ';
  static const String m_woa_date = 'วันที่ออกหมายจับ';
  static const String m_woa_start_date = 'นับตั้งแต่วันที่';
  static const String m_woa_end_date = 'แต่ไม่เกินวันที่ (วันที่หมายจับหมดอายุ)';
  static const String m_req_num_case_type_id = 'ประเภทคำร้อง';
  static const String m_police_station_id = 'สถานีตำรวจ/หน่วยงานนอกที่ขอศาลออกหมาย'; //รหัสสถานีตำรวจ/รหัสหน่วยงานนอกที่ขอศาลออกหมาย
// static const String m_police_station_name = 'สถานีตำรวจ/หน่วยงานนอกที่ขอศาลออกหมาย';
  static const String m_black_case_num_prefix = 'อักษรย่อเลขคำ';
  static const String m_black_case_num = 'เลขดำ (สำหรับ 47 - ศาลออกเอง)';
  static const String m_black_case_num_year = 'เลขดำ พ.ศ. (สำหรับ 47 - ศาลออกเอง)';
  static const String m_red_case_num_prefix = 'อักษรย่อเลขแดง';
  static const String m_red_case_num = 'เลขแดง (สำหรับ 47 - ศาลออกเอง)';
  static const String m_red_case_num_year = 'เลขแดง พ.ศ. (สำหรับ 47 - ศาลออกเอง)';
  static const String m_fault_type_id = 'ความ';
  static const String m_plaintiff = 'ชื่อผู้ร้อง/โจทย์';
  static const String m_accused = 'ชื่อจำเลย (สำหรับ 47 - ศาลออกเอง)';
  static const String m_send_to_name = 'หมายถึง (ส่งหมายถึงใคร)';
  static const String m_cause_text = 'ด้วย';
  static const String m_charge = 'ต้องหาว่ากระทำผิดฐาน';
  static const String m_charge_type_1 = 'ได้หรือน่าจะได้กระทำความผิดอาญาร้ายแรงซึ่งมีอัตราโทษจำคุกอย่างสูงเกิน 3 ปี';
  static const String m_charge_type_2 = 'ได้หรือน่าจะได้กระทำความผิดอาญาและมีอันควรเชื่อว่า';
  static const String m_charge_type_2_1 = 'จะหลบหนี';
  static const String m_charge_type_2_2 = 'จะไปยุ่งกับพยานหลักฐาน';
  static const String m_charge_type_2_3 = 'ก่อเหตุแันตรายประการอื่น';
  static const String m_charge_type_3 = 'อื่นๆ';
  static const String m_charge_other_text = 'ข้อหาอื่นๆ';
  static const String m_acc_full_name = 'ชื่อผู้ต้องหา';
  static const String m_acc_card_type = 'ประเภทเลขบัตรผู้ต้องหา';
  static const String m_acc_card_id = 'เลขบัตรผู้ต้องหา';
  static const String m_acc_origin = 'เชื้อชาติ';
  static const String m_acc_nation = 'สัญชาติ';
  static const String m_acc_occupation = 'อาชีพ';
  static const String m_acc_addno = 'บ้านเลขที่ ผู้ต้องหา';
  static const String m_acc_vilno = 'หมู่ที่';
  static const String m_acc_road = 'ถนน';
  static const String m_acc_soi = 'ซอย';
  static const String m_acc_near = 'ใกล้เคียง';
  static const String m_acc_sub_district = 'รหัสตำบล/แขวง';
  static const String m_acc_district = 'รหัสอำเภอ/เขต';
  static const String m_acc_province = 'รหัสจังหวัด';
  static const String m_acc_tel = 'เบอร์โทรศัพท์ ผู้ต้องหา';
  static const String m_send_to_court_id = 'ส่งไปที่ศาล'; //รหัสส่งไปที่ศาล
// static const String m_send_to_court_name = 'ส่งไปที่ศาล';
  static const String m_prescription = 'อายุความ';
  static const String m_judge_name = 'ชื่อผู้พิพากษา';
  static const String m_court_injunction = 'คำสั่งศาล';
  static const String m_appointment_type = 'ประเภทนัดหมาย';
  static const String m_appointment_date = 'วันนัด';
  static const String m_arrest_result = 'ผลการจับ';
  static const String m_arrest_date = 'จับได้เมื่อวันที่';
  static const String m_arrest_result_other_text = 'ข้อความ กรณีจับไม่ได้หรืออื่นๆ';
  static const String m_prescription_unit = 'หน่วยของอายุความ';
  static const String m_because = 'ยกเลิกหมายจับเพราะว่า';
  static const String m_arrest_status = 'สถานะการจับกุมตัว';
  static const String m_warrant_doc = 'ภาพไฟล์หน้าหมาย';
  static const String m_rec_flg = 'สถานะที่ Service ดึงข้อมูลหมายจับจากศาล';
  static const String m_recieve_date = 'วันที่รับข้อมูลจาก AWIS';

}