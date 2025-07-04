import 'package:json_annotation/json_annotation.dart';

part 'person_dto.g.dart';

@JsonSerializable()
class PersonDto {
  PersonDto({
    this.pID,
    this.title,
    this.firstName,
    this.lastName,
    this.birthdate,
    this.gender,
    this.age,
    this.moveInDate,
    this.peopleStatus,
    this.nationality,
    this.houseOwnerStatus,
    this.fatherPID,
    this.fatherName,
    this.fatherNationality,
    this.motherPID,
    this.motherName,
    this.motherNationality,
    this.houseID,
    this.houseNumber,
    this.moo,
    this.alley,
    this.soi,
    this.road,
    this.tambon,
    this.amphur,
    this.province,
    this.changedNationalityStatus,
    this.changedNationalityDate,
    this.address,
  });

  factory PersonDto.fromJson(Map<String, dynamic> json) => _$PersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);

  @JsonKey(name: 'PID') String? pID;
  @JsonKey(name: 'Title') String? title;
  @JsonKey(name: 'Firstname') String? firstName;
  @JsonKey(name: 'Lastname') String? lastName;
  @JsonKey(name: 'Birthdate') String? birthdate;
  @JsonKey(name: 'Gender') String? gender;
  @JsonKey(name: 'Age') String? age;
  @JsonKey(name: 'MoveInDate') String? moveInDate;
  @JsonKey(name: 'PeopleStatus') String? peopleStatus;
  @JsonKey(name: 'Nationality') String? nationality;
  @JsonKey(name: 'HouseOwnerStatus') String? houseOwnerStatus;
  @JsonKey(name: 'FatherPID') String? fatherPID;
  @JsonKey(name: 'FatherName') String? fatherName;
  @JsonKey(name: 'FatherNationality') String? fatherNationality;
  @JsonKey(name: 'MotherPID') String? motherPID;
  @JsonKey(name: 'MotherName') String? motherName;
  @JsonKey(name: 'MotherNationality') String? motherNationality;
  @JsonKey(name: 'HouseID') String? houseID;
  @JsonKey(name: 'HouseNumber') String? houseNumber;
  @JsonKey(name: 'Moo') String? moo;
  @JsonKey(name: 'Alley') String? alley;
  @JsonKey(name: 'Soi') String? soi;
  @JsonKey(name: 'Road') String? road;
  @JsonKey(name: 'Tambon') String? tambon;
  @JsonKey(name: 'Amphur') String? amphur;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'ChangedNationalityStatus') String? changedNationalityStatus;
  @JsonKey(name: 'ChangedNationalityDate') String? changedNationalityDate;
  @JsonKey(name: 'Address') String? address;

}

@JsonSerializable()
class ListPersonDto {
  ListPersonDto({
    this.status,
    this.data,
  });

  factory ListPersonDto.fromJson(Map<String, dynamic> json) => _$ListPersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListPersonDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<PersonDto>? data;
}

class PersonConstant {
  PersonConstant._();

  static const String m_pID = 'เลขบัตรประชาชน';
  static const String m_title = 'คำนำหน้าชื่อ';
  static const String m_firstName = 'ชื่อ';
  static const String m_lastName = 'สกุล';
  static const String m_birthdate = 'วัน เดือน ปีเกิด';
  static const String m_gender = 'เพศ';
  static const String m_age = 'อายุ';
  static const String m_moveInDate = 'วัน/เดือน/ปี ย้ายเข้า';
  static const String m_peopleStatus = 'สถานภาพบุคคล';
  static const String m_nationality = 'สัญชาติ';
  static const String m_houseOwnerStatus = 'สถานภาพเจ้าบ้าน';
  static const String m_fatherPID = 'เลขบัตรปชช. บิดา';
  static const String m_fatherName = 'ชื่อบิดา';
  static const String m_fatherNationality = 'สัญชาติ';
  static const String m_motherPID = 'เลขบัตรปชช. มารดา';
  static const String m_motherName = 'ชื่อมารดา';
  static const String m_motherNationality = 'สัญชาติ';
  static const String m_houseID = 'เลขรหัสประจำบ้าน';
  static const String m_houseNumber = 'บ้านเลขที่';
  static const String m_moo = 'หมู่ที่';
  static const String m_alley = 'ตรอก';
  static const String m_soi = 'ซอย';
  static const String m_road = 'ถนน';
  static const String m_tambon = 'ตำบล';
  static const String m_amphur = 'อำเภอ';
  static const String m_province = 'จังหวัด';
  static const String m_changedNationalityStatus = 'การเปลี่ยนแปลงสัญชาติ';
  static const String m_changedNationalityDate = 'วันที่เปลี่ยนสัญชาติ';
  static const String m_address = 'ที่อยู่';
}