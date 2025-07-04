import 'package:json_annotation/json_annotation.dart';

import 'package:crimes/data/dto/outer/social/employer_dto.dart';
import 'package:crimes/data/dto/outer/social/employment_dto.dart';
import 'package:crimes/data/dto/outer/social/hospital_dto.dart';

part 'report_sso_dto.g.dart';

@JsonSerializable()
class ReportSsoDto {
  ReportSsoDto();

  factory ReportSsoDto.fromJson(Map<String, dynamic> json) => _$ReportSsoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportSsoDtoToJson(this);

  // EmploymentDto
  @JsonKey(name: 'ssoNum') String? ssoNum;
  @JsonKey(name: 'idType') String? idType;
  @JsonKey(name: 'idDesc') String? idDesc;
  @JsonKey(name: 'titleCode') String? titleCode;
  @JsonKey(name: 'titleCodeDesc') String? titleCodeDesc;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'empBirthDate') String? empBirthDate;
  @JsonKey(name: 'gender') String? gender;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  @JsonKey(name: 'activeStatus') String? activeStatus;
  @JsonKey(name: 'activeStatusDesc') String? activeStatusDesc;
  @JsonKey(name: 'expirationDate') String? expirationDate;
  @JsonKey(name: 'accBran') String? accBran;
  @JsonKey(name: 'accNo') String? accNo;
  @JsonKey(name: 'companyName') String? companyName;
  @JsonKey(name: 'employStatus') String? employStatus;
  @JsonKey(name: 'employStatusDesc') String? employStatusDesc;
  @JsonKey(name: 'empResignDate') String? empResignDate;
  @JsonKey(name: 'expStartDate') String? expStartDate;

  // HospitalDto
  // @JsonKey(name: 'activeStatus') String? activeStatus;
  // @JsonKey(name: 'activeStatusDesc') String? activeStatusDesc;
  // @JsonKey(name: 'empBirthDate') String? empBirthDate;
  // @JsonKey(name: 'expirationDate') String? expirationDate;
  // @JsonKey(name: 'firstName') String? firstName;
  // @JsonKey(name: 'gender') String? gender;
  // @JsonKey(name: 'genderDesc') String? genderDesc;
  // @JsonKey(name: 'idDesc') String? idDesc;
  // @JsonKey(name: 'idType') String? idType;
  // @JsonKey(name: 'lastName') String? lastName;
  // @JsonKey(name: 'ssoNum') String? ssoNum;
  // @JsonKey(name: 'titleCode') String? titleCode;
  // @JsonKey(name: 'titleCodeDesc') String? titleCodeDesc;
  @JsonKey(name: 'hospitalCode') String? hospitalCode;
  @JsonKey(name: 'hospitalName') String? hospitalName;
  @JsonKey(name: 'medYY') String? medYY;
  @JsonKey(name: 'mselExpireDate') String? mselExpireDate;
  @JsonKey(name: 'mselLastChange') String? mselLastChange;
  @JsonKey(name: 'mselStartDate') String? mselStartDate;
  @JsonKey(name: 'mselStatus') String? mselStatus;
  @JsonKey(name: 'mselStatusDesc') String? mselStatusDesc;
  @JsonKey(name: 'ssoBranchCode') String? ssoBranchCode;
  @JsonKey(name: 'ssoBranchName') String? ssoBranchName;

  // ReportSsoDto
  // @JsonKey(name: 'accNo') String? accNo;
  @JsonKey(name: 'accBranch') String? accBranch;
  @JsonKey(name: 'branchEmplyeeNo') String? branchEmplyeeNo;
  @JsonKey(name: 'companyAddress') String? companyAddress;
  // @JsonKey(name: 'companyName') String? companyName;
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
  // @JsonKey(name: 'ssoBranchCode') String? ssoBranchCode;
  // @JsonKey(name: 'ssoBranchName') String? ssoBranchName;
  @JsonKey(name: 'totalEmployeeNo') String? totalEmployeeNo;

  void addEmploymentDto(EmploymentDto? employmentDto){
    if(employmentDto == null) return;

    ssoNum = employmentDto.ssoNum;
    idType = employmentDto.idType;
    idDesc = employmentDto.idDesc;
    titleCode = employmentDto.titleCode;
    titleCodeDesc = employmentDto.titleCodeDesc;
    firstName = employmentDto.firstName;
    lastName = employmentDto.lastName;
    empBirthDate = employmentDto.empBirthDate;
    gender = employmentDto.gender;
    genderDesc = employmentDto.genderDesc;
    activeStatus = employmentDto.activeStatus;
    activeStatusDesc = employmentDto.activeStatusDesc;
    expirationDate = employmentDto.expirationDate;
    accBran = employmentDto.accBran;
    accNo = employmentDto.accNo;
    companyName = employmentDto.companyName;
    employStatus = employmentDto.employStatus;
    employStatusDesc = employmentDto.employStatusDesc;
    empResignDate = employmentDto.empResignDate;
    expStartDate = employmentDto.expStartDate;
  }

  void addHospitalDto(HospitalDto? hospitalDto) {
    if(hospitalDto == null) return;

    hospitalCode = hospitalDto.hospitalCode;
    hospitalName = hospitalDto.hospitalName;
    medYY = hospitalDto.medYY;
    mselExpireDate = hospitalDto.mselExpireDate;
    mselLastChange = hospitalDto.mselLastChange;
    mselStartDate = hospitalDto.mselStartDate;
    mselStatus = hospitalDto.mselStatus;
    mselStatusDesc = hospitalDto.mselStatusDesc;
    ssoBranchCode = hospitalDto.ssoBranchCode;
    ssoBranchName = hospitalDto.ssoBranchName;
  }

  void addEmployerDto(EmployerDto? employerDto) {
    if(employerDto == null) return;

    accBranch = employerDto.accBranch;
    branchEmplyeeNo = employerDto.branchEmplyeeNo;
    companyAddress = employerDto.companyAddress;
    companyRigNo = employerDto.companyRigNo;
    companyStatus = employerDto.companyStatus;
    companyStatusDesc = employerDto.companyStatusDesc;
    companyTel = employerDto.companyTel;
    companyType = employerDto.companyType;
    companyTypeDesc = employerDto.companyTypeDesc;
    companyZip = employerDto.companyZip;
    contactAddress = employerDto.contactAddress;
    contactFax = employerDto.contactFax;
    contactTel = employerDto.contactTel;
    contactZip = employerDto.contactZip;
    fdappl = employerDto.fdappl;
    lddate = employerDto.lddate;
    newOperateDate = employerDto.newOperateDate;
    paySsoBranchCode = employerDto.paySsoBranchCode;
    paySsoBranchName = employerDto.paySsoBranchName;
    totalEmployeeNo = employerDto.totalEmployeeNo;
  }

}