import 'package:crimes/data/dto/outer/linkage/alien_person_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'house_lk_dto.dart';

part 'alien_person_report_dto.g.dart';

@JsonSerializable()
class ReportAlienPersonDto {
  ReportAlienPersonDto({
    this.personalID,
    this.bloodType,
    this.dateInThai,
    this.dateOfBirth,
    this.doeNumber,
    this.father_name,
    this.father_nationalityDesc,
    this.father_personalID,
    this.firstName,
    this.genderDesc,
    this.houseID,
    this.lastName,
    this.marryStatus,
    this.mother_name,
    this.mother_nationalityDesc,
    this.mother_personalID,
    this.nationalityDesc,
    this.passport_expireDate,
    this.passport_documentNo,
    this.passport_documentIssuePlace,
    this.passport_documentType,
    this.passport_issueDate,
    this.personAddDate,
    this.religion,
    this.spouseName,
    this.statusAdded,
    this.statusOfPersonDesc,
    this.terminateDate,
    this.titleDesc,
    this.visa_documentIssuePlace,
    this.visa_documentNo,
    this.visa_expireDate,
    this.visa_issueDate,
    this.visa_visaRequestType,
    this.visa_visaType,
    this.img,

  });

  factory ReportAlienPersonDto.fromJson(Map<String, dynamic> json) =>
      _$ReportAlienPersonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportAlienPersonDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'bloodType') String? bloodType;
  @JsonKey(name: 'dateInThai') String? dateInThai;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'doeNumber') String? doeNumber;
  @JsonKey(name: 'father.name') String? father_name;
  @JsonKey(name: 'father.nationalityDesc') String? father_nationalityDesc;
  @JsonKey(name: 'father.personalID') String? father_personalID;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  // @JsonKey(name: 'houseID') String? houseID;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'marryStatus') String? marryStatus;
  @JsonKey(name: 'mother.name') String? mother_name;
  @JsonKey(name: 'mother.nationalityDesc') String? mother_nationalityDesc;
  @JsonKey(name: 'mother.personalID') String? mother_personalID;
  @JsonKey(name: 'nationalityDesc') String? nationalityDesc;
  @JsonKey(name: 'passport.expireDate') String? passport_expireDate;
  @JsonKey(name: 'passport.documentNo') String? passport_documentNo;
  @JsonKey(name: 'passport.documentIssuePlace') String? passport_documentIssuePlace;
  @JsonKey(name: 'passport.documentType') String? passport_documentType;
  @JsonKey(name: 'passport.issueDate') String? passport_issueDate;
  @JsonKey(name: 'personAddDate') String? personAddDate;
  @JsonKey(name: 'religion') String? religion;
  @JsonKey(name: 'spouseName') String? spouseName;
  @JsonKey(name: 'statusAdded') String? statusAdded;
  @JsonKey(name: 'statusOfPersonDesc') String? statusOfPersonDesc;
  @JsonKey(name: 'terminateDate') String? terminateDate;
  @JsonKey(name: 'titleDesc') String? titleDesc;
  @JsonKey(name: 'visa.documentIssuePlace') String? visa_documentIssuePlace;
  @JsonKey(name: 'visa.documentNo') String? visa_documentNo;
  @JsonKey(name: 'visa.expireDate') String? visa_expireDate;
  @JsonKey(name: 'visa.issueDate') String? visa_issueDate;
  @JsonKey(name: 'visa.visaRequestType') String? visa_visaRequestType;
  @JsonKey(name: 'visa.visaType') String? visa_visaType;
  @JsonKey(name: 'Img') String? img;
  @JsonKey(name: 'alleyCode') String? alleyCode;
  @JsonKey(name: 'alleyDesc') String? alleyDesc;
  @JsonKey(name: 'alleyWayCode') String? alleyWayCode;
  @JsonKey(name: 'alleyWayDesc') String? alleyWayDesc;
  @JsonKey(name: 'dateOfTerminate') String? dateOfTerminate;
  @JsonKey(name: 'districtCode') String? districtCode;
  @JsonKey(name: 'districtDesc') String? districtDesc;
  @JsonKey(name: 'houseID') String? houseID;
  @JsonKey(name: 'houseNo') String? houseNo;
  @JsonKey(name: 'houseType') String? houseType;
  @JsonKey(name: 'houseTypeDesc') String? houseTypeDesc;
  @JsonKey(name: 'provinceCode') String? provinceCode;
  @JsonKey(name: 'provinceDesc') String? provinceDesc;
  @JsonKey(name: 'rcodeCode') String? rcodeCode;
  @JsonKey(name: 'rcodeDesc') String? rcodeDesc;
  @JsonKey(name: 'roadCode') String? roadCode;
  @JsonKey(name: 'roadDesc') String? roadDesc;
  @JsonKey(name: 'subdistrictCode') String? subdistrictCode;
  @JsonKey(name: 'subdistrictDesc') String? subdistrictDesc;
  @JsonKey(name: 'villageNo') String? villageNo;


  void addAlienPerson(AlienPersonDto? input) {
    if (input == null) {
      personalID = "";
      bloodType = "";
      dateInThai = "";
      dateOfBirth = "";
      doeNumber = "";
      father_name = "";
      father_nationalityDesc = "";
      father_personalID = "";
      firstName = "";
      genderDesc = "";
      houseID = "";
      lastName = "";
      marryStatus = "";
      mother_name = "";
      mother_nationalityDesc = "";
      mother_personalID = "";
      nationalityDesc = "";
      passport_expireDate = "";
      passport_documentNo = "";
      passport_documentIssuePlace = "";
      passport_documentType = "";
      passport_issueDate = "";
      personAddDate = "";
      religion = "";
      spouseName = "";
      statusAdded = "";
      statusOfPersonDesc = "";
      terminateDate = "";
      titleDesc = "";
      visa_documentIssuePlace = "";
      visa_documentNo = "";
      visa_expireDate = "";
      visa_issueDate = "";
      visa_visaRequestType = "";
      visa_visaType = "";
      return;
    }

    personalID = input.personalID != null ? input.personalID :"";
    bloodType = input.bloodType != null ? input.bloodType : "";
    dateInThai = input.dateInThai != null ? input.dateInThai : "";
    dateOfBirth = input.dateOfBirth != null ? input.dateOfBirth : "";
    doeNumber = input.doeNumber != null ? input.doeNumber : "";
    father_name = input.father_name != null ? input.father_name : "";
    father_nationalityDesc = input.father_nationalityDesc != null ? input.father_nationalityDesc : "";
    father_personalID = input.father_personalID != null ? input.father_personalID : "";
    firstName = input.firstName != null ? input.firstName : "";
    genderDesc = input.genderDesc != null ? input.genderDesc : "";
    //houseID = input.houseID != null ? input.houseID : "";
    lastName = input.lastName != null ? input.lastName : "";
    marryStatus = input.marryStatus != null ? input.marryStatus : "";
    mother_name = input.mother_name != null ? input.mother_name : "";
    mother_nationalityDesc = input.mother_nationalityDesc != null ? input.mother_nationalityDesc : "";
    mother_personalID = input.mother_personalID != null ? input.mother_personalID : "";
    nationalityDesc = input.nationalityDesc != null ? input.nationalityDesc : "";
    passport_expireDate = input.passport_expireDate != null ? input.passport_expireDate : "";
    passport_documentNo = input.passport_documentNo != null ? input.passport_documentNo : "";
    passport_documentIssuePlace = input.passport_documentIssuePlace != null ? input.passport_documentIssuePlace : "";
    passport_documentType = input.passport_documentType != null ? input.passport_documentType : "";
    passport_issueDate = input.passport_issueDate != null ? input.passport_issueDate : "";
    personAddDate = input.personAddDate != null ? input.personAddDate : "";
    religion = input.religion != null ? input.religion : "";
    spouseName = input.spouseName != null ? input.spouseName : "";
    statusAdded = input.statusAdded != null ? input.statusAdded : "";
    statusOfPersonDesc = input.statusOfPersonDesc != null ? input.statusOfPersonDesc : "";
    terminateDate = input.terminateDate != null ? input.terminateDate : "";
    titleDesc = input.titleDesc != null ? input.titleDesc : "";
    visa_documentIssuePlace = input.visa_documentIssuePlace != null ? input.visa_documentIssuePlace : "";
    visa_documentNo = input.visa_documentNo != null ? input.visa_documentNo : "";
    visa_expireDate = input.visa_expireDate != null ? input.visa_expireDate : "";
    visa_issueDate = input.visa_issueDate != null ? input.visa_issueDate : "";
    visa_visaRequestType = input.visa_visaRequestType != null ? input.visa_visaRequestType : "";
    visa_visaType = input.visa_visaType != null ? input.visa_visaType : "";

  }

  void addHouseLk(HouseLkDto? input) {
    if (input == null) {
      alleyCode = "";
      alleyDesc = "";
      alleyWayCode = "";
      alleyWayDesc = "";
      dateOfTerminate = "";
      districtCode = "";
      districtDesc = "";
      houseID = "";
      houseNo = "";
      houseType = "";
      houseTypeDesc = "";
      provinceCode = "";
      provinceDesc = "";
      rcodeCode = "";
      rcodeDesc = "";
      roadCode = "";
      roadDesc = "";
      subdistrictCode = "";
      subdistrictDesc = "";
      villageNo = "";
      return;
    }

    alleyCode = input.alleyCode != null ? input.alleyCode :"";
    alleyDesc = input.alleyDesc != null ? input.alleyDesc :"";
    alleyWayCode = input.alleyWayCode != null ? input.alleyWayCode :"";
    alleyWayDesc = input.alleyWayDesc != null ? input.alleyWayDesc :"";
    dateOfTerminate = input.dateOfTerminate != null ? input.dateOfTerminate :"";
    districtCode = input.districtCode != null ? input.districtCode :"";
    districtDesc = input.districtDesc != null ? input.districtDesc :"";
    houseID = input.houseID != null ? input.houseID :"";
    houseNo = input.houseNo != null ? input.houseNo :"";
    houseType = input.houseType != null ? input.houseType :"";
    houseTypeDesc = input.houseTypeDesc != null ? input.houseTypeDesc :"";
    provinceCode = input.provinceCode != null ? input.provinceCode :"";
    provinceDesc = input.provinceDesc != null ? input.provinceDesc :"";
    rcodeCode = input.rcodeCode != null ? input.rcodeCode :"";
    rcodeDesc = input.rcodeDesc != null ? input.rcodeDesc :"";
    roadCode = input.roadCode != null ? input.roadCode :"";
    roadDesc = input.roadDesc != null ? input.roadDesc :"";
    subdistrictCode = input.subdistrictCode != null ? input.subdistrictCode :"";
    subdistrictDesc = input.subdistrictDesc != null ? input.subdistrictDesc :"";
    villageNo = input.villageNo != null ? input.villageNo :"";
  }

  void setImage(String input) {
    // img = input;
    img = input != null ? input : "";
  }
}