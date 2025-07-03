import 'package:crimes/data/dto/outer/linkage/house_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_lk_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_lk_report_dto.g.dart';

@JsonSerializable()
class ReportPersonLkDto {
  ReportPersonLkDto({
    this.age,
    this.dateOfBirth,
    this.dateOfMoveIn,
    this.englishFirstName,
    this.englishLastName,
    this.englishMiddleName,
    this.englishTitleDesc,
    this.fatherName,
    this.fatherNationalityCode,
    this.fatherNationalityDesc,
    this.fatherPersonalID,
    this.firstName,
    this.fullnameAndRank,
    this.genderCode,
    this.genderDesc,
    this.lastName,
    this.middleName,
    this.motherName,
    this.motherNationalityCode,
    this.motherNationalityDesc,
    this.motherPersonalID,
    this.nationalityCode,
    this.nationalityDesc,
    this.ownerStatusDesc,
    this.pid,
    this.recordNumber,
    this.statusOfPersonCode,
    this.statusOfPersonDesc,
    this.titleCode,
    this.titleDesc,
    this.titleName,
    this.titleSex,
    this.totalRecord,
    this.img,

    this.alleyCode,
    this.alleyDesc,
    this.alleyWayCode,
    this.alleyWayDesc,
    this.dateOfTerminate,
    this.districtCode,
    this.districtDesc,
    this.houseID,
    this.houseNo,
    this.houseType,
    this.houseTypeDesc,
    this.provinceCode,
    this.provinceDesc,
    this.rcodeCode,
    this.rcodeDesc,
    this.roadCode,
    this.roadDesc,
    this.subdistrictCode,
    this.subdistrictDesc,
    this.villageNo,
  });

  factory ReportPersonLkDto.fromJson(Map<String, dynamic> json) =>
      _$ReportPersonLkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportPersonLkDtoToJson(this);

