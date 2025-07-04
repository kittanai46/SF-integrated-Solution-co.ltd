import 'package:json_annotation/json_annotation.dart';

part 'worker_dto.g.dart';

@JsonSerializable()
class WorkerDto {
  WorkerDto({
    this.workerID,
    this.fullNameEN,
    this.firstName,
    this.lastName,
    this.marryStatus,
    this.peopleStatus,
    this.birthdate,
    this.gender,
    this.nationality,
    this.oldWorkerID,
    this.houseID,
    this.houseNumber,
    this.moo,
    this.alley,
    this.soi,
    this.road,
    this.tambon,
    this.amphur,
    this.province,
    this.place,
    this.sellHouseDate,
  });

  factory WorkerDto.fromJson(Map<String, dynamic> json) => _$WorkerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerDtoToJson(this);
 
  @JsonKey(name: 'WorkerID') String? workerID;
  @JsonKey(name: 'FullNameEN') String? fullNameEN;
  @JsonKey(name: 'FirstName') String? firstName;
  @JsonKey(name: 'LastName') String? lastName;
  @JsonKey(name: 'MarryStatus') String? marryStatus;
  @JsonKey(name: 'PeopleStatus') String? peopleStatus;
  @JsonKey(name: 'Birthdate') String? birthdate;
  @JsonKey(name: 'Gender') String? gender;
  @JsonKey(name: 'Nationality') String? nationality;
  @JsonKey(name: 'OldWorkerID') String? oldWorkerID;
  @JsonKey(name: 'HouseID') String? houseID;
  @JsonKey(name: 'HouseNumber') String? houseNumber;
  @JsonKey(name: 'Moo') String? moo;
  @JsonKey(name: 'Alley') String? alley;
  @JsonKey(name: 'Soi') String? soi;
  @JsonKey(name: 'Road') String? road;
  @JsonKey(name: 'Tambon') String? tambon;
  @JsonKey(name: 'Amphur') String? amphur;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'Place') String? place;
  @JsonKey(name: 'SellHouseDate') String? sellHouseDate;

}

@JsonSerializable()
class ListWorkerDto {
  ListWorkerDto({
    this.status,
    this.data,
  });

  factory ListWorkerDto.fromJson(Map<String, dynamic> json) => _$ListWorkerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListWorkerDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<WorkerDto>? data;
}

class WorkerConstant {
  WorkerConstant._();

  static const String m_workerID = 'เลขประจำคนต่างด้าว';
  static const String m_fullNameEN = 'ชื่อ-สกุล (อังกฤษ)';
  static const String m_firstName = 'ชื่อ';
  static const String m_lastName = 'สกุล';
  static const String m_marryStatus = 'สถานภาพสมรส';
  static const String m_peopleStatus = 'สถานภาพบุคคล';
  static const String m_birthdate = 'วัน/เดือน/ปี เกิด';
  static const String m_gender = 'เพศ';
  static const String m_nationality = 'สัญชาติ';
  static const String m_oldWorkerID = 'เลขประจำตัวต่างด้าวเก่า';
  static const String m_houseID = 'เลขรหัสประจำบ้าน';
  static const String m_houseNumber = 'บ้านเลขที่';
  static const String m_moo = 'หมู่ที่';
  static const String m_alley = 'ตรอก';
  static const String m_soi = 'ซอย';
  static const String m_road = 'ถนน';
  static const String m_tambon = 'ตำบล';
  static const String m_amphur = 'อำเภอ';
  static const String m_province = 'จังหวัด';
  static const String m_place = 'สถานที่พักอาศัย';
  static const String m_sellHouseDate = 'วัน/เดือน/ปี ที่จำหน่ายบ้าน';
}