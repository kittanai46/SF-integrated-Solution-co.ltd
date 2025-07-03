import 'package:json_annotation/json_annotation.dart';

part 'house_dto.g.dart';

@JsonSerializable()
class HouseDto {
  HouseDto({
    this.houseID,
    this.registerName,
    this.houseNo,
    this.moo,
    this.alley,
    this.soi,
    this.road,
    this.tambon,
    this.amphur,
    this.province,
    this.houseType,
    this.buildDate,
    this.sellDate,
    this.villageName,
    this.buildingName,
    this.buildingPlace,
    this.postcode,
    this.houseShape,
    this.houseSize,
    this.areaNumber,
    this.document,
    this.documentNo,
    this.laneAreaSize,
    this.telNumber,
    this.approvalNo,
    this.urbanAreaName,
  });

  factory HouseDto.fromJson(Map<String, dynamic> json) => _$HouseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HouseDtoToJson(this);

  @JsonKey(name: 'HouseID') String? houseID;
  @JsonKey(name: 'RegisterName') String? registerName;
  @JsonKey(name: 'HouseNo') String? houseNo;
  @JsonKey(name: 'Moo') String? moo;
  @JsonKey(name: 'Alley') String? alley;
  @JsonKey(name: 'Soi') String? soi;
  @JsonKey(name: 'Road') String? road;
  @JsonKey(name: 'Tambon') String? tambon;
  @JsonKey(name: 'Amphur') String? amphur;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'HouseType') String? houseType;
  @JsonKey(name: 'BuildDate') String? buildDate;
  @JsonKey(name: 'SellDate') String? sellDate;
  @JsonKey(name: 'VillageName') String? villageName;
  @JsonKey(name: 'BuildingName') String? buildingName;
  @JsonKey(name: 'BuildingPlace') String? buildingPlace;
  @JsonKey(name: 'Postcode') String? postcode;
  @JsonKey(name: 'HouseShape') String? houseShape;
  @JsonKey(name: 'HouseSize') String? houseSize;
  @JsonKey(name: 'AreaNumber') String? areaNumber;
  @JsonKey(name: 'document') String? document;
  @JsonKey(name: 'documentNo') String? documentNo;
  @JsonKey(name: 'LaneAreaSize') String? laneAreaSize;
  @JsonKey(name: 'TelNumber') String? telNumber;
  @JsonKey(name: 'ApprovalNo') String? approvalNo;
  @JsonKey(name: 'UrbanAreaName') String? urbanAreaName;

}

@JsonSerializable()
class ListHouseDto {
  ListHouseDto({
    this.status,
    this.data,
  });

  factory ListHouseDto.fromJson(Map<String, dynamic> json) => _$ListHouseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListHouseDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<HouseDto>? data;
}

class HouseConstant {
  HouseConstant._();

  static const String m_houseID = 'เลขรหัสประจำบ้าน';
  static const String m_registerName = 'ชื่อสำนักทะเบียน';
  static const String m_houseNo = 'บ้านเลขที่';
  static const String m_moo = 'หมู่';
  static const String m_alley = 'ตรอก';
  static const String m_soi = 'ซอย';
  static const String m_road = 'ถนน';
  static const String m_tambon = 'ตำบล';
  static const String m_amphur = 'อำเภอ';
  static const String m_province = 'จังหวัด';
  static const String m_houseType = 'ประเภทบ้าน';
  static const String m_buildDate = 'วันที่อนุญาตปลูกสร้าง';
  static const String m_sellDate = 'วันที่จำหน่วย';
  static const String m_villageName = 'ชื่อหมู่บ้านจัดสรร';
  static const String m_buildingName = 'ชื่ออาคาร';
  static const String m_buildingPlace = 'ฝั่งที่ตั้งอาคาร';
  static const String m_postcode = 'รหัสไปรษณีย์';
  static const String m_houseShape = 'ลักษณะบ้าน';
  static const String m_houseSize = 'ขนาดของบ้าน (ตร.ม)';
  static const String m_areaNumber = 'จำนวนพื้นที่อยุ่อาศัยตาม พ.ร.บ. สาธารณสุข (ลบ.ม.)';
  static const String m_document = 'เอกสารการถือครองที่ดิน';
  static const String m_documentNo = 'เลขที่เอกสารการถือครองที่ดิน';
  static const String m_laneAreaSize = 'ขนาดที่ดินถือครองทั้งหมด (ตร.ว)';
  static const String m_telNumber = 'หมายเลขโทรศัพท์';
  static const String m_approvalNo = 'เลขที่หนังสืออนุมัติให้ปลูกสร้าง';
  static const String m_urbanAreaName = 'ชื่อชุมชน';
}