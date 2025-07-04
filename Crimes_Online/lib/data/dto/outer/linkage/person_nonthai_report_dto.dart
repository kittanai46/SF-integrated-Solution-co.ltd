import 'package:crimes/data/dto/outer/linkage/person_nonthai_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_nonthai_report_dto.g.dart';

@JsonSerializable()
class ReportPersonNonThaiDto {
  ReportPersonNonThaiDto({
    this.personalID,
    this.address_houseAlley,
    this.address_houseAlleyWay,
    this.address_houseDistrict,
    this.address_houseNo,
    this.address_houseProvince,
    this.address_houseRoad,
    this.address_houseSubDistrict,
    this.address_houseVillageNo,
    this.blood,
    this.cardExpireDate,
    this.cardIssueDate,
    this.dateOfBirth,
    this.genderText,
    this.nameEN_firstName,
    this.nameEN_lastName,
    this.nameEN_middleName,
    this.nameEN_title,
    this.nameTH_firstName,
    this.nameTH_lastName,
    this.nameTH_middleName,
    this.nameTH_title,
    this.nationalityCode,
    this.nationalityText,

    this.img,

  });

  factory ReportPersonNonThaiDto.fromJson(Map<String, dynamic> json) =>
      _$ReportPersonNonThaiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportPersonNonThaiDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'address.houseAlley') String? address_houseAlley;
  @JsonKey(name: 'address.houseAlleyWay') String? address_houseAlleyWay;
  @JsonKey(name: 'address.houseDistrict') String? address_houseDistrict;
  @JsonKey(name: 'address.houseNo') String? address_houseNo;
  @JsonKey(name: 'address.houseProvince') String? address_houseProvince;
  @JsonKey(name: 'address.houseRoad') String? address_houseRoad;
  @JsonKey(name: 'address.houseSubDistrict') String? address_houseSubDistrict;
  @JsonKey(name: 'address.houseVillageNo') String? address_houseVillageNo;
  @JsonKey(name: 'blood') String? blood;
  @JsonKey(name: 'cardExpireDate') String? cardExpireDate;
  @JsonKey(name: 'cardIssueDate') String? cardIssueDate;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'genderText') String? genderText;
  @JsonKey(name: 'nameEN.firstName') String? nameEN_firstName;
  @JsonKey(name: 'nameEN.lastName') String? nameEN_lastName;
  @JsonKey(name: 'nameEN.middleName') String? nameEN_middleName;
  @JsonKey(name: 'nameEN.title') String? nameEN_title;
  @JsonKey(name: 'nameTH.firstName') String? nameTH_firstName;
  @JsonKey(name: 'nameTH.lastName') String? nameTH_lastName;
  @JsonKey(name: 'nameTH.middleName') String? nameTH_middleName;
  @JsonKey(name: 'nameTH.title') String? nameTH_title;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityText') String? nationalityText;

  @JsonKey(name: 'Img') String? img;


  void addPersonNonThai(PersonNonThaiDto? input) {
    if (input == null) {
      personalID = "";
      address_houseAlley = "";
      address_houseAlleyWay = "";
      address_houseDistrict = "";
      address_houseNo = "";
      address_houseProvince = "";
      address_houseRoad = "";
      address_houseSubDistrict = "";
      address_houseVillageNo = "";
      blood = "";
      cardExpireDate = "";
      cardIssueDate = "";
      dateOfBirth = "";
      genderText = "";
      nameEN_firstName = "";
      nameEN_lastName = "";
      nameEN_middleName = "";
      nameEN_title = "";
      nameTH_firstName = "";
      nameTH_lastName = "";
      nameTH_middleName = "";
      nameTH_title = "";
      nationalityCode = "";
      nationalityText = "";

      return;
    }

    personalID = input.personalID != null ? input.personalID : "";
    address_houseAlley = input.address_houseAlley != null ? input.address_houseAlley : "";
    address_houseAlleyWay = input.address_houseAlleyWay != null ? input.address_houseAlleyWay : "";
    address_houseDistrict = input.address_houseDistrict != null ? input.address_houseDistrict : "";
    address_houseNo = input.address_houseNo != null ? input.address_houseNo : "";
    address_houseProvince = input.address_houseProvince != null ? input.address_houseProvince : "";
    address_houseRoad = input.address_houseRoad != null ? input.address_houseRoad : "";
    address_houseSubDistrict = input.address_houseSubDistrict != null ? input.address_houseSubDistrict : "";
    address_houseVillageNo = input.address_houseVillageNo != null ? input.address_houseVillageNo : "";
    blood = input.blood != null ? input.blood : "";
    cardExpireDate = input.cardExpireDate != null ? input.cardExpireDate : "";
    cardIssueDate = input.cardIssueDate != null ? input.cardIssueDate : "";
    dateOfBirth = input.dateOfBirth != null ? input.dateOfBirth : "";
    genderText = input.genderText != null ? input.genderText : "";
    nameEN_firstName = input.nameEN_firstName != null ? input.nameEN_firstName : "";
    nameEN_lastName = input.nameEN_lastName != null ? input.nameEN_lastName : "";
    nameEN_middleName = input.nameEN_middleName != null ? input.nameEN_middleName : "";
    nameEN_title = input.nameEN_title != null ? input.nameEN_title : "";
    nameTH_firstName = input.nameTH_firstName != null ? input.nameTH_firstName : "";
    nameTH_lastName = input.nameTH_lastName != null ? input.nameTH_lastName : "";
    nameTH_middleName = input.nameTH_middleName != null ? input.nameTH_middleName : "";
    nameTH_title = input.nameTH_title != null ? input.nameTH_title : "";
    nationalityCode = input.nationalityCode != null ? input.nationalityCode : "";
    nationalityText = input.nationalityText != null ? input.nationalityText : "";

  }

  void setImage(String input) {
    // img = input;
    img = input != null ? input : "";
  }
}