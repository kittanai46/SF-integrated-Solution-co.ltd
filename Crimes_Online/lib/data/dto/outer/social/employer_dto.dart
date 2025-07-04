import 'package:json_annotation/json_annotation.dart';

part 'employer_dto.g.dart';

@JsonSerializable()
class EmployerDto {
  EmployerDto({
    this.accNo,
    this.accBranch,
    this.branchEmplyeeNo,
    this.companyAddress,
    this.companyName,
    this.companyRigNo,
    this.companyStatus,
    this.companyStatusDesc,
    this.companyTel,
    this.companyType,
    this.companyTypeDesc,
    this.companyZip,
    this.contactAddress,
    this.contactFax,
    this.contactTel,
    this.contactZip,
    this.fdappl,
    this.lddate,
    this.newOperateDate,
    this.paySsoBranchCode,
    this.paySsoBranchName,
    this.ssoBranchCode,
    this.ssoBranchName,
    this.totalEmployeeNo,
  });

  factory EmployerDto.fromJson(Map<String, dynamic> json) => _$EmployerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EmployerDtoToJson(this);

  @JsonKey(name: 'accNo') String? accNo;
  @JsonKey(name: 'accBranch') String? accBranch;
  @JsonKey(name: 'branchEmplyeeNo') String? branchEmplyeeNo;
  @JsonKey(name: 'companyAddress') String? companyAddress;
  @JsonKey(name: 'companyName') String? companyName;
  @JsonKey(name: 'companyRigNo') String? companyRigNo;
  @JsonKey(name: 'companyStatus') String? companyStatus;
  @JsonKey(name: 'companyStatusDesc') String? companyStatusDesc;
  @JsonKey(name: 'companyTel') String? companyTel;
  @JsonKey(name: 'companyType') String? companyType;
  @JsonKey(name: 'companyTypeDesc') String? companyTypeDesc;
  @JsonKey(name: 'companyZip') String? companyZip;
  @JsonKey(name: 'contactAddress') String? contactAddress;
  @JsonKey(name: 'contactFax') String? contactFax;
  @JsonKey(name: 'contactTel') String? contactTel;
  @JsonKey(name: 'contactZip') String? contactZip;
  @JsonKey(name: 'fdappl') String? fdappl;
  @JsonKey(name: 'lddate') String? lddate;
  @JsonKey(name: 'newOperateDate') String? newOperateDate;
  @JsonKey(name: 'paySsoBranchCode') String? paySsoBranchCode;
  @JsonKey(name: 'paySsoBranchName') String? paySsoBranchName;
  @JsonKey(name: 'ssoBranchCode') String? ssoBranchCode;
  @JsonKey(name: 'ssoBranchName') String? ssoBranchName;
  @JsonKey(name: 'totalEmployeeNo') String? totalEmployeeNo;

}

@JsonSerializable()
class ListEmployerDto {
  ListEmployerDto({
    this.status,
    this.data,
  });

  factory ListEmployerDto.fromJson(Map<String, dynamic> json) => _$ListEmployerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListEmployerDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<EmployerDto>? data;
}

class EmployerConstant {
  EmployerConstant._();

  static const String m_accNo = 'รหัสสถานประกอบการ';
  static const String m_accBranch = 'รหัสสาขา';
  static const String m_branchEmplyeeNo = 'จำนวนพนักงานของสาขา';
  static const String m_companyAddress = 'ที่อยู่';
  static const String m_companyName = 'ชื่อสถานประกอบการ';
  static const String m_companyRigNo = 'ทะเบียนพานิชย์';
  static const String m_companyStatus = 'รหัสสถานะสถานประกอบการ';
  static const String m_companyStatusDesc = 'สถานะสถานประกอบการ';
  static const String m_companyTel = 'เบอร์โทรศัพท์';
  static const String m_companyType = 'รหัสประเภทธุรกิจ';
  static const String m_companyTypeDesc = 'ประเภทธุรกิจ';
  static const String m_companyZip = 'รหัสไปรษณีย์';
  static const String m_contactAddress = 'ที่อยู่ (ติดต่อ)';
  static const String m_contactFax = 'เบอร์โทรสาร (ติดต่อ)';
  static const String m_contactTel = 'เบอร์โทร (ติดต่อ)';
  static const String m_contactZip = 'รหัสไปรษณีย์ (ติดต่อ)';
  static const String m_fdappl = 'วันที่จ่ายเงิน';
  static const String m_lddate = 'วันที่ยกเลิกกิจการ';
  static const String m_newOperateDate = 'วันที่เปิดกิจการใหม่หลังจากหยุดกิจการ';
  static const String m_paySsoBranchCode = 'รหัสสปส. จ่ายเงิน';
  static const String m_paySsoBranchName = 'สปส. จ่ายเงิน';
  static const String m_ssoBranchCode = 'รหัสสปส. รับผิดชอบ';
  static const String m_ssoBranchName = 'สปส. รับผิดชอบ';
  static const String m_totalEmployeeNo = 'จำนวนพนักงานทั้งหมด';
}