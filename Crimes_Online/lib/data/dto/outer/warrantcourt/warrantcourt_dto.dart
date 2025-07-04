import 'package:json_annotation/json_annotation.dart';

part 'warrantcourt_dto.g.dart';

@JsonSerializable()
class WarrantCourtDto {
  WarrantCourtDto({
    this.caseNo,
    this.court,
    this.displayChargePerson,
    this.statusSuspectArrest,
    this.statusWarrant,
    this.suspectFullname,
    this.suspectId,
    this.wrNo,
    this.wrId,
    this.caseType,
    this.wrFileId,
    this.updateDate,
    this.wrStartDate,
    this.wrEndDate,
    this.statusExpired,
    this.orgCode,
    this.policeFullname,
    this.suspectProvince,
    this.suspectAmphur,
    this.suspectTambom,
    this.wrAge
  });

  factory WarrantCourtDto.fromJson(Map<String, dynamic> json) => _$WarrantCourtDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantCourtDtoToJson(this);

  @JsonKey(name: 'CASENO') String? caseNo;
  @JsonKey(name: 'COURT') String? court;
  @JsonKey(name: 'DISPLAYCHARGEPERSON') String? displayChargePerson;
  @JsonKey(name: 'STATUSSUSPECTARREST') String? statusSuspectArrest;
  @JsonKey(name: 'STATUSWARRANT') String? statusWarrant;
  @JsonKey(name: 'SUSPECTFULLNAME') String? suspectFullname;
  @JsonKey(name: 'SUSPECTID') String? suspectId;
  @JsonKey(name: 'WR_NO') String? wrNo;
  @JsonKey(name: 'WRID') String? wrId;
  @JsonKey(name: 'CASETYPE') String? caseType;
  @JsonKey(name: 'WRFILEID') String? wrFileId;
  @JsonKey(name: 'UPDATE_DATE') String? updateDate;
  @JsonKey(name: 'WR_STARTDATE') String? wrStartDate;
  @JsonKey(name: 'WR_ENDDATE') String? wrEndDate;
  @JsonKey(name: 'STATUSEXPIRED') String? statusExpired;//0 ยังไม่หมดอายุ //1 หมดอายุ
  @JsonKey(name: 'ORGCODE') String? orgCode;
  @JsonKey(name: 'POLICEFULLNAME') String? policeFullname;
  @JsonKey(name: 'SUSPECTPROVINCE') String? suspectProvince;
  @JsonKey(name: 'SUSPECTAMPHUR') String? suspectAmphur;
  @JsonKey(name: 'SUSPECTTAMBON') String? suspectTambom;
  @JsonKey(name: 'WR_AGE') String? wrAge;

  String getCaseNumber(){
    if(caseNo!=null && caseNo!.split('/').length>1){
      return caseNo!.split('/')[0];
    }else{
      return '';
    }
  }
  String getCaseYear(){
    if(caseNo!=null && caseNo!.split('/').length>1){
      return caseNo!.split('/')[1];
    }else{
      return '';
    }
  }
}

@JsonSerializable()
class ListWarrantCourtDto {
  ListWarrantCourtDto({
    this.status,
    this.data,
  });

  factory ListWarrantCourtDto.fromJson(Map<String, dynamic> json) => _$ListWarrantCourtDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListWarrantCourtDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<WarrantCourtDto>? data;
}

class WarrantCourtConstant {
  WarrantCourtConstant._();

  static const String m_caseNo = 'เลขคดี';
  static const String m_court = 'ศาล';
  static const String m_displayChargePerson = 'ข้อหา(หมายจับ)';
  static const String m_statusSuspectArrest = 'สถานะการจับกุม';
  static const String m_statusWarrant = 'สถานะหมายจับ';
  static const String m_suspectFullname = 'ชื่อสกุลผู้ต้องหา';
  static const String m_suspectId = 'เลขบัตรปชช. - ผู้ต้องหา';
  static const String m_wrNo = 'เลขหมายจับ';
  static const String m_wrId = 'Object ID';
  static const String m_caseType = 'ประเภทหมายจับ';
  static const String m_updateDate = 'วันที่ปรับปรุงข้อมูล';
  static const String m_wrStartDate = 'วันที่หมายมีผลเริ่มต้น';
  static const String m_wrEndDate = 'วันที่หมายมีผลสิ้นสุด';
  static const String m_statusExpired = 'สถานะอายุหมายจับ';
  static const String m_orgCode='รหัสสถานี';
  static const String m_policeFullname='พงส.ผู้รับผิดชอบ';
  static const String m_suspectProvince='จังหวัด - ผู้ต้องหา';  //SUSPECTPROVINCE
  static const String m_suspectAmphur='อำเภอ - ผู้ต้องหา';    //SUSPECTAMPHUR
  static const String m_suspectTambon='ตำบล - ผู้ต้องหา';     //SUSPECTTAMBON
  static const String m_wrAge='อายุความ';             //WR_AGE
}