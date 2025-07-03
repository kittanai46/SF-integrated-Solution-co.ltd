import 'package:json_annotation/json_annotation.dart';

part 'driver_license_info_dto.g.dart';

@JsonSerializable()
class DriverLicenseInfoDto {
  DriverLicenseInfoDto({
    this.docType,
    this.idNo,
    this.titleDesc,
    this.fName,
    this.lName,
    this.titleEngDesc,
    this.fNameEng,
    this.lNameEng,
    this.birthDate,
    this.sex,
    this.sexDesc,
    this.addrNo,
    this.bldName,
    this.villageName,
    this.villageNo,
    this.soi,
    this.street,
    this.locCode,
    this.zipCode,
    this.locDesc,
    this.offLocCode,
    this.pltDesc,
    this.locFullDesc,
    this.natCode,
    this.rcpNo,
    this.pcNo,
    this.conditionDesc,
    this.natDesc,
    this.excFee,
    this.rvkFlag,
    this.pltCode,
    this.pltNo,
    this.issDate,
    this.expDate,
    this.srlNo,
    this.tambon,
    this.amphur,
    this.province,
  });

  factory DriverLicenseInfoDto.fromJson(Map<String, dynamic> json) => _$DriverLicenseInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DriverLicenseInfoDtoToJson(this);

  @JsonKey(name: 'DRL04_docType') String? docType;
  @JsonKey(name: 'DRL04_ID_NO') String? idNo;
  @JsonKey(name: 'DRL04_TitleDesc') String? titleDesc;
  @JsonKey(name: 'DRL04_FNAME') String? fName;
  @JsonKey(name: 'DRL04_Lname') String? lName;
  @JsonKey(name: 'DRL04_TitleEngDesc') String? titleEngDesc;
  @JsonKey(name: 'DRL04_FNameEng') String? fNameEng;
  @JsonKey(name: 'DRL04_LNameEng') String? lNameEng;
  @JsonKey(name: 'DRL04_BirthDate') String? birthDate;
  @JsonKey(name: 'DRL04_SEX') String? sex;
  @JsonKey(name: 'DRL04_SEX_DESC') String? sexDesc;
  @JsonKey(name: 'DRL04_AddrNo') String? addrNo;
  @JsonKey(name: 'DRL04_BldName') String? bldName;
  @JsonKey(name: 'DRL04_VillageName') String? villageName;
  @JsonKey(name: 'DRL04_VillageNo') String? villageNo;
  @JsonKey(name: 'DRL04_Soi') String? soi;
  @JsonKey(name: 'DRL04_Street') String? street;
  @JsonKey(name: 'DRL04_LocCode') String? locCode;
  @JsonKey(name: 'DRL04_ZipCode') String? zipCode;
  @JsonKey(name: 'DRL04_LocDesc') String? locDesc;
  @JsonKey(name: 'DRL04_OffLocCode') String? offLocCode;
  @JsonKey(name: 'DRL04_pltDesc') String? pltDesc;
  @JsonKey(name: 'DRL04_locFullDesc') String? locFullDesc;
  @JsonKey(name: 'DRL04_natCode') String? natCode;
  @JsonKey(name: 'DRL04_rcpNo') String? rcpNo;
  @JsonKey(name: 'DRL04_pcNo') String? pcNo;
  @JsonKey(name: 'DRL04_conditionDesc') String? conditionDesc;
  @JsonKey(name: 'DRL04_natDesc') String? natDesc;
  @JsonKey(name: 'DRL04_excFee') String? excFee;
  @JsonKey(name: 'DRL04_rvkFlag') String? rvkFlag;
  @JsonKey(name: 'DRL04_pltCode') String? pltCode;
  @JsonKey(name: 'DRL04_pltNo') String? pltNo;
  @JsonKey(name: 'DRL04_issDate') String? issDate;
  @JsonKey(name: 'DRL04_expDate') String? expDate;
  @JsonKey(name: 'DRL04_srlNo') String? srlNo;
  @JsonKey(name: 'DRL04_Tambon') String? tambon;
  @JsonKey(name: 'DRL04_Amphur') String? amphur;
  @JsonKey(name: 'DRL04_Province') String? province;
  @JsonKey(name: 'DRL04_statusExpired') String? statusExpired;

  String getExcFeeMessage(String? status){
    String message = '';
    switch(status) {
      case DriverLicenseInfoConstant.k_excFee_NULL: message = DriverLicenseInfoConstant.m_excFee_NULL; break;
      case DriverLicenseInfoConstant.k_excFee_Y: message = DriverLicenseInfoConstant.m_excFee_Y; break;
    }
    return message;
  }

