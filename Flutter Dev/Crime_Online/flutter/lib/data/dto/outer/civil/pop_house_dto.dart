import 'package:json_annotation/json_annotation.dart';

part 'pop_house_dto.g.dart';

@JsonSerializable()
class PopHouseDto {
  PopHouseDto({
    this.pID,
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.houseID,
  });

  factory PopHouseDto.fromJson(Map<String, dynamic> json) => _$PopHouseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PopHouseDtoToJson(this);

  @JsonKey(name: 'PID') String? pID;
  @JsonKey(name: 'FirstName') String? firstName;
  @JsonKey(name: 'LastName') String? lastName;
  @JsonKey(name: 'Gender') String? gender;
  @JsonKey(name: 'BirthDate') String? birthDate;
  @JsonKey(name: 'HouseID') String? houseID;

}

@JsonSerializable()
class ListPopHouseDto {
  ListPopHouseDto({
    this.status,
    this.data,
  });

  factory ListPopHouseDto.fromJson(Map<String, dynamic> json) => _$ListPopHouseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPopHouseDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PopHouseDto>? data;
}

class PopHouseConstant {
  PopHouseConstant._();

  static const String m_pID = 'เลขบัตรประชาชน';
  static const String m_firstName = 'ชื่อ';
  static const String m_lastName = 'นามสกุล';
  static const String m_gender = 'เพศ';
  static const String m_birthDate = 'วันเดือนปีเกิด';
  static const String m_houseID = 'เลขรหัสประจำบ้าน';
}