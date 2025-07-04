import 'package:json_annotation/json_annotation.dart';

part 'warrantcrd_dto.g.dart';

@JsonSerializable()
class WarrantCRDDto {
  WarrantCRDDto({
    this.card_id,
    this.pname,
    this.fname,
    this.midname,
    this.lname,
    this.engname,
    this.idno,
    this.charge,
    this.caseno,
    this.caseyear,
    this.orgcode,
    this.caseorg,
    this.cousin_name,
    this.cousin_addr,
    this.credte,
    this.creusr,
    this.ex_d,
    this.gang,
    this.gang_name,
    this.happenaddr,
    this.office,
    this.police,
    this.position,
    this.prize,
    this.proc_d,
    this.proc_no,
    this.proc_off,
    this.spouse_addr,
    this.spouse_name,
    this.upd_date,
    this.upd_id,
    this.want_d,
    this.want_name,
    this.want_no,
    this.want_off,
    this.want_y,
    this.warrant_doc,
    this.statusExpired,

  });

  factory WarrantCRDDto.fromJson(Map<String, dynamic> json) => _$WarrantCRDDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantCRDDtoToJson(this);

  @JsonKey(name: 'CARD_ID') String? card_id;
  @JsonKey(name: 'PNAME') String? pname;
  @JsonKey(name: 'FNAME') String? fname;
  @JsonKey(name: 'MIDNAME') String? midname;
  @JsonKey(name: 'LNAME') String? lname;
  @JsonKey(name: 'ENGNAME') String? engname;
  @JsonKey(name: 'IDNO') String? idno;
  @JsonKey(name: 'CHARGE') String? charge;
  @JsonKey(name: 'CASENO') String? caseno;
  @JsonKey(name: 'CASEYEAR') String? caseyear;
  @JsonKey(name: 'ORGCODE') String? orgcode;
  @JsonKey(name: 'CASEORG') String? caseorg;
  @JsonKey(name: 'COUSIN_NAME') String? cousin_name;
  @JsonKey(name: 'COUSIN_ADDR') String? cousin_addr;
  @JsonKey(name: 'CREDTE') String? credte;
  @JsonKey(name: 'CREUSR') String? creusr;
  @JsonKey(name: 'EX_D') String? ex_d;
  @JsonKey(name: 'GANG') String? gang;
  @JsonKey(name: 'GANG_NAME') String? gang_name;
  @JsonKey(name: 'HAPPENADDR') String? happenaddr;
  @JsonKey(name: 'OFFICE') String? office;
  @JsonKey(name: 'POLICE') String? police;
  @JsonKey(name: 'POSITION') String? position;
  @JsonKey(name: 'PRIZE') String? prize;
  @JsonKey(name: 'PROC_D') String? proc_d;
  @JsonKey(name: 'PROC_NO') String? proc_no;
  @JsonKey(name: 'PROC_OFF') String? proc_off;
  @JsonKey(name: 'SPOUSE_ADDR') String? spouse_addr;
  @JsonKey(name: 'SPOUSE_NAME') String? spouse_name;
  @JsonKey(name: 'UPD_DATE') String? upd_date;
  @JsonKey(name: 'UPD_ID') String? upd_id;
  @JsonKey(name: 'WANT_D') String? want_d;
  @JsonKey(name: 'WANT_NAME') String? want_name;
  @JsonKey(name: 'WANT_NO') String? want_no;
  @JsonKey(name: 'WANT_OFF') String? want_off;
  @JsonKey(name: 'WANT_Y') String? want_y;
  @JsonKey(name: 'WARRANT_DOC') String? warrant_doc;
  @JsonKey(name: 'STATUSEXPIRED') String? statusExpired;//0 ยังไม่หมดอายุ //1 หมดอายุ

  //
  // String getCaseNumber(){
  //   if(caseNo!=null && caseNo!.split('/').length>1){
  //     return caseNo!.split('/')[0];
  //   }else{
  //     return '';
  //   }
  // }
  // String getCaseYear(){
  //   if(caseNo!=null && caseNo!.split('/').length>1){
  //     return caseNo!.split('/')[1];
  //   }else{
  //     return '';
  //   }
  // }

}

@JsonSerializable()
class ListWarrantCRDDto {
  ListWarrantCRDDto({
    this.status,
    this.data,
  });

  factory ListWarrantCRDDto.fromJson(Map<String, dynamic> json) => _$ListWarrantCRDDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListWarrantCRDDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<WarrantCRDDto>? data;
}

class WarrantCRDConstant {
  WarrantCRDConstant._();

  static const String m_card_id = 'รหัส';
  static const String m_pname = 'คำนำหน้าชื่อ';
  static const String m_fname = 'ชื่อ';
  static const String m_midname = 'ชื่อกลาง';
  static const String m_lname = 'นามสกุล';
  static const String m_engname = 'ชื่่อภาษาอังกฤษ';
  static const String m_idno = 'เลขบัตรประชาชน' ;
  static const String m_charge = 'ข้อหา';
  static const String m_caseno = 'เลขคดี';
  static const String m_caseyear = 'ปีคดี';
  static const String m_orgcode = 'รหัสหน่วยงาน';
  static const String m_caseorg = 'หน่วยงาน';
  static const String m_cousin_name = 'ชื่อลูกพี่ลูกน้อง';
  static const String m_cousin_addr = 'ที่อยู่ลูกพี่ลูกน้อง';
  static const String m_credte = 'วันที่สร้าง';
  static const String m_creusr = 'ผู้สร้าง';
  static const String m_ex_d = 'วันที่หมายหมดอายุ';
  static const String m_gang = 'รหัสแก็งส์';
  static const String m_gang_name = 'แก็งส์';
  static const String m_happenaddr = 'สถานที่เกิดเหตุ';
  static const String m_office = 'สถานที่ทำงาน';
  static const String m_police = 'เจ้าหน้าที่ตำรวจ';
  static const String m_position = 'ตำแหน่ง';
  static const String m_prize= 'รางวัลนำจับ';
  static const String m_proc_d = 'วันที่หน่วยบันทึกข้อมูล'; //ยังไม่แน่ใจ
  static const String m_proc_no = 'รหัสหน่วยที่บันทึกข้อมูล'; //ยังไม่แน่ใจ
  static const String m_proc_off = 'หน่วยที่บันทึกข้อมูล'; //ยังไม่แน่ใจ
  static const String m_spouse_addr = 'ที่อยู่คู่สมรส';
  static const String m_spouse_name = 'ชื่อคู่สมรส';
  static const String m_upd_date = 'วันที่ปรับปรุง';
  static const String m_upd_id = 'ผู้ปรับปรุง';
  static const String m_want_d = 'วันที่ออกหมายจับ';
  static const String m_want_name = 'ผู้ออกมายจับ';
  static const String m_want_no = 'เลขที่หมายจับ';
  static const String m_want_off = 'สถานที่ออกหมายจับ';
  static const String m_want_y = 'ปีหมายจับ';
  static const String m_warrant_doc = 'ไฟล์หมาบจับ';
  static const String m_statusExpired = 'สถานะอายุหมายจับ';

}