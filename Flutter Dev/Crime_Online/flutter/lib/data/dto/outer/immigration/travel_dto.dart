import 'package:json_annotation/json_annotation.dart';

part 'travel_dto.g.dart';

@JsonSerializable()
class TravelDto {
  TravelDto({
    this.tMRunNo,
    this.passportNo,
    this.travelDate,
    this.travelType,
    this.eFullname,
    this.sex,
    this.nationENM,
    this.birthDate,
    this.tM6No,
    this.isInputPassport,
  });

  factory TravelDto.fromJson(Map<String, dynamic> json) => _$TravelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TravelDtoToJson(this);

  @JsonKey(name: 'TMRunNo') String? tMRunNo;
  @JsonKey(name: 'PassportNo') String? passportNo;
  @JsonKey(name: 'TravelDate') String? travelDate;  //Date and Time
  @JsonKey(name: 'TravelType') String? travelType;
  @JsonKey(name: 'EFullname') String? eFullname;
  @JsonKey(name: 'Sex') String? sex;
  @JsonKey(name: 'NationENM') String? nationENM;
  @JsonKey(name: 'BirthDate') String? birthDate;  //Date and Time
  @JsonKey(name: 'TM6No') String? tM6No;
  bool? isInputPassport = false;
}

@JsonSerializable()
class ListTravelDto {
  ListTravelDto({
    this.status,
    this.data,
  });

  factory ListTravelDto.fromJson(Map<String, dynamic> json) => _$ListTravelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListTravelDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<TravelDto>? data;
}

class TravelConstant {
  TravelConstant._();

  static const String m_tMRunNo = 'หมายเลขอ้างอิง';
  static const String m_passportNo = 'หมายเลขพาสปอร์ต';
  static const String m_travelDate = 'วันที่เดินทาง';
  static const String m_travelType = 'ประเภทการเดินทาง';
  static const String m_eFullname = 'ชื่อ สกุล ผู้โดยสาร (Eng)';
  static const String m_sex = 'เพศ';
  static const String m_nationENM = 'สัญชาติ';
  static const String m_birthDate = 'วันเดือนปี เกิด';
  static const String m_tM6No = 'หมายเลขบัตร ตม.6';
}