  String getRvkFlagMessage(String? status){
    String message = '';
    switch(status) {
      case DriverLicenseInfoConstant.k_rvkFlag_NULL: message = DriverLicenseInfoConstant.m_rvkFlag_NULL; break;
      case DriverLicenseInfoConstant.k_rvkFlag_Y: message = DriverLicenseInfoConstant.m_rvkFlag_Y; break;
    }
    return message;
  }
}

@JsonSerializable()
class ListDriverLicenseInfoDto {
  ListDriverLicenseInfoDto({
    this.status,
    this.data,
  });

  factory ListDriverLicenseInfoDto.fromJson(Map<String, dynamic> json) => _$ListDriverLicenseInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListDriverLicenseInfoDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<DriverLicenseInfoDto>? data;
}

class DriverLicenseInfoConstant {
  DriverLicenseInfoConstant._();

  static const String m_docType = 'ประเภทเอกสาร';
  static const String m_idNo = 'เลขบัตรประชาชน';
  static const String m_titleDesc = 'ชื่อคำนำหน้าชื่อ';
  static const String m_fName = 'ชื่อ';
  static const String m_lName = 'นามสกุล';
  static const String m_titleEngDesc = 'คำนำหน้าชื่อภาษาอังกฤษ';
  static const String m_fNameEng = 'ชื่อภาษาอังกฤษ';
  static const String m_lNameEng = 'นามสกุลภาษาอังกฤษ';
  static const String m_birthDate = 'วันเกิด';
  static const String m_sex = 'รหัสเพศ';
  static const String m_sexDesc = 'เพศ';
  static const String m_addrNo = 'เลขที่บ้าน';
  static const String m_bldName = 'ชื่ออาคาร';
  static const String m_villageName = 'ชื่อหมู่บ้าน';
  static const String m_villageNo = 'หมู่ที่';
  static const String m_soi = 'ซอย';
  static const String m_street = 'ถนน';
  static const String m_locCode = 'รหัสจังหวัด/อำเภอ/ตำบล';
  static const String m_zipCode = 'รหัสไปรษณีย์';
  static const String m_locDesc = 'ชื่อจังหวัด/อำเภอ/ตำบล';
  static const String m_offLocCode = 'สำนักงานขนส่งจังหวัด/สาขาที่ออกใบอนุญาต';
  static const String m_pltDesc = 'ชื่อชนิดใบอนุญาตขับรถ';
  static const String m_locFullDesc = 'ชื่อเต็มของจังหวัด/อำเภอ/ตำบล (ตำบล>อำเภอ>จังหวัด)';
  static const String m_natCode = 'รหัสสัญชาติ';
  static const String m_rcpNo = 'เลขที่ใบเสร็จ';
  static const String m_pcNo = 'หมายเลขเครื่อง pc';
  static const String m_conditionDesc = 'รายละเอียดข้อจำกัดการใช้ใบอนุญาตของคนพิการ';
  static const String m_natDesc = 'ชื่อสัญชาติ';
  static const String m_excFee = 'ยกเว้นค่าธรรมเนียม';
  static const String m_rvkFlag = 'Flag การเพิกถอนเนื่องจากขาดคุณสมบัติ';
  static const String m_pltCode = 'ชนิดใบอนุญาต';
  static const String m_pltNo = 'เลขที่ใบอนุญาต';
  static const String m_issDate = 'วันที่ออกใบอนุญาต';
  static const String m_expDate = 'วันที่สิ้นอายุใบอนุญาต ';
  static const String m_srlNo = 'เลขคุมใบอนุญาต';
  static const String m_tambon = 'ตำบล';
  static const String m_amphur = 'อำเภอ';
  static const String m_province = 'จังหวัด';
  static const String m_statusExpired = 'สถานะสิ้นอายุใบอนุญาต';

  static const String k_excFee_NULL = 'NULL';
  static const String k_excFee_Y = 'Y';

  static const String m_excFee_NULL = 'ไม่ยกเว้น';
  static const String m_excFee_Y = 'ยกเว้น';

  static const String k_rvkFlag_NULL = 'NULL';
  static const String k_rvkFlag_Y = 'Y';

  static const String m_rvkFlag_NULL = 'ไม่เพิกถอน';
  static const String m_rvkFlag_Y = 'เพิกถอนตลอดชีพ';
}