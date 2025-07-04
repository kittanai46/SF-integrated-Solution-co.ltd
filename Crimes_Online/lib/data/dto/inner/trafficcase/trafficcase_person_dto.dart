import 'package:json_annotation/json_annotation.dart';

part 'trafficcase_person_dto.g.dart';

@JsonSerializable()
class TrafficCasePersonDto {
  TrafficCasePersonDto({
    this.bh,
    this.bk,
    this.orgCode,
    this.stationName,
    this.caseNo,
    this.crimeCaseNo,
    this.crimeCaseYear,
    this.suspectId,
    this.passportNumber,
    this.firstNameTh,
    this.surNameTh,
    this.suspectFullName,
    this.gender,
    this.age,
    this.nationality,
    this.displayChargePerson,
    this.statusAboutWarrant,
    this.statusVictimOrSuspect,
    this.displayResultCase_investigator,
    this.investigator_result,
    this.headinvest_result,
    this.prosecutor_result,
    this.civilcourt_result,
    this.psId,
    this.tcId,
    this.fullPid,
    this.fullPasId,
    this.fullSusName,
    this.fullcaseNo,
    this.eventStartDate,
    this.caseAcceptDate,
  });

  factory TrafficCasePersonDto.fromJson(Map<String, dynamic> json) => _$TrafficCasePersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TrafficCasePersonDtoToJson(this);


  @JsonKey(name: 'BH') String? bh;  // บช./ภาค
  @JsonKey(name: 'BK') String? bk;  // บก./ภ.จว
  @JsonKey(name: 'ORGCODE') String? orgCode;  // รหัสสถานี
  @JsonKey(name: 'STATIONNAME') String? stationName;  // ชื่อสถานี
  @JsonKey(name: 'CASENO') String? caseNo;  // เลขคดี
  @JsonKey(name: 'CRIMECASENO') String? crimeCaseNo;  // เลขที่คดี
  @JsonKey(name: 'CRIMECASEYEAR') String? crimeCaseYear;  // ปีท่ีคดี
  @JsonKey(name: 'SUSPECTID') String? suspectId;  // เลขบัตรประชาชน - ผู้ต้องหา
  @JsonKey(name: 'PASSPORTNUMBER') String? passportNumber;  // เลขพาสปอร์ต - ผู้ต้องหา
  @JsonKey(name: 'FIRSTNAMETH') String? firstNameTh;  // ชื่อ - ผู้ต้องหา
  @JsonKey(name: 'SURNAMETH') String? surNameTh;  // นามสกุล - ผู้ต้องหา
  @JsonKey(name: 'SUSPECTFULLNAME') String? suspectFullName;  // ชื่อ + นามสกุล - ผู้ต้องหา
  @JsonKey(name: 'GENDER') String? gender;  // เพศ - ผู้ต้องหา
  @JsonKey(name: 'AGE') String? age;  // อายุ - ผู้ต้องหา
  @JsonKey(name: 'NATIONALITY') String? nationality;  // สัญชาติ
  @JsonKey(name: 'DISPLAYCHARGEPERSON') String? displayChargePerson;  // ข้อหา
  @JsonKey(name: 'STATUSABOUTWARRANT') String? statusAboutWarrant;  // สถานะหมายจับ
  @JsonKey(name: 'STATUSVICTIMORSUSPECT') String? statusVictimOrSuspect;  // สถานะในคดี
  @JsonKey(name: 'DISPLAYRESULTCASE_INVESTIGATOR') String? displayResultCase_investigator;  // ผลคดีชั้นพนักงานสอบสวน
  @JsonKey(name: 'INVESTIGATOR_RESULT') String? investigator_result;  // ผลคดีชั้นพนักงานสอบสวน
  @JsonKey(name: 'HEADINVEST_RESULT') String? headinvest_result;  // ผลคดีชั้นหัวหน้่าพนักงานสอบสวน
  @JsonKey(name: 'PROSECUTOR_RESULT') String? prosecutor_result;  // ผลคดีชั้นอัยการ
  @JsonKey(name: 'CIVILCOURT_RESULT') String? civilcourt_result;  // ผลคดีชั้นต้น
  @JsonKey(name: 'PSID') String? psId;  // Object ID
  @JsonKey(name: 'TCID') String? tcId;  // Object ID - TrafficCase
  @JsonKey(name: 'FULLPID') String? fullPid;  // Rowkey
  @JsonKey(name: 'FULLPASID') String? fullPasId;  // Rowkey
  @JsonKey(name: 'FULLSUSNAME') String? fullSusName;  // Rowkey
  @JsonKey(name: 'FULLCASENO') String? fullcaseNo;  // Rowkey
  @JsonKey(name: 'EVENTSTARTDATE') String? eventStartDate; // วันที่เกิดเหตุ
  @JsonKey(name: 'CASEACCEPTDATE') String? caseAcceptDate; // วันที่รับคำร้องทุกข์

