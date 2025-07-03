import 'package:json_annotation/json_annotation.dart';

part 'rednotice_dto.g.dart';

@JsonSerializable()
class RedNoticeDto {
  RedNoticeDto({
    // this.statusExpired,

    this.sequenceNo,
    this.policeName,
    this.suspectName,
    this.nationality,
    this.warrantNumber,
    this.warrantExpire,
    this.warrantExpireStr,
    this.controlNumber,
    this.publishDate,
    this.publishDateStr,
    this.charge,
    this.organizationOwner,
    this.bookNumber,
    this.remarkVisited,
    this.divisionOwner,

  });

  factory RedNoticeDto.fromJson(Map<String, dynamic> json) => _$RedNoticeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RedNoticeDtoToJson(this);

  @JsonKey(name: 'SEQUENCENO') String? sequenceNo;
  @JsonKey(name: 'POLICENAME') String? policeName;
  @JsonKey(name: 'SUSPECTNAME') String? suspectName;
  @JsonKey(name: 'NATIONALITY') String? nationality;
  @JsonKey(name: 'WARRANTNUMBER') String? warrantNumber;
  @JsonKey(name: 'WARRANTEXPIRE') String? warrantExpire;
  @JsonKey(name: 'WARRANTEXPIRE_STR') String? warrantExpireStr;
  @JsonKey(name: 'CONTROLNUMBER') String? controlNumber;
  @JsonKey(name: 'PUBLISHDATE') String? publishDate;
  @JsonKey(name: 'PUBLISHDATE_STR') String? publishDateStr;
  @JsonKey(name: 'CHARGE') String? charge;
  @JsonKey(name: 'ORGANIZATIONOWNER') String? organizationOwner;
  @JsonKey(name: 'BOOKNUMBER') String? bookNumber;
  @JsonKey(name: 'REMARKVISITED') String? remarkVisited;
  @JsonKey(name: 'DIVISIONOWNER') String? divisionOwner;

  //@JsonKey(name: 'STATUSEXPIRED') String? statusExpired;//0 ยังไม่หมดอายุ //1 หมดอายุ

}

@JsonSerializable()
class ListRedNoticeDto {
  ListRedNoticeDto({
    this.status,
    this.data,
  });

  factory ListRedNoticeDto.fromJson(Map<String, dynamic> json) => _$ListRedNoticeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListRedNoticeDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<RedNoticeDto>? data;
}

class RedNoticeConstant {
  RedNoticeConstant._();

  // static const String m_SEQUENCENO = 'ลำดับ';
  // static const String m_POLICENAME = 'เจ้าหน้าที่ตำรวจ';
  // static const String m_SUSPECTNAME = 'ชื่อ-นามสกุล ผู้ต้องหา';
  // static const String m_NATIONALITY = 'สัญชาติ';
  // static const String m_WARRANTNUMBER = 'เลขที่หมายจับ (พ.ศ.)';
  // static const String m_WARRANTEXPIRE = 'วันที่หมายจับหมดอายุ (พ.ศ.)';
  // static const String m_CONTROLNUMBER = 'Control no. (ค.ศ.)';
  // static const String m_PUBLISHDATE = 'วันที่เผยแพร่'; // (ค.ศ.)
  // static const String m_CHARGE = 'ข้อหา';
  // static const String m_ORGANIZATIONOWNER = 'หน่วยเจ้าของเรื่อง';
  // static const String m_BOOKNUMBER = 'เลขหนังสือ';
  // static const String m_REMARKVISITED = 'หมายเหตุ/visited';
  // static const String m_DIVISIONOWNER = 'ฝ่ายเจ้าของเรื่อง';

  static const String m_sequenceNo = 'ลำดับ';
  static const String m_policeName = 'เจ้าหน้าที่ตำรวจ';
  static const String m_suspectName = 'ชื่อ-นามสกุล ผู้ต้องหา';
  static const String m_nationality = 'สัญชาติ';
  static const String m_warrantNumber = 'เลขที่หมายจับ (พ.ศ.)';
  static const String m_warrantExpire = 'วันที่หมายจับหมดอายุ (พ.ศ.)';
  static const String m_controlNumber = 'Control no. (ค.ศ.)';
  static const String m_publishDate = 'วันที่เผยแพร่'; // (ค.ศ.)
  static const String m_charge = 'ข้อหา';
  static const String m_organizationOwner = 'หน่วยเจ้าของเรื่อง';
  static const String m_bookNumber = 'เลขหนังสือ';
  static const String m_remarkVisited = 'หมายเหตุ/visited';
  static const String m_divisionOwner = 'ฝ่ายเจ้าของเรื่อง';

//static const String m_statusExpired = 'สถานะอายุหมายจับ';

}