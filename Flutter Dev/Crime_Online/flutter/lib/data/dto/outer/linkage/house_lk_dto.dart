import 'package:json_annotation/json_annotation.dart';

part 'house_lk_dto.g.dart';

@JsonSerializable()
class HouseLkDto {
  HouseLkDto({
    this.alleyCode,
    this.alleyDesc,
    this.alleyWayCode,
    this.alleyWayDesc,
    this.dateOfTerminate,
    this.districtCode,
    this.districtDesc,
    this.houseID,
    this.houseNo,
    this.houseType,
    this.houseTypeDesc,
    this.provinceCode,
    this.provinceDesc,
    this.rcodeCode,
    this.rcodeDesc,
    this.roadCode,
    this.roadDesc,
    this.subdistrictCode,
    this.subdistrictDesc,
    this.villageNo,
  });

  factory HouseLkDto.fromJson(Map<String, dynamic> json) => _$HouseLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HouseLkDtoToJson(this);
/*{
  "houseID": 11031779558,
  "districtCode": 3,
  "alleyWayCode": 0,
  "rcodeDesc": "อำเภอบางพลี",
  "districtDesc": "บางพลี",
  "provinceCode": 11,
  "houseType": 1,
  "alleyWayDesc": null,
  "dateOfTerminate": 0,
  "houseTypeDesc": "บ้าน",
  "roadCode": 0,
  "roadDesc": null,
  "subdistrictDesc": "บางแก้ว",
  "alleyCode": 0,
  "subdistrictCode": 2,
  "villageNo": 9,
  "alleyDesc": null,
  "houseNo": "68\/81",
  "rcodeCode": "1103",
  "provinceDesc": "สมุทรปราการ"
}*/
  @JsonKey(name: 'alleyCode') String? alleyCode;
  @JsonKey(name: 'alleyDesc') String? alleyDesc;
  @JsonKey(name: 'alleyWayCode') String? alleyWayCode;
  @JsonKey(name: 'alleyWayDesc') String? alleyWayDesc;
  @JsonKey(name: 'dateOfTerminate') String? dateOfTerminate;
  @JsonKey(name: 'districtCode') String? districtCode;
  @JsonKey(name: 'districtDesc') String? districtDesc;
  @JsonKey(name: 'houseID') String? houseID;
  @JsonKey(name: 'houseNo') String? houseNo;
  @JsonKey(name: 'houseType') String? houseType;
  @JsonKey(name: 'houseTypeDesc') String? houseTypeDesc;
  @JsonKey(name: 'provinceCode') String? provinceCode;
  @JsonKey(name: 'provinceDesc') String? provinceDesc;
  @JsonKey(name: 'rcodeCode') String? rcodeCode;
  @JsonKey(name: 'rcodeDesc') String? rcodeDesc;
  @JsonKey(name: 'roadCode') String? roadCode;
  @JsonKey(name: 'roadDesc') String? roadDesc;
  @JsonKey(name: 'subdistrictCode') String? subdistrictCode;
  @JsonKey(name: 'subdistrictDesc') String? subdistrictDesc;
  @JsonKey(name: 'villageNo') String? villageNo;

}

@JsonSerializable()
class ListHouseLkDto {
  ListHouseLkDto({
    this.status,
    this.data,
  });

  factory ListHouseLkDto.fromJson(Map<String, dynamic> json) => _$ListHouseLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListHouseLkDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<HouseLkDto>? data;
}

class HouseLkConstant {
  HouseLkConstant._();

  static const String m_alleyCode = 'เลขรหัสซอย';
  static const String m_alleyDesc = 'ชื่อซอย';
  static const String m_alleyWayCode = 'เลขรหัสตรอก';
  static const String m_alleyWayDesc = 'ชื่อตรอก';
  static const String m_dateOfTerminate = 'วันที่จำหน่าย';
  static const String m_districtCode = 'เลขรหัสอำเภอ';
  static const String m_districtDesc = 'ชื่ออำเภอ';
  static const String m_houseID = 'เลขรหัสประจำบ้าน';
  static const String m_houseNo = 'บ้านเลขที่';
  static const String m_houseType = 'เลขรหัสประเภทบ้าน';
  static const String m_houseTypeDesc = 'ประเภทบ้าน';
  static const String m_provinceCode = 'เลขรหัสจังหวัด';
  static const String m_provinceDesc = 'ชื่อจังหวัด';
  static const String m_rcodeCode = 'เลขรหัสสำนักทะเบียน';
  static const String m_rcodeDesc = 'ชื่อสำนักทะเบียน';
  static const String m_roadCode = 'เลขรหัสถนน';
  static const String m_roadDesc = 'ชื่อถนน';
  static const String m_subdistrictCode = 'เลขรหัสตำบล';
  static const String m_subdistrictDesc = 'ชื่อตำบล';
  static const String m_villageNo = 'เลขหมู่ที่';
}