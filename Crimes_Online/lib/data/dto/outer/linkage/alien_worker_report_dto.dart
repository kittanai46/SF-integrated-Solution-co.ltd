import 'package:json_annotation/json_annotation.dart';
import 'alien_worker_dto.dart';

part 'alien_worker_report_dto.g.dart';

@JsonSerializable()
class ReportAlienWorkerDto {
  ReportAlienWorkerDto({
    this.personalID,
    this.address_alleyDesc,
    this.address_alleyWayDesc,
    this.address_ccaattmm,
    this.address_districtDesc,
    this.address_houseID,
    this.address_houseNo,
    this.address_provinceDesc,
    this.address_roadDesc,
    this.address_subdistrictDesc,
    this.address_villageNo,
    this.cardExpireDate,
    this.cardIssueDate,
    this.dateOfBirth,
    this.englishName,
    this.entrepreneurAddress_alleyDesc,
    this.entrepreneurAddress_alleyWayDesc,
    this.entrepreneurAddress_ccaattmm,
    this.entrepreneurAddress_districtDesc,
    this.entrepreneurAddress_houseID,
    this.entrepreneurAddress_houseNo,
    this.entrepreneurAddress_provinceDesc,
    this.entrepreneurAddress_roadDesc,
    this.entrepreneurAddress_subdistrictDesc,
    this.entrepreneurAddress_villageNo,
    this.entrepreneurId,
    this.entrepreneurName,
    this.firstName,
    this.genderCode,
    this.genderText,
    this.healthCareProvider,
    this.healthCareResult,
    this.lastName,
    this.nationalityCode,
    this.nationalityDesc,
    this.occupationCode,
    this.occupationDesc,
    this.occupationTypeCode,
    this.occupationTypeDesc,
    this.titleCode,
    this.titleDesc,
    this.workPerminExpireDate,
    this.workPermitIssueDate,
    this.workPlaceAddress_alleyDesc,
    this.workPlaceAddress_alleyWayDesc,
    this.workPlaceAddress_ccaattmm,
    this.workPlaceAddress_districtDesc,
    this.workPlaceAddress_houseID,
    this.workPlaceAddress_houseNo,
    this.workPlaceAddress_provinceDesc,
    this.workPlaceAddress_roadDesc,
    this.workPlaceAddress_subdistrictDesc,
    this.workPlaceAddress_villageNo,
    this.workPlaceDescription,
    this.img,

  });

