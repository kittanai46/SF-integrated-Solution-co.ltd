import 'package:json_annotation/json_annotation.dart';

part 'car_flashing_light_license_dto.g.dart';

@JsonSerializable()
class CarFllDto {
  CarFllDto({
    this.org_name,
    this.org_no,
    this.org_road,
    this.org_tambon,
    this.org_amphur,
    this.org_province,
    this.car_type,
    this.car_plate,
    this.car_brand,
    this.car_model,
    this.car_color,
    this.car_body,
    this.use_in_business,
    this.permitted_light_colors,
    this.issue_date,
    this.expire_date,
    this.isexpire,

  });

  factory CarFllDto.fromJson(Map<String, dynamic> json) => _$CarFllDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CarFllDtoToJson(this);

  @JsonKey(name: 'org_name') String? org_name;
  @JsonKey(name: 'org_no') String? org_no;
  @JsonKey(name: 'org_road') String? org_road;
  @JsonKey(name: 'org_tambon') String? org_tambon;
  @JsonKey(name: 'org_amphur') String? org_amphur;
  @JsonKey(name: 'org_province') String? org_province;
  @JsonKey(name: 'car_type') String? car_type;
  @JsonKey(name: 'car_plate') String? car_plate;
  @JsonKey(name: 'car_brand') String? car_brand;
  @JsonKey(name: 'car_model') String? car_model;
  @JsonKey(name: 'car_color') String? car_color;
  @JsonKey(name: 'car_body') String? car_body;
  @JsonKey(name: 'use_in_business') String? use_in_business;
  @JsonKey(name: 'permitted_light_colors') String? permitted_light_colors;
  @JsonKey(name: 'issue_date') String? issue_date;
  @JsonKey(name: 'expire_date') String? expire_date;
  @JsonKey(name: 'isexpire') String? isexpire;

}

@JsonSerializable()
class ListCarFllDto {
  ListCarFllDto({
    this.status,
    this.data,
  });

  factory ListCarFllDto.fromJson(Map<String, dynamic> json) => _$ListCarFllDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListCarFllDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<CarFllDto>? data;
}

class CarFllConstant {
  CarFllConstant._();

  static const String m_org_name = 'ชื่อหน่วยงาน';
  static const String m_org_no = 'เลขที่';
  static const String m_org_road = 'ถนน';
  static const String m_org_tambon = 'ตำบล/แขวง';
  static const String m_org_amphur = 'อำเภอ/เขต';
  static const String m_org_province = 'จังหวัด';
  static const String m_car_type = 'ประเภทรถ';
  static const String m_car_plate = 'ทะเบียนรถ';
  static const String m_car_brand = 'ยี่ห้อ';
  static const String m_car_model = 'รุ่น';
  static const String m_car_color = 'สี';
  static const String m_car_body = 'เลขตัวถัง';
  static const String m_use_in_business = 'ใช้ในกิจการ';
  static const String m_permitted_light_colors = 'สีสัญญาณไฟที่ได้รับอนุญาต';
  static const String m_issue_date = 'วันที่อนุญาต';
  static const String m_expire_date = 'วันที่หมดอายุ';
  static const String m_isexpire = 'สถานะการหมดอายุ';
}