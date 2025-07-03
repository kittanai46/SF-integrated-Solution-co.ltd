import 'package:json_annotation/json_annotation.dart';

part 'tm61_dto.g.dart';

@JsonSerializable()
class Tm61Dto {
  Tm61Dto({
    this.fullname,
    this.birthDate,
    this.nationenm,
    this.traveldocType,
    this.passportPlace,
    this.passportNo,
    this.passportDate,
    this.countenm,
    this.inDate,
    this.permitDate,
    this.convenm,
    this.status,
    this.reason,
    this.building,
    this.addr,
    this.road,
    this.tmbSeqno,
    this.tmbDecs,
    this.ampSeqno,
    this.ampDecs,
    this.pvSeqno,
    this.pvDecs,
  });

  factory Tm61Dto.fromJson(Map<String, dynamic> json) => _$Tm61DtoFromJson(json);
  Map<String, dynamic> toJson() => _$Tm61DtoToJson(this);

  @JsonKey(name: 'Fullname') String? fullname;
  @JsonKey(name: 'BirthDate') String? birthDate;
  @JsonKey(name: 'Nationenm') String? nationenm;
  @JsonKey(name: 'TraveldocType') String? traveldocType;
  @JsonKey(name: 'PassportPlace') String? passportPlace;
  @JsonKey(name: 'PassportNo') String? passportNo;
  @JsonKey(name: 'PassportDate') String? passportDate;
  @JsonKey(name: 'Countenm') String? countenm;
  @JsonKey(name: 'inDate') String? inDate;
  @JsonKey(name: 'PermitDate') String? permitDate;
  @JsonKey(name: 'Convenm') String? convenm;
  @JsonKey(name: 'Status') String? status;
  @JsonKey(name: 'Reason') String? reason;
  @JsonKey(name: 'Building') String? building;
  @JsonKey(name: 'Addr') String? addr;
  @JsonKey(name: 'Road') String? road;
  @JsonKey(name: 'tmbSeqno') String? tmbSeqno;
  @JsonKey(name: 'tmbDecs') String? tmbDecs;
  @JsonKey(name: 'ampSeqno') String? ampSeqno;
  @JsonKey(name: 'ampDecs') String? ampDecs;
  @JsonKey(name: 'pvSeqno') String? pvSeqno;
  @JsonKey(name: 'pvDecs') String? pvDecs;

}

@JsonSerializable()
class ListTm61Dto {
  ListTm61Dto({
    this.status,
    this.data,
  });

  factory ListTm61Dto.fromJson(Map<String, dynamic> json) => _$ListTm61DtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListTm61DtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<Tm61Dto>? data;
}

class Tm61Constant {
  Tm61Constant._();

  static const String m_fullname = 'ชื่อ สกุล';
  static const String m_birthDate = 'วัน เดือน ปีเกิด';
  static const String m_nationenm = 'สัญชาติ';
  static const String m_traveldocType = 'หนังสือเดินทาง/เอกสารใช้แทนหนังสือเดินทาง';
  static const String m_passportPlace = 'หนังสือเดินทางออกให้ที่';
  static const String m_passportNo = 'เลขที่หนังสือเดินทาง';
  static const String m_passportDate = 'หนังสือเดินทางออกวันที่';
  static const String m_countenm = 'เดินทางมาจากประเทศ:';
  static const String m_inDate = 'วันที่เดินทางเข้า';
  static const String m_permitDate = 'อนุญาตให้อยู่ในราชอาณาจักรถึงวันที่';
  static const String m_convenm = 'เดินทางโดยพาหนะ';
  static const String m_status = 'สถานะของการขออยู่ฯ';
  static const String m_reason = 'เหตุผลการขออยู่ต่อฯ';
  static const String m_building = 'อาคาร';
  static const String m_addr = 'อยู่บ้านเลขที่';
  static const String m_road = 'ถนน';
  static const String m_tmbSeqno = 'รหัสตำบล/แขวง';
  static const String m_tmbDecs = 'ตำบล/แขวง';
  static const String m_ampSeqno = 'รหัสอำเภอ/เขต';
  static const String m_ampDecs = 'อำเภอ/เขต';
  static const String m_pvSeqno = 'รหัสจังหวัด';
  static const String m_pvDecs = 'จังหวัด';
}