import 'package:json_annotation/json_annotation.dart';

part 'imm_dto.g.dart';

@JsonSerializable()
class ImmDto {
  ImmDto({
    this.mvmntId,
    this.passportNo,
    this.countryCode,
    this.countryName,
    this.firstName,
    this.middleName,
    this.surname,
    this.issueDate,
    this.expiryDate,
    this.birthDate,
    this.gender,
    this.passportType,
    this.tripDtm,
    this.tripDtmSort,
    this.flightNo,
    this.tripType,
    this.visaType,
    this.visaDesc,
    this.reason,
    this.borderPostName,
    this.visaPermitDay,
    this.depCancelDate,
    this.thResidence,
    this.visaNumber,
    this.visaExp,
    this.insAt,
  });

  factory ImmDto.fromJson(Map<String, dynamic> json) => _$ImmDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImmDtoToJson(this);

  @JsonKey(name: 'MVMNTID') String? mvmntId;
  @JsonKey(name: 'PASSPORTNO') String? passportNo;
  @JsonKey(name: 'COUNTRYCODE') String? countryCode;
  @JsonKey(name: 'COUNTRYNAME') String? countryName;
  @JsonKey(name: 'FIRSTNAME') String? firstName;
  @JsonKey(name: 'MIDDLENAME') String? middleName;
  @JsonKey(name: 'SURNAME') String? surname;
  @JsonKey(name: 'ISSUEDATE') String? issueDate;
  @JsonKey(name: 'EXPIRYDATE') String? expiryDate;
  @JsonKey(name: 'BIRTHDATE') String? birthDate;
  @JsonKey(name: 'GENDER') String? gender;
  @JsonKey(name: 'PASSPORTTYPE') String? passportType;
  @JsonKey(name: 'TRIPDTM') String? tripDtm;
  @JsonKey(name: 'TRIPDTM_SORT') String? tripDtmSort;
  @JsonKey(name: 'FLIGHTNO') String? flightNo;
  @JsonKey(name: 'TRIPTYPE') String? tripType;
  @JsonKey(name: 'VISATYPE') String? visaType;
  @JsonKey(name: 'VISADESC') String? visaDesc;
  @JsonKey(name: 'REASON') String? reason;
  @JsonKey(name: 'BORDERPOSTNAME') String? borderPostName;
  @JsonKey(name: 'VISAPERMITDAY') String? visaPermitDay;
  @JsonKey(name: 'DEPCANCELDATE') String? depCancelDate;
  @JsonKey(name: 'THRESIDENCE') String? thResidence;
  @JsonKey(name: 'VISA_NUMBER') String? visaNumber;
  @JsonKey(name: 'VISA_EXP') String? visaExp;
  @JsonKey(name: 'INS_AT') String? insAt;
}

@JsonSerializable()
class ListImmDto {
  ListImmDto({
    this.status,
    this.data,
  });

  factory ListImmDto.fromJson(Map<String, dynamic> json) => _$ListImmDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListImmDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<ImmDto>? data;
}

class ImmConstant {
  ImmConstant._();

  static const String m_mvmntId = 'รหัสตรวจคนเข้าเมือง';
  static const String m_passportNo = 'เลขพาสปอร์ต';
  static const String m_countryCode = 'รหัสสัญชาติ';
  static const String m_countryName = 'สัญชาติ';
  static const String m_firstName = 'ชื่อ';
  static const String m_middleName = 'ชื่อกลาง';
  static const String m_surname = 'นามสกุล';
  static const String m_issueDate = 'วันที่ออกหนังสือเดินทาง';
  static const String m_expiryDate = 'วันหมดอายุหนังสือเดินทาง';
  static const String m_birthDate = 'วันเดือนปีเกิด';
  static const String m_gender = 'เพศ';
  static const String m_passportType = 'ประเภทหนังสือเดินทาง';
  static const String m_tripDtm = 'วันที่เดินทาง';
  static const String m_tripDtmSort = 'วันที่เดินทาง';
  static const String m_flightNo = 'Flight No.';
  static const String m_tripType = 'ประเภทการเดินทาง';
  static const String m_visaType = 'ประเภท VISA';
  static const String m_visaDesc = 'รายละเอียด VISA';
  static const String m_reason = 'เหตุผล';
  static const String m_borderPostName = 'ด่านที่เดินทาง';
  static const String m_visaPermitDay = 'วันอนุญาต VISA';
  static const String m_depCancelDate = 'การยกเลิก';
  static const String m_thResidence = 'จังหวัดที่เข้าพัก';
  static const String m_visaNumber = 'เลข VISA';
  static const String m_visaExp = 'วันที่หมดอายุ VISA';
  static const String m_insAt = 'INS_AT';
}