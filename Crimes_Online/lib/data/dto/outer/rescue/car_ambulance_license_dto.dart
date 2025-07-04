import 'package:json_annotation/json_annotation.dart';

part 'car_ambulance_license_dto.g.dart';

@JsonSerializable()
class CarAmlDto {
  CarAmlDto({
    this.org_name_allow,
    this.car_type,
    this.car_plate,
    this.car_brand,
    this.car_model,
    this.car_color,
    this.car_body,
    this.occ_pid,
    this.occ_fullname,
    this.applicant_pid,
    this.applicant_fullname,
    this.issue_date,
    this.expire_date,
    this.isexpire,

  });

  factory CarAmlDto.fromJson(Map<String, dynamic> json) => _$CarAmlDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CarAmlDtoToJson(this);

  @JsonKey(name: 'org_name_allow') String? org_name_allow;
  @JsonKey(name: 'car_type') String? car_type;
  @JsonKey(name: 'car_plate') String? car_plate;
  @JsonKey(name: 'car_brand') String? car_brand;
  @JsonKey(name: 'car_model') String? car_model;
  @JsonKey(name: 'car_color') String? car_color;
  @JsonKey(name: 'car_body') String? car_body;
  @JsonKey(name: 'occ_pid') String? occ_pid;
  @JsonKey(name: 'occ_fullname') String? occ_fullname;
  @JsonKey(name: 'applicant_pid') String? applicant_pid;
  @JsonKey(name: 'applicant_fullname') String? applicant_fullname;
  @JsonKey(name: 'issue_date') String? issue_date;
  @JsonKey(name: 'expire_date') String? expire_date;
  @JsonKey(name: 'isexpire') String? isexpire;

}

@JsonSerializable()
class ListCarAmlDto {
  ListCarAmlDto({
    this.status,
    this.data,
  });

  factory ListCarAmlDto.fromJson(Map<String, dynamic> json) => _$ListCarAmlDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListCarAmlDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<CarAmlDto>? data;
}

class CarAmlConstant {
  CarAmlConstant._();

  static const String m_org_name_allow = 'ชื่อหน่วยงาน';
  static const String m_car_type = 'ประเภทรถ';
  static const String m_car_plate = 'ทะเบียนรถ';
  static const String m_car_brand = 'ยี่ห้อ';
  static const String m_car_model = 'รุ่น';
  static const String m_car_color = 'สี';
  static const String m_car_body = 'เลขตัวถัง';
  static const String m_occ_pid = 'เลข ปชช. ผู้ครอบครอง';
  static const String m_occ_fullname = 'ชื่อผู้ครอบครอบ';
  static const String m_applicant_pid = 'เลข ปชช. ผู้ขอใบอนุญาต';
  static const String m_applicant_fullname = 'ชื่อผู้ขอใบอนุญาต';
  static const String m_issue_date = 'วันที่ออกใบอนุญาต';
  static const String m_expire_date = 'วันที่หมดอายุ';
  static const String m_isexpire = 'สถานะการหมดอายุ';
}