  @JsonKey(name: 'age') String? age;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'dateOfMoveIn') String? dateOfMoveIn;
  @JsonKey(name: 'englishFirstName') String? englishFirstName;
  @JsonKey(name: 'englishLastName') String? englishLastName;
  @JsonKey(name: 'englishMiddleName') String? englishMiddleName;
  @JsonKey(name: 'englishTitleDesc') String? englishTitleDesc;
  @JsonKey(name: 'fatherName') String? fatherName;
  @JsonKey(name: 'fatherNationalityCode') String? fatherNationalityCode;
  @JsonKey(name: 'fatherNationalityDesc') String? fatherNationalityDesc;
  @JsonKey(name: 'fatherPersonalID') String? fatherPersonalID;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'fullnameAndRank') String? fullnameAndRank;
  @JsonKey(name: 'genderCode') String? genderCode;
  @JsonKey(name: 'genderDesc') String? genderDesc;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'middleName') String? middleName;
  @JsonKey(name: 'motherName') String? motherName;
  @JsonKey(name: 'motherNationalityCode') String? motherNationalityCode;
  @JsonKey(name: 'motherNationalityDesc') String? motherNationalityDesc;
  @JsonKey(name: 'motherPersonalID') String? motherPersonalID;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityDesc') String? nationalityDesc;
  @JsonKey(name: 'ownerStatusDesc') String? ownerStatusDesc;
  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'recordNumber') String? recordNumber;
  @JsonKey(name: 'statusOfPersonCode') String? statusOfPersonCode;
  @JsonKey(name: 'statusOfPersonDesc') String? statusOfPersonDesc;
  @JsonKey(name: 'titleCode') String? titleCode;
  @JsonKey(name: 'titleDesc') String? titleDesc;
  @JsonKey(name: 'titleName') String? titleName;
  @JsonKey(name: 'titleSex') String? titleSex;
  @JsonKey(name: 'totalRecord') String? totalRecord;
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

  void addPersonLk(PersonLkDto? input) {
    if (input == null) {
      age = "";
      dateOfBirth = "";
      dateOfMoveIn = "";
      englishFirstName = "";
      englishLastName = "";
      englishMiddleName = "";
      englishTitleDesc = "";
      fatherName = "";
      fatherNationalityCode = "";
      fatherNationalityDesc = "";
      fatherPersonalID = "";
      firstName = "";
      fullnameAndRank = "";
      genderCode = "";
      genderDesc = "";
      lastName = "";
      middleName = "";
      motherName = "";
      motherNationalityCode = "";
      motherNationalityDesc = "";
      motherPersonalID ="";
      nationalityCode = "";
      nationalityDesc = "";
      ownerStatusDesc = "";
      pid = "";
      recordNumber = "";
      statusOfPersonCode = "";
      statusOfPersonDesc = "";
      titleCode = "";
      titleDesc = "";
      titleName = "";
      titleSex = "";
      totalRecord = "";
      return;
    }
    // age = input.age;
    // dateOfBirth = input.dateOfBirth;
    // dateOfMoveIn = input.dateOfMoveIn;
    // englishFirstName = input.englishFirstName;
    // englishLastName = input.englishLastName;
    // englishMiddleName = input.englishMiddleName;
    // englishTitleDesc = input.englishTitleDesc;
    // fatherName = input.fatherName;
    // fatherNationalityCode = input.fatherNationalityCode;
    // fatherNationalityDesc = input.fatherNationalityDesc;
    // fatherPersonalID = input.fatherPersonalID;
    // firstName = input.firstName;
    // fullnameAndRank = input.fullnameAndRank;
    // genderCode = input.genderCode;
    // genderDesc = input.genderDesc;
    // lastName = input.lastName;
    // middleName = input.middleName;
    // motherName = input.motherName;
    // motherNationalityCode = input.motherNationalityCode;
    // motherNationalityDesc = input.motherNationalityDesc;
    // motherPersonalID = input.motherPersonalID;
    // nationalityCode = input.nationalityCode;
    // nationalityDesc = input.nationalityDesc;
    // ownerStatusDesc = input.ownerStatusDesc;
    // pid = input.pid;
    // recordNumber = input.recordNumber;
    // statusOfPersonCode = input.statusOfPersonCode;
    // statusOfPersonDesc = input.statusOfPersonDesc;
    // titleCode = input.titleCode;
    // titleDesc = input.titleDesc;
    // titleName = input.titleName;
    // titleSex = input.titleSex;
    // totalRecord = input.totalRecord;

    age = input.age != null ? input.age :"";
    dateOfBirth = input.dateOfBirth != null ? input.dateOfBirth :"";
    dateOfMoveIn = input.dateOfMoveIn != null ? input.dateOfMoveIn :"";
    englishFirstName = input.englishFirstName != null ? input.englishFirstName :"";
    englishLastName = input.englishLastName != null ? input.englishLastName :"";
    englishMiddleName = input.englishMiddleName != null ? input.englishMiddleName :"";
    englishTitleDesc = input.englishTitleDesc != null ? input.englishTitleDesc :"";
    fatherName = input.fatherName != null ? input.fatherName :"";
    fatherNationalityCode = input.fatherNationalityCode != null ? input.fatherNationalityCode :"";
    fatherNationalityDesc = input.fatherNationalityDesc != null ? input.fatherNationalityDesc :"";
    fatherPersonalID = input.fatherPersonalID != null ? input.fatherPersonalID :"";
    firstName = input.firstName != null ? input.firstName :"";
    fullnameAndRank = input.fullnameAndRank != null ? input.fullnameAndRank :"";
    genderCode = input.genderCode != null ? input.genderCode :"";
    genderDesc = input.genderDesc != null ? input.genderDesc :"";
    lastName = input.lastName != null ? input.lastName :"";
    middleName = input.middleName != null ? input.middleName :"";
    motherName = input.motherName != null ? input.motherName :"";
    motherNationalityCode = input.motherNationalityCode != null ? input.motherNationalityCode :"";
    motherNationalityDesc = input.motherNationalityDesc != null ? input.motherNationalityDesc :"";
    motherPersonalID = input.motherPersonalID != null ? input.motherPersonalID :"";
    nationalityCode = input.nationalityCode != null ? input.nationalityCode :"";
    nationalityDesc = input.nationalityDesc != null ? input.nationalityDesc :"";
    ownerStatusDesc = input.ownerStatusDesc != null ? input.ownerStatusDesc :"";
    pid = input.pid != null ? input.pid :"";
    recordNumber = input.recordNumber != null ? '${input.recordNumber}' : "";
    statusOfPersonCode = input.statusOfPersonCode != null ? input.statusOfPersonCode :"";
    statusOfPersonDesc = input.statusOfPersonDesc != null ? input.statusOfPersonDesc :"";
    titleCode = input.titleCode != null ? input.titleCode :"";
    titleDesc = input.titleDesc != null ? input.titleDesc :"";
    titleName = input.titleName != null ? input.titleName :"";
    titleSex = input.titleSex != null ? input.titleSex :"";
    totalRecord = input.totalRecord != null ? '${input.totalRecord}' :"";
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
    // alleyCode = input.alleyCode;
    // alleyDesc = input.alleyDesc;
    // alleyWayCode = input.alleyWayCode;
    // alleyWayDesc = input.alleyWayDesc;
    // dateOfTerminate = input.dateOfTerminate;
    // districtCode = input.districtCode;
    // districtDesc = input.districtDesc;
    // houseID = input.houseID;
    // houseNo = input.houseNo;
    // houseType = input.houseType;
    // houseTypeDesc = input.houseTypeDesc;
    // provinceCode = input.provinceCode;
    // provinceDesc = input.provinceDesc;
    // rcodeCode = input.rcodeCode;
    // rcodeDesc = input.rcodeDesc;
    // roadCode = input.roadCode;
    // roadDesc = input.roadDesc;
    // subdistrictCode = input.subdistrictCode;
    // subdistrictDesc = input.subdistrictDesc;
    // villageNo = input.villageNo;

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