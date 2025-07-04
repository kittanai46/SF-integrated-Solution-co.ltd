import 'package:json_annotation/json_annotation.dart';

part 'warrant_dto.g.dart';

@JsonSerializable()
class WarrantDto {
  WarrantDto({
    this.bh,
    this.caseNo,
    this.court,
    this.displayChargePerson,
    this.stationName,
    this.statusSuspectArrest,
    this.statusWarrant,
    this.suspectFullname,
    this.suspectId,
    this.wrNo,
    this.wrId,
    this.caseType,
    this.wrFileId,
    this.statusExpired,
    this.orgCode,
    this.policeFullname,
    this.wrAge,
  });

  factory WarrantDto.fromJson(Map<String, dynamic> json) => _$WarrantDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WarrantDtoToJson(this);

  @JsonKey(name: 'BH') String? bh;
  @JsonKey(name: 'CASENO') String? caseNo;
  @JsonKey(name: 'COURT') String? court;
  @JsonKey(name: 'DISPLAYCHARGEPERSON') String? displayChargePerson;
  @JsonKey(name: 'STATIONNAME') String? stationName;
  @JsonKey(name: 'STATUSSUSPECTARREST') String? statusSuspectArrest;
  @JsonKey(name: 'STATUSWARRANT') String? statusWarrant;
  @JsonKey(name: 'SUSPECTFULLNAME') String? suspectFullname;
  @JsonKey(name: 'SUSPECTID') String? suspectId;
  @JsonKey(name: 'WR_NO') String? wrNo;
  @JsonKey(name: 'WRID') String? wrId;
  @JsonKey(name: 'CASETYPE') String? caseType;
  @JsonKey(name: 'WRFILEID') String? wrFileId;
  @JsonKey(name: 'UPDATE_DATE') String? updateDate;
  @JsonKey(name: 'BK') String? bk;
  @JsonKey(name: 'WR_STARTDATE') String? wrStartDate;
  @JsonKey(name: 'WR_ENDDATE') String? wrEndDate;
  @JsonKey(name: 'STATUSEXPIRED') String? statusExpired;//0 ยังไม่หมดอายุ //1 หมดอายุ
  @JsonKey(name: 'ORGCODE') String? orgCode;
  @JsonKey(name: 'POLICEFULLNAME') String? policeFullname;
  @JsonKey(name: 'WR_DATE') String? wrDate;
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

/**
    [
    {
    "": "อนุพล",
    "SUSPECTAMPHUR": "-",
    "WRFILEID": "-",
    "CASETYPE": "-",
    "WR_NO": "จ.273\/2551",
    "FULLHOMETOWN": "-",
    "": "2008-03-11",
    "WRID": "-",
    "COURTID": "-",
    "FULLCOURT": "-",
    "SUSPECTPROVINCE": "-",
    "FULLSTATION": "-",
    "SURNAMETH": "กองศิลป์",
    "SUSPECTFULLNAME": "อนุพล กองศิลป์",
    "FULLPID": "-",
    "ORGCODE": "60052",
    "FULLSUSNAME": "-",
    "SUSPECTTAMBON": "-",
    "WR_ENDDATE": "2022-09-27",
    "DISPLAYCHARGEPERSON": "ร่วมกันทำร้ายร่างกายผู้อื่นจนเป็นเหตุให้ผู้ถูกกระทำรับอันตรายสาหัส",
    "STATUSWARRANT": "มีผลบังคับใช้ตามกฏหมาย",
    "STATIONNAME": "สน.ท่าข้าม",
    "SUSPECTID": "1101800312285",
    "COURT": "ศาลอาญาธนบุรี",
    "CASENO": "1653\/2550"
    }
    ]
 */
}

@JsonSerializable()
class ListWarrantDto {
  ListWarrantDto({
    this.status,
    this.data,
  });

  factory ListWarrantDto.fromJson(Map<String, dynamic> json) => _$ListWarrantDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListWarrantDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<WarrantDto>? data;
}

class WarrantConstant {
  WarrantConstant._();

  static const String m_bh = 'บช./ภาค';
  static const String m_caseNo = 'เลขคดี';
  static const String m_court = 'ศาล';
  static const String m_displayChargePerson = 'ข้อหา(หมายจับ)';
  static const String m_stationName = 'ชื่อสถานี';
  static const String m_statusSuspectArrest = 'สถานะการจับกุม';
  static const String m_statusWarrant = 'สถานะหมายจับ';
  static const String m_suspectFullname = 'ชื่อสกุลผู้ต้องหา';
  static const String m_suspectId = 'เลขบัตรปชช. - ผู้ต้องหา';
  static const String m_wrNo = 'เลขหมายจับ';
  static const String m_wrId = 'Object ID';
  static const String m_caseType = 'ประเภทหมายจับ';
  static const String m_updateDate = 'วันที่ปรับปรุงข้อมูล';
  static const String m_bk = 'บก./ภจว.';
  static const String m_wrStartDate = 'วันที่หมายมีผลเริ่มต้น';
  static const String m_wrEndDate = 'วันที่หมายมีผลสิ้นสุด';
  static const String m_statusExpired = 'สถานะอายุหมายจับ';
  static const String m_orgCode='รหัสสถานี';
  static const String m_policeFullname='พงส.ผู้รับผิดชอบ';
  static const String m_wrDate='วันที่ออกหมายจับ';             //WR_DATE
  static const String m_suspectProvince='จังหวัด - ผู้ต้องหา';  //SUSPECTPROVINCE
  static const String m_suspectAmphur='อำเภอ - ผู้ต้องหา';    //SUSPECTAMPHUR
  static const String m_suspectTambon='ตำบล - ผู้ต้องหา';     //SUSPECTTAMBON
  /*@JsonKey(name: 'UPDATE_DATE') String updateDate;
  @JsonKey(name: 'BK') String bk;
  @JsonKey(name: 'WR_STARTDATE') String wrStartDate;
  @JsonKey(name: 'WR_ENDDATE') String wrEndDate;*/
  static const String m_wrAge='อายุความ';             //WR_AGE
}