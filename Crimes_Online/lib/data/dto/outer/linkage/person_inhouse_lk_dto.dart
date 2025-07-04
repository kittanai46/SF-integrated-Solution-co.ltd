import 'package:json_annotation/json_annotation.dart';

part 'person_inhouse_lk_dto.g.dart';

@JsonSerializable()
class PersonInHouseLkDto {
  PersonInHouseLkDto({
    this.age,
    this.fullName,
    this.gender,
    this.personalID,
    this.statusOfPersonDesc,
    this.total,
  });

  factory PersonInHouseLkDto.fromJson(Map<String, dynamic> json) => _$PersonInHouseLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonInHouseLkDtoToJson(this);

  @JsonKey(name: 'personalInHouse.age') String? age;
  @JsonKey(name: 'personalInHouse.fullName') String? fullName;
  @JsonKey(name: 'personalInHouse.gender') String? gender;
  @JsonKey(name: 'personalInHouse.personalID') String? personalID;
  @JsonKey(name: 'personalInHouse.statusOfPersonDesc') String? statusOfPersonDesc;
  @JsonKey(name: 'total') int? total;

}

@JsonSerializable()
class ListPersonInHouseLkDto {
  ListPersonInHouseLkDto({
    this.status,
    this.data,
  });

  factory ListPersonInHouseLkDto.fromJson(Map<String, dynamic> json) => _$ListPersonInHouseLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPersonInHouseLkDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PersonInHouseLkDto>? data;
}

class PersonInHouseLkConstant {
  PersonInHouseLkConstant._();

  static const String m_age = 'อายุ (ปี)';
  static const String m_fullName = 'ชื่อ-สกุล';
  static const String m_gender = 'เพศ';
  static const String m_personalID = 'เลขประจำตัวประชาชน';
  static const String m_statusOfPersonDesc = 'สถานภาพบุคคล';
  static const String m_total = 'จำนวนผู้อาศัยตามทะเบียนบ้าน';
}