  factory ReportAlienWorkerDto.fromJson(Map<String, dynamic> json) =>
      _$ReportAlienWorkerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportAlienWorkerDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'address.alleyDesc') String? address_alleyDesc;
  @JsonKey(name: 'address.alleyWayDesc') String? address_alleyWayDesc;
  @JsonKey(name: 'address.ccaattmm') String? address_ccaattmm;
  @JsonKey(name: 'address.districtDesc') String? address_districtDesc;
  @JsonKey(name: 'address.houseID') String? address_houseID;
  @JsonKey(name: 'address.houseNo') String? address_houseNo;
  @JsonKey(name: 'address.provinceDesc') String? address_provinceDesc;
  @JsonKey(name: 'address.roadDesc') String? address_roadDesc;
  @JsonKey(name: 'address.subdistrictDesc') String? address_subdistrictDesc;
  @JsonKey(name: 'address.villageNo') String? address_villageNo;
  @JsonKey(name: 'cardExpireDate') String? cardExpireDate;
  @JsonKey(name: 'cardIssueDate') String? cardIssueDate;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'englishName') String? englishName;
  @JsonKey(name: 'entrepreneurAddress.alleyDesc') String? entrepreneurAddress_alleyDesc;
  @JsonKey(name: 'entrepreneurAddress.alleyWayDesc') String? entrepreneurAddress_alleyWayDesc;
  @JsonKey(name: 'entrepreneurAddress.ccaattmm') String? entrepreneurAddress_ccaattmm;
  @JsonKey(name: 'entrepreneurAddress.districtDesc') String? entrepreneurAddress_districtDesc;
  @JsonKey(name: 'entrepreneurAddress.houseID') String? entrepreneurAddress_houseID;
  @JsonKey(name: 'entrepreneurAddress.houseNo') String? entrepreneurAddress_houseNo;
  @JsonKey(name: 'entrepreneurAddress.provinceDesc') String? entrepreneurAddress_provinceDesc;
  @JsonKey(name: 'entrepreneurAddress.roadDesc') String? entrepreneurAddress_roadDesc;
  @JsonKey(name: 'entrepreneurAddress.subdistrictDesc') String? entrepreneurAddress_subdistrictDesc;
  @JsonKey(name: 'entrepreneurAddress.villageNo') String? entrepreneurAddress_villageNo;
  @JsonKey(name: 'entrepreneurId') String? entrepreneurId;
  @JsonKey(name: 'entrepreneurName') String? entrepreneurName;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'genderCode') String? genderCode;
  @JsonKey(name: 'genderText') String? genderText;
  @JsonKey(name: 'healthCareProvider') String? healthCareProvider;
  @JsonKey(name: 'healthCareResult') String? healthCareResult;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityDesc') String? nationalityDesc;
  @JsonKey(name: 'occupationCode') String? occupationCode;
  @JsonKey(name: 'occupationDesc') String? occupationDesc;
  @JsonKey(name: 'occupationTypeCode') String? occupationTypeCode;
  @JsonKey(name: 'occupationTypeDesc') String? occupationTypeDesc;
  @JsonKey(name: 'titleCode') String? titleCode;
  @JsonKey(name: 'titleDesc') String? titleDesc;
  @JsonKey(name: 'workPerminExpireDate') String? workPerminExpireDate;
  @JsonKey(name: 'workPermitIssueDate') String? workPermitIssueDate;
  @JsonKey(name: 'workPlaceAddress.alleyDesc') String? workPlaceAddress_alleyDesc;
  @JsonKey(name: 'workPlaceAddress.alleyWayDesc') String? workPlaceAddress_alleyWayDesc;
  @JsonKey(name: 'workPlaceAddress.ccaattmm') String? workPlaceAddress_ccaattmm;
  @JsonKey(name: 'workPlaceAddress.districtDesc') String? workPlaceAddress_districtDesc;
  @JsonKey(name: 'workPlaceAddress.houseID') String? workPlaceAddress_houseID;
  @JsonKey(name: 'workPlaceAddress.houseNo') String? workPlaceAddress_houseNo;
  @JsonKey(name: 'workPlaceAddress.provinceDesc') String? workPlaceAddress_provinceDesc;
  @JsonKey(name: 'workPlaceAddress.roadDesc') String? workPlaceAddress_roadDesc;
  @JsonKey(name: 'workPlaceAddress.subdistrictDesc') String? workPlaceAddress_subdistrictDesc;
  @JsonKey(name: 'workPlaceAddress.villageNo') String? workPlaceAddress_villageNo;
  @JsonKey(name: 'workPlaceDescription') String? workPlaceDescription;
  @JsonKey(name: 'Img') String? img;


  void addAlienWorker(AlienWorkerDto? input) {
    if (input == null) {
      personalID = "";
      address_alleyDesc = "";
      address_alleyWayDesc = "";
      address_ccaattmm = "";
      address_districtDesc = "";
      address_houseID = "";
      address_houseNo = "";
      address_provinceDesc = "";
      address_roadDesc = "";
      address_subdistrictDesc = "";
      address_villageNo = "";
      cardExpireDate = "";
      cardIssueDate = "";
      dateOfBirth = "";
      englishName = "";
      entrepreneurAddress_alleyDesc = "";
      entrepreneurAddress_alleyWayDesc = "";
      entrepreneurAddress_ccaattmm = "";
      entrepreneurAddress_districtDesc = "";
      entrepreneurAddress_houseID = "";
      entrepreneurAddress_houseNo = "";
      entrepreneurAddress_provinceDesc = "";
      entrepreneurAddress_roadDesc = "";
      entrepreneurAddress_subdistrictDesc = "";
      entrepreneurAddress_villageNo = "";
      entrepreneurId = "";
      entrepreneurName = "";
      firstName = "";
      genderCode = "";
      genderText = "";
      healthCareProvider = "";
      healthCareResult = "";
      lastName = "";
      nationalityCode = "";
      nationalityDesc = "";
      occupationCode = "";
      occupationDesc = "";
      occupationTypeCode = "";
      occupationTypeDesc = "";
      titleCode = "";
      titleDesc = "";
      workPerminExpireDate = "";
      workPermitIssueDate = "";
      workPlaceAddress_alleyDesc = "";
      workPlaceAddress_alleyWayDesc = "";
      workPlaceAddress_ccaattmm = "";
      workPlaceAddress_districtDesc = "";
      workPlaceAddress_houseID = "";
      workPlaceAddress_houseNo = "";
      workPlaceAddress_provinceDesc = "";
      workPlaceAddress_roadDesc = "";
      workPlaceAddress_subdistrictDesc = "";
      workPlaceAddress_villageNo = "";
      workPlaceDescription = "";

      return;
    }

    personalID = input.personalID != null ? input.personalID : "";
    address_alleyDesc = input.address_alleyDesc != null ? input.address_alleyDesc : "";
    address_alleyWayDesc = input.address_alleyWayDesc != null ? input.address_alleyWayDesc : "";
    address_ccaattmm = input.address_ccaattmm != null ? input.address_ccaattmm : "";
    address_districtDesc = input.address_districtDesc != null ? input.address_districtDesc : "";
    address_houseID = input.address_houseID != null ? input.address_houseID : "";
    address_houseNo = input.address_houseNo != null ? input.address_houseNo : "";
    address_provinceDesc = input.address_provinceDesc != null ? input.address_provinceDesc : "";
    address_roadDesc = input.address_roadDesc != null ? input.address_roadDesc : "";
    address_subdistrictDesc = input.address_subdistrictDesc != null ? input.address_subdistrictDesc : "";
    address_villageNo = input.address_villageNo != null ? input.address_villageNo : "";
    cardExpireDate = input.cardExpireDate != null ? input.cardExpireDate : "";
    cardIssueDate = input.cardIssueDate != null ? input.cardIssueDate : "";
    dateOfBirth = input.dateOfBirth != null ? input.dateOfBirth : "";
    englishName = input.englishName != null ? input.englishName : "";
    entrepreneurAddress_alleyDesc = input.entrepreneurAddress_alleyDesc != null ? input.entrepreneurAddress_alleyDesc : "";
    entrepreneurAddress_alleyWayDesc = input.entrepreneurAddress_alleyWayDesc != null ? input.entrepreneurAddress_alleyWayDesc : "";
    entrepreneurAddress_ccaattmm = input.entrepreneurAddress_ccaattmm != null ? input.entrepreneurAddress_ccaattmm : "";
    entrepreneurAddress_districtDesc = input.entrepreneurAddress_districtDesc != null ? input.entrepreneurAddress_districtDesc : "";
    entrepreneurAddress_houseID = input.entrepreneurAddress_houseID != null ? input.entrepreneurAddress_houseID : "";
    entrepreneurAddress_houseNo = input.entrepreneurAddress_houseNo != null ? input.entrepreneurAddress_houseNo : "";
    entrepreneurAddress_provinceDesc = input.entrepreneurAddress_provinceDesc != null ? input.entrepreneurAddress_provinceDesc : "";
    entrepreneurAddress_roadDesc = input.entrepreneurAddress_roadDesc != null ? input.entrepreneurAddress_roadDesc : "";
    entrepreneurAddress_subdistrictDesc = input.entrepreneurAddress_subdistrictDesc != null ? input.entrepreneurAddress_subdistrictDesc : "";
    entrepreneurAddress_villageNo = input.entrepreneurAddress_villageNo != null ? input.entrepreneurAddress_villageNo : "";
    entrepreneurId = input.entrepreneurId != null ? input.entrepreneurId : "";
    entrepreneurName = input.entrepreneurName != null ? input.entrepreneurName : "";
    firstName = input.firstName != null ? input.firstName : "";
    genderCode = input.genderCode != null ? input.genderCode : "";
    genderText = input.genderText != null ? input.genderText : "";
    healthCareProvider = input.healthCareProvider != null ? input.healthCareProvider : "";
    healthCareResult = input.healthCareResult != null ? input.healthCareResult : "";
    lastName = input.lastName != null ? input.lastName : "";
    nationalityCode = input.nationalityCode != null ? input.nationalityCode : "";
    nationalityDesc = input.nationalityDesc != null ? input.nationalityDesc : "";
    occupationCode = input.occupationCode != null ? input.occupationCode : "";
    occupationDesc = input.occupationDesc != null ? input.occupationDesc : "";
    occupationTypeCode = input.occupationTypeCode != null ? input.occupationTypeCode : "";
    occupationTypeDesc = input.occupationTypeDesc != null ? input.occupationTypeDesc : "";
    titleCode = input.titleCode != null ? input.titleCode : "";
    titleDesc = input.titleDesc != null ? input.titleDesc : "";
    workPerminExpireDate = input.workPerminExpireDate != null ? input.workPerminExpireDate : "";
    workPermitIssueDate = input.workPermitIssueDate != null ? input.workPermitIssueDate : "";
    workPlaceAddress_alleyDesc = input.workPlaceAddress_alleyDesc != null ? input.workPlaceAddress_alleyDesc : "";
    workPlaceAddress_alleyWayDesc = input.workPlaceAddress_alleyWayDesc != null ? input.workPlaceAddress_alleyWayDesc : "";
    workPlaceAddress_ccaattmm = input.workPlaceAddress_ccaattmm != null ? input.workPlaceAddress_ccaattmm : "";
    workPlaceAddress_districtDesc = input.workPlaceAddress_districtDesc != null ? input.workPlaceAddress_districtDesc : "";
    workPlaceAddress_houseID = input.workPlaceAddress_houseID != null ? input.workPlaceAddress_houseID : "";
    workPlaceAddress_houseNo = input.workPlaceAddress_houseNo != null ? input.workPlaceAddress_houseNo : "";
    workPlaceAddress_provinceDesc = input.workPlaceAddress_provinceDesc != null ? input.workPlaceAddress_provinceDesc : "";
    workPlaceAddress_roadDesc = input.workPlaceAddress_roadDesc != null ? input.workPlaceAddress_roadDesc : "";
    workPlaceAddress_subdistrictDesc = input.workPlaceAddress_subdistrictDesc != null ? input.workPlaceAddress_subdistrictDesc : "";
    workPlaceAddress_villageNo = input.workPlaceAddress_villageNo != null ? input.workPlaceAddress_villageNo : "";
    workPlaceDescription = input.workPlaceDescription != null ? input.workPlaceDescription : "";

  }

  void setImage(String input) {
    // img = input;
    img = input != null ? input : "";
  }
}