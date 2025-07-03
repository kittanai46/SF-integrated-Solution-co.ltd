import 'package:crimes/data/dto/outer/linkage/person_noregis_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_noregis_report_dto.g.dart';

@JsonSerializable()
class ReportPersonNoRegisDto {
  ReportPersonNoRegisDto({
    this.personalID,
    this.address_houseAlley,
    this.address_houseAlleyWay,
    this.address_houseDistrict,
    this.address_houseNo,
    this.address_houseProvince,
    this.address_houseRoad,
    this.address_houseSubDistrict,
    this.address_houseVillageNo,
    this.cardExpireDate,
    this.cardIssueDate,
    this.dateOfBirth,
    this.firstName,
    this.genderText,
    this.lastName,
    this.nationalityCode,
    this.nationalityText,
    this.title,

    this.img,

  });

  factory ReportPersonNoRegisDto.fromJson(Map<String, dynamic> json) =>
      _$ReportPersonNoRegisDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportPersonNoRegisDtoToJson(this);

  @JsonKey(name: 'personalID') String? personalID;
  @JsonKey(name: 'address.houseAlley') String? address_houseAlley;
  @JsonKey(name: 'address.houseAlleyWay') String? address_houseAlleyWay;
  @JsonKey(name: 'address.houseDistrict') String? address_houseDistrict;
  @JsonKey(name: 'address.houseNo') String? address_houseNo;
  @JsonKey(name: 'address.houseProvince') String? address_houseProvince;
  @JsonKey(name: 'address.houseRoad') String? address_houseRoad;
  @JsonKey(name: 'address.houseSubDistrict') String? address_houseSubDistrict;
  @JsonKey(name: 'address.houseVillageNo') String? address_houseVillageNo;
  @JsonKey(name: 'cardExpireDate') String? cardExpireDate;
  @JsonKey(name: 'cardIssueDate') String? cardIssueDate;
  @JsonKey(name: 'dateOfBirth') String? dateOfBirth;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'genderText') String? genderText;
  @JsonKey(name: 'lastName') String? lastName;
  @JsonKey(name: 'nationalityCode') String? nationalityCode;
  @JsonKey(name: 'nationalityText') String? nationalityText;
  @JsonKey(name: 'title') String? title;

  @JsonKey(name: 'Img') String? img;


  void addPersonNoRegis(PersonNoRegisDto? input) {
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
      cardExpireDate = "";
      cardIssueDate = "";
      dateOfBirth = "";
      firstName = "";
      genderText = "";
      lastName = "";
      nationalityCode = "";
      nationalityText = "";
      title = "";


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
    cardExpireDate = input.cardExpireDate != null ? input.cardExpireDate : "";
    cardIssueDate = input.cardIssueDate != null ? input.cardIssueDate : "";
    dateOfBirth = input.dateOfBirth != null ? input.dateOfBirth : "";
    firstName = input.firstName != null ? input.firstName : "";
    genderText = input.genderText != null ? input.genderText : "";
    lastName = input.lastName != null ? input.lastName : "";
    nationalityCode = input.nationalityCode != null ? input.nationalityCode : "";
    nationalityText = input.nationalityText != null ? input.nationalityText : "";
    title = input.title != null ? input.title : "";

  }

  void setImage(String input) {
    // img = input;
    img = input != null ? input : "";
  }
}