  String getStatusAboutWarrantMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_NotRequestWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_NotRequestWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_WaitSubpoenaNumber: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_WaitSubpoenaNumber; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_HaveWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_HaveWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_WaitArppoveRevokeWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_WaitArppoveRevokeWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_CompleteRevoke: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_CompleteRevoke; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_RejectRevokeWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_RejectRevokeWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_WaitApproveCancelWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_WaitApproveCancelWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_CompleteCancleWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_CompleteCancleWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_RejectCancelWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_RejectCancelWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_WaitApproveWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_WaitApproveWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_WaitingToIssueWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_WaitingToIssueWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_WaitForRevokeWarrant: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_WaitForRevokeWarrant; break;
      case TrafficCasePersonConstant.k_STATUSABOUTWARRANT_WaitForCourtWrit: message = TrafficCasePersonConstant.m_STATUSABOUTWARRANT_WaitForCourtWrit; break;
    }
    return message;
  }

  String getStatusVictimOrSuspectMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCasePersonConstant.k_STATUSVICTIMORSUSPECT_Victim: message = TrafficCasePersonConstant.m_STATUSVICTIMORSUSPECT_Victim; break;
      case TrafficCasePersonConstant.k_STATUSVICTIMORSUSPECT_Suspect: message = TrafficCasePersonConstant.m_STATUSVICTIMORSUSPECT_Suspect; break;
    }
    return message;
  }

  String getDisplayResultCaseInvestigatorMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_Withdraw: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_Withdraw; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_Fine: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_Fine; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_RevokeRequest: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_RevokeRequest; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_DropInvestigation: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_DropInvestigation; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_ExcludeSomeCharges: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_ExcludeSomeCharges; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_SueAllCharges: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_SueAllCharges; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_CancelAllCharges: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_CancelAllCharges; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_ShouldDropInvestigation: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_ShouldDropInvestigation; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_ReVokeCaseNum: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_ReVokeCaseNum; break;
      case TrafficCasePersonConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_OtherResults: message = TrafficCasePersonConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_OtherResults; break;
    }
    return message;
  }

}

@JsonSerializable()
class ListTrafficCasePersonDto {
  ListTrafficCasePersonDto({
    this.status,
    this.data,
  });

  factory ListTrafficCasePersonDto.fromJson(Map<String, dynamic> json) => _$ListTrafficCasePersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListTrafficCasePersonDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<TrafficCasePersonDto>? data;
}

class TrafficCasePersonConstant {
  TrafficCasePersonConstant._();

  static const String m_bh = 'บช./ภาค';
  static const String m_bk = 'บก./ภ.จว';
  static const String m_orgCode = 'รหัสสถานี';
  static const String m_stationName = 'ชื่อสถานี';
  static const String m_caseNo = 'เลขคดี';
  static const String m_crimeCaseNo = 'เลขที่คดี';
  static const String m_crimeCaseYear = 'ปีท่ีคดี';
  static const String m_suspectId = 'เลขบัตรปปช.';
  static const String m_passportNumber = 'เลขพาสปอร์ต';
  static const String m_firstNameTh = 'ชื่อ';
  static const String m_surNameTh = 'นามสกุล';
  static const String m_suspectFullName = 'ชื่อนามสกุล';
  static const String m_gender = 'เพศ';
  static const String m_age = 'อายุ';
  static const String m_nationality = 'สัญชาติ';
  static const String m_displayChargePerson = 'ข้อหา';
  static const String m_statusAboutWarrant = 'สถานะหมายจับ';
  static const String m_statusVictimOrSuspect = 'สถานะในคดี';
  static const String m_displayResultCase_investigator = 'ผลคดีชั้นพนักงานสอบสวน';
  static const String m_investigator_result = 'ผลคดีชั้นพนักงานสอบสวน';
  static const String m_headinvest_result = 'ผลคดีชั้นหัวหน้าพนักงานสอบสวน';
  static const String m_prosecutor_result = 'ผลคดีชั้นอัยการ';
  static const String m_civilcourt_result = 'ผลคดีชั้นต้น';
  static const String m_eventStartDate = 'วันที่เกิดเหตุ';
  static const String m_caseAcceptDate = 'วันที่รับคำร้องทุกข์';


  static const String k_STATUSABOUTWARRANT_NotRequestWarrant = 'NotRequestWarrant';
  static const String k_STATUSABOUTWARRANT_WaitSubpoenaNumber = 'WaitSubpoenaNumber';
  static const String k_STATUSABOUTWARRANT_HaveWarrant = 'HaveWarrant';
  static const String k_STATUSABOUTWARRANT_WaitArppoveRevokeWarrant = 'WaitArppoveRevokeWarrant';
  static const String k_STATUSABOUTWARRANT_CompleteRevoke = 'CompleteRevoke';
  static const String k_STATUSABOUTWARRANT_RejectRevokeWarrant = 'RejectRevokeWarrant';
  static const String k_STATUSABOUTWARRANT_WaitApproveCancelWarrant = 'WaitApproveCancelWarrant';
  static const String k_STATUSABOUTWARRANT_CompleteCancleWarrant = 'CompleteCancleWarrant';
  static const String k_STATUSABOUTWARRANT_RejectCancelWarrant = 'RejectCancelWarrant';
  static const String k_STATUSABOUTWARRANT_WaitApproveWarrant = 'WaitApproveWarrant';
  static const String k_STATUSABOUTWARRANT_WaitingToIssueWarrant = 'WaitingToIssueWarrant';
  static const String k_STATUSABOUTWARRANT_WaitForRevokeWarrant = 'WaitForRevokeWarrant';
  static const String k_STATUSABOUTWARRANT_WaitForCourtWrit = 'WaitForCourtWrit';

  static const String m_STATUSABOUTWARRANT_NotRequestWarrant = 'ไม่ได้ออกหมายจับ';
  static const String m_STATUSABOUTWARRANT_WaitSubpoenaNumber = 'รอเลขหมายจับ';
  static const String m_STATUSABOUTWARRANT_HaveWarrant = 'มีผลบังคับใช้ตามกฏหมาย';
  static const String m_STATUSABOUTWARRANT_WaitArppoveRevokeWarrant = 'รออนุมัติถอนหมายจับ';
  static const String m_STATUSABOUTWARRANT_CompleteRevoke = 'ถอนหมายเสร็จสมบูรณ์';
  static const String m_STATUSABOUTWARRANT_RejectRevokeWarrant = 'ไม่ได้รับการอนุมัติถอนหมาย';
  static const String m_STATUSABOUTWARRANT_WaitApproveCancelWarrant = 'รออนุมัติยกเลิกหมาย';
  static const String m_STATUSABOUTWARRANT_CompleteCancleWarrant = 'ยกเลิกหมายเสร็จสมบูรณ์';
  static const String m_STATUSABOUTWARRANT_RejectCancelWarrant = 'ไม่ได้รับการอนุมัติยกเลิกหมาย';
  static const String m_STATUSABOUTWARRANT_WaitApproveWarrant = 'รออนุมัติออกหมาย';
  static const String m_STATUSABOUTWARRANT_WaitingToIssueWarrant = 'รอออกหมายจับ';
  static const String m_STATUSABOUTWARRANT_WaitForRevokeWarrant = 'รอยกเลิกหมายจับหรือร่างหมายจับ';
  static const String m_STATUSABOUTWARRANT_WaitForCourtWrit = 'รอคำสั่งศาล';


  static const String k_STATUSVICTIMORSUSPECT_Victim = 'Victim';
  static const String k_STATUSVICTIMORSUSPECT_Suspect = 'Suspect';

  static const String m_STATUSVICTIMORSUSPECT_Victim = 'ผู้แจ้ง/ผู้เสียหาย';
  static const String m_STATUSVICTIMORSUSPECT_Suspect = 'ผู้ต้องหา';


  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_Withdraw = 'Withdraw';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_Fine = 'Fine';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_RevokeRequest = 'RevokeRequest';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_DropInvestigation = 'DropInvestigation';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_ExcludeSomeCharges = 'ExcludeSomeCharges';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_SueAllCharges = 'SueAllCharges';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_CancelAllCharges = 'CancelAllCharges';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_ShouldDropInvestigation = 'ShouldDropInvestigation';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_ReVokeCaseNum = 'ReVokeCaseNum';
  static const String k_DISPLAYRESULTCASE_INVESTIGATOR_OtherResults = 'OtherResults';

  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_Withdraw = 'จำหน่ายถอนคดี';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_Fine = 'ดำเนินคดีเปรียบเทียบปรับ';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_RevokeRequest = 'ถอนคำร้องทุกข์';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_DropInvestigation = 'งดการสอบสวน(โทษไม่เกิน 3 ปี)';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_ExcludeSomeCharges = 'สั่งฟ้องบางข้อหา';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_SueAllCharges = 'สั่งฟ้องทุกข้อหา';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_CancelAllCharges = 'สั่งไม่ฟ้องทุกข้อหา';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_ShouldDropInvestigation = 'ควรให้งดการสอบสวน (โทษเกิน 3 ปี)';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_ReVokeCaseNum = 'ถอนเลขคดี';
  static const String m_DISPLAYRESULTCASE_INVESTIGATOR_OtherResults = 'อื่นๆ';


}