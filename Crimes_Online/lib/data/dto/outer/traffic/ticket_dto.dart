import 'package:json_annotation/json_annotation.dart';

part 'ticket_dto.g.dart';

@JsonSerializable()
class TicketDto {
  TicketDto({
    this.ticketStatus,
    this.plate,
    this.ticketId,
    this.cardId,
    this.fullname,
    this.occurDt,
    this.place,
    this.crossDescHappen,
    this.soiHappen,
    this.roadHappen,
    this.subdistrictHappen,
    this.districtHappen,
    this.atkilometerHappen,
    this.accuse1Code,
    this.fine1,
    this.accuse2Code,
    this.fine2,
    this.accuse3Code,
    this.fine3,
    this.accuse4Code,
    this.fine4,
    this.accuse5Code,
    this.fine5,
    this.pic1,
    this.pic2,
    this.pic3,
    this.fineAmt,
    this.ticketDate,
    this.orgCode,
    this.orgAbbr,
    this.tel,
    this.fineDueDate,
    this.paidDate,
    this.paidBy,
  });

  factory TicketDto.fromJson(Map<String, dynamic> json) => _$TicketDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TicketDtoToJson(this);

  @JsonKey(name: 'ticket_STATUS') String? ticketStatus;
  @JsonKey(name: 'plate') String? plate;
  @JsonKey(name: 'ticket_ID') String? ticketId;
  @JsonKey(name: 'card_ID') String? cardId;
  @JsonKey(name: 'fullname') String? fullname;
  @JsonKey(name: 'occur_DT') String? occurDt;
  @JsonKey(name: 'place') String? place;
  @JsonKey(name: 'cross_DESC_HAPPEN') String? crossDescHappen;
  @JsonKey(name: 'soi_HAPPEN') String? soiHappen;
  @JsonKey(name: 'road_HAPPEN') String? roadHappen;
  @JsonKey(name: 'subdistrict_HAPPEN') String? subdistrictHappen;
  @JsonKey(name: 'district_HAPPEN') String? districtHappen;
  @JsonKey(name: 'atkilometer_HAPPEN') String? atkilometerHappen;
  @JsonKey(name: 'accuse1_CODE') String? accuse1Code;
  @JsonKey(name: 'fine1') String? fine1;
  @JsonKey(name: 'accuse2_CODE') String? accuse2Code;
  @JsonKey(name: 'fine2') String? fine2;
  @JsonKey(name: 'accuse3_CODE') String? accuse3Code;
  @JsonKey(name: 'fine3') String? fine3;
  @JsonKey(name: 'accuse4_CODE') String? accuse4Code;
  @JsonKey(name: 'fine4') String? fine4;
  @JsonKey(name: 'accuse5_CODE') String? accuse5Code;
  @JsonKey(name: 'fine5') String? fine5;
  @JsonKey(name: 'pic1') String? pic1;
  @JsonKey(name: 'pic2') String? pic2;
  @JsonKey(name: 'pic3') String? pic3;
  @JsonKey(name: 'fine_AMT') String? fineAmt;
  @JsonKey(name: 'ticket_DATE') String? ticketDate;
  @JsonKey(name: 'org_CODE') String? orgCode;
  @JsonKey(name: 'org_ABBR') String? orgAbbr;
  @JsonKey(name: 'tel') String? tel;
  @JsonKey(name: 'fine_DUE_DATE') String? fineDueDate;
  @JsonKey(name: 'paid_DATE') String? paidDate;
  @JsonKey(name: 'paid_BY') String? paidBy;
  
}

@JsonSerializable()
class ListTicketDto {
  ListTicketDto({
    this.status,
    this.data,
  });

  factory ListTicketDto.fromJson(Map<String, dynamic> json) => _$ListTicketDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListTicketDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<TicketDto>? data;
}

class TicketConstant {
  TicketConstant._();

  static const String m_ticketStatus = 'สถานะของใบสั่ง';
  static const String m_plate = 'ป้ายทะเบียนรถ';
  static const String m_ticketId = 'เลขที่ใบสั่ง';
  static const String m_cardId = 'เลขบัตรประชาชน';
  static const String m_fullname = 'ชื่อ- นามสกุล';
  static const String m_occurDt = 'วันและเวลาที่เกิดเหตุ';
  static const String m_place = 'สถานที่เกิตเหตุ';
  static const String m_crossDescHappen = 'แยกที่เกิดเหตุ';
  static const String m_soiHappen = 'ซอยที่เกิดเหตุ';
  static const String m_roadHappen = 'ถนนที่เกิดเหตุ';
  static const String m_subdistrictHappen = 'ตำบลที่เกิดเหตุ';
  static const String m_districtHappen = 'อำเภอที่เกิดเหตุ';
  static const String m_atkilometerHappen = 'หลักกิโลเมตรที่เกิดเหตุ';
  static const String m_accuse1Code = 'ชื่อข้อหาที่ 1';
  static const String m_fine1 = 'ค่าปรับข้อหาที่ 1';
  static const String m_accuse2Code = 'ชื่อข้อหาที่ 2';
  static const String m_fine2 = 'ค่าปรับข้อหาที่ 2';
  static const String m_accuse3Code = 'ชื่อข้อหาที่ 3';
  static const String m_fine3 = 'ค่าปรับข้อหาที่ 3';
  static const String m_accuse4Code = 'ชื่อข้อหาที่ 4';
  static const String m_fine4 = 'ค่าปรับข้อหาที่ 4';
  static const String m_accuse5Code = 'ชื่อข้อหาที่ 5';
  static const String m_fine5 = 'ค่าปรับข้อหาที่ 5';
  static const String m_pic1 = 'รูปภาพที่ 1';
  static const String m_pic2 = 'รูปภาพที่ 2';
  static const String m_pic3 = 'รูปภาพที่ 3';
  static const String m_fineAmt = 'จำนวนค่าปรับรวม';
  static const String m_ticketDate = 'วันที่เวลาที่ออกใบสั่ง';
  static const String m_orgCode = 'รหัสหน่วยงาน';
  static const String m_orgAbbr = 'ชื่อหน่วยงานที่ออกใบสั่ง';
  static const String m_tel = 'โทร';
  static const String m_fineDueDate = 'วันเวลาที่ครบกำหนดชำระค่าปรับ';
  static const String m_paidDate = 'วันที่ชำระค่าปรับ';
  static const String m_paidBy = 'ช่องทางการชำระเงิน';
}