import 'package:json_annotation/json_annotation.dart';

part 'trafficcase_dto.g.dart';

@JsonSerializable()
class TrafficCaseDto {
  TrafficCaseDto({
    this.statusMagenta,
    this.caseStatus,
    this.caseNo,
    this.crimeCaseNo,
    this.crimeCaseYear,
    this.caseAcceptDate,
    this.policeFullName,
    this.displayVictimsName,
    this.displaySuspectName,
    this.displayCharge,
    this.provinceName,
    this.amphurName,
    this.tambonName,
    this.provinceCode,
    this.amphur,
    this.tambon,
    this.road,
    this.soi,
    this.displayResultCase_investigator,
    this.displayResultC_headInvestigato,
    this.bk,
    this.bh,
    this.orgCode,
    this.stationName,
    this.tcid,
    this.fullcaseNo,
    this.evenStartDate,  //EVENTSTARTDATE
    this.evenEndDate,  //EVENTENDDATE
  });

  factory TrafficCaseDto.fromJson(Map<String, dynamic> json) => _$TrafficCaseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TrafficCaseDtoToJson(this);

  @JsonKey(name: 'STATUSMAGENTA') String? statusMagenta;
  @JsonKey(name: 'CASESTATUS') String? caseStatus;
  @JsonKey(name: 'CASENO') String? caseNo;
  @JsonKey(name: 'CRIMECASENO') String? crimeCaseNo;
  @JsonKey(name: 'CRIMECASEYEAR') String? crimeCaseYear;
  @JsonKey(name: 'CASEACCEPTDATE') String? caseAcceptDate;
  @JsonKey(name: 'POLICEFULLNAME') String? policeFullName;
  @JsonKey(name: 'DISPLAYVICTIMSNAME') String? displayVictimsName;
  @JsonKey(name: 'DISPLAYSUSPECTSNAME') String? displaySuspectName;
  @JsonKey(name: 'DISPLAYCHARGE') String? displayCharge;
  @JsonKey(name: 'PROVINCENAME') String? provinceName;
  @JsonKey(name: 'AMPHURNAME') String? amphurName;
  @JsonKey(name: 'TAMBONNAME') String? tambonName;
  @JsonKey(name: 'PROVINCECODE') String? provinceCode;
  @JsonKey(name: 'AMPHURCODE') String? amphur;
  @JsonKey(name: 'TAMBONCODE') String? tambon;
  @JsonKey(name: 'ROAD') String? road;
  @JsonKey(name: 'SOI') String? soi;
  @JsonKey(name: 'DISPLAYRESULTCASE_INVESTIGATOR') String? displayResultCase_investigator;
  @JsonKey(name: 'DISPLAYRESULTC_HEADINVESTIGATO') String? displayResultC_headInvestigato;
  @JsonKey(name: 'BK') String? bk;
  @JsonKey(name: 'BH') String? bh;
  @JsonKey(name: 'ORGCODE') String? orgCode;
  @JsonKey(name: 'STATIONNAME') String? stationName;
  @JsonKey(name: 'TCID') String? tcid;
  @JsonKey(name: 'FULLCASENO') String? fullcaseNo;
  @JsonKey(name: 'EVENTSTARTDATE') String? evenStartDate;
  @JsonKey(name: 'EVENTENDDATE') String? evenEndDate;

  String getCaseStatusMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseConstant.k_CASESTATUS_NewCase: message = TrafficCaseConstant.m_CASESTATUS_NewCase; break;
      case TrafficCaseConstant.k_CASESTATUS_InProcess: message = TrafficCaseConstant.m_CASESTATUS_InProcess; break;
      case TrafficCaseConstant.k_CASESTATUS_Sent: message = TrafficCaseConstant.m_CASESTATUS_Sent; break;
      case TrafficCaseConstant.k_CASESTATUS_Approve: message = TrafficCaseConstant.m_CASESTATUS_Approve; break;
      case TrafficCaseConstant.k_CASESTATUS_NotApprove: message = TrafficCaseConstant.m_CASESTATUS_NotApprove; break;
      case TrafficCaseConstant.k_CASESTATUS_Closed: message = TrafficCaseConstant.m_CASESTATUS_Closed; break;
      case TrafficCaseConstant.k_CASESTATUS_WaitingForProsecutorCaseResultNo: message = TrafficCaseConstant.m_CASESTATUS_WaitingForProsecutorCaseResultNo; break;
      case TrafficCaseConstant.k_CASESTATUS_ProsecutorNeedsMoreDetails: message = TrafficCaseConstant.m_CASESTATUS_ProsecutorNeedsMoreDetails; break;
      case TrafficCaseConstant.k_CASESTATUS_GotProsecutorReportReferenceNo: message = TrafficCaseConstant.m_CASESTATUS_GotProsecutorReportReferenceNo; break;
      case TrafficCaseConstant.k_CASESTATUS_Compromised: message = TrafficCaseConstant.m_CASESTATUS_Compromised; break;
      case TrafficCaseConstant.k_CASESTATUS_migrate: message = TrafficCaseConstant.m_CASESTATUS_migrate; break;
      case TrafficCaseConstant.k_CASESTATUS_LeadInvestigatorNeedsMoreDetails: message = TrafficCaseConstant.m_CASESTATUS_LeadInvestigatorNeedsMoreDetails; break;
    }
    return message;
  }

  String getStatusMagentaMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseConstant.k_STATUSMAGENTA_Dispose: message = TrafficCaseConstant.m_STATUSMAGENTA_Dispose; break;
      case TrafficCaseConstant.k_STATUSMAGENTA_BetweenInvestigation: message = TrafficCaseConstant.m_STATUSMAGENTA_BetweenInvestigation; break;
      case TrafficCaseConstant.k_STATUSMAGENTA_All: message = TrafficCaseConstant.k_STATUSMAGENTA_All; break;
    }
    return message;
  }

  String getDisplayResultCaseInvestigatorMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_Withdraw: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_Withdraw; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_Fine: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_Fine; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_RevokeRequest: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_RevokeRequest; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_DropInvestigation: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_DropInvestigation; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_ExcludeSomeCharges: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_ExcludeSomeCharges; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_SueAllCharges: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_SueAllCharges; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_CancelAllCharges: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_CancelAllCharges; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_ShouldDropInvestigation: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_ShouldDropInvestigation; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_ReVokeCaseNum: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_ReVokeCaseNum; break;
      case TrafficCaseConstant.k_DISPLAYRESULTCASE_INVESTIGATOR_OtherResults: message = TrafficCaseConstant.m_DISPLAYRESULTCASE_INVESTIGATOR_OtherResults; break;
    }
    return message;
  }

  String getDisplayResultCHeadInvestigatoMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_Withdraw: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_Withdraw; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_Fine: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_Fine; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_RevokeRequest: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_RevokeRequest; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_DropInvestigation: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_DropInvestigation; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_ExcludeSomeCharges: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_ExcludeSomeCharges; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_SueAllCharges: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_SueAllCharges; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_CancelAllCharges: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_CancelAllCharges; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_AddInvestigation: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_AddInvestigation; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_ReVokeCaseNum: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_ReVokeCaseNum; break;
      case TrafficCaseConstant.k_DISPLAYRESULTC_HEADINVESTIGATO_OtherResults: message = TrafficCaseConstant.m_DISPLAYRESULTC_HEADINVESTIGATO_OtherResults; break;
    }
    return message;
  }

}

@JsonSerializable()
class ListTrafficCaseDto {
  ListTrafficCaseDto({
    this.status,
    this.data,
  });

  factory ListTrafficCaseDto.fromJson(Map<String, dynamic> json) => _$ListTrafficCaseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListTrafficCaseDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<TrafficCaseDto>? data;
}

class TrafficCaseConstant {
  TrafficCaseConstant._();

  static const String m_statusMagenta = 'สถานะการสืบสวน';
  static const String m_caseStatus = 'สถานะคดี';
  static const String m_caseNo = 'เลขคดี';
  static const String m_crimeCaseNo = 'เลขที่คดี';
  static const String m_crimeCaseYear = 'เลขท่ีปีคดี';
  static const String m_caseAcceptDate = 'วันที่รับคำร้องทุกข์';
  static const String m_policeFullName = 'พนักงานสอบสวน';
  static const String m_displayVictimsName = 'ชื่อ - ผู้แจ้ง/ผู้เสียหาย';
  static const String m_displaySuspectName = 'ชื่อ - ผู้ต้องหา';
  static const String m_displayCharge = 'ข้อหา';
  static const String m_provinceName = 'จังหวัด';
  static const String m_amphurName = 'อำเภอ';
  static const String m_tambonName = 'ตำบล';
  static const String m_provinceCode = 'รหัสจังหวัด';
  static const String m_amphur = 'รหัสอำเภอ';
  static const String m_tambon = 'รหัสตำบล';
  static const String m_road = 'ถนน';
  static const String m_soi = 'ซอย';
  static const String m_displayResultCase_investigator = 'ผลคดีชั้นพงส.';
  static const String m_displayResultC_headInvestigato = 'ผลคดีชั้น หน.พงส';
  static const String m_bk = 'บช./ภาค';
  static const String m_bh = 'บก./ภ.จว';
  static const String m_orgCode = 'รหัสสถานี';
  static const String m_stationName = 'ชื่อสถานี';
  static const String m_tcid = 'ObjectID';
  static const String m_fullcaseNo = 'Rowkey';
  static const String m_evenStartDate = 'วันที่เกิดเหตุ';
  static const String m_evenEndDate = 'ถึงวันที่';


  static const String k_STATUSMAGENTA_Dispose = 'Dispose';
  static const String k_STATUSMAGENTA_BetweenInvestigation = 'BetweenInvestigation';
  static const String k_STATUSMAGENTA_All = 'All';

  static const String m_STATUSMAGENTA_Dispose = 'จำหน่าย';
  static const String m_STATUSMAGENTA_BetweenInvestigation = 'ระหว่างสืบสวน';
  static const String m_STATUSMAGENTA_All = 'ทั้งหมด';


  static const String k_CASESTATUS_NewCase = 'NewCase';
  static const String k_CASESTATUS_InProcess = 'InProcess';
  static const String k_CASESTATUS_Sent = 'Sent';
  static const String k_CASESTATUS_Approve = 'Approve';
  static const String k_CASESTATUS_NotApprove = 'NotApprove';
  static const String k_CASESTATUS_Closed = 'Closed';
  static const String k_CASESTATUS_WaitingForProsecutorCaseResultNo = 'WaitingForProsecutorCaseResultNo';
  static const String k_CASESTATUS_ProsecutorNeedsMoreDetails = 'ProsecutorNeedsMoreDetails';
  static const String k_CASESTATUS_GotProsecutorReportReferenceNo = 'GotProsecutorReportReferenceNo';
  static const String k_CASESTATUS_Compromised = 'Compromised';
  static const String k_CASESTATUS_migrate = 'migrate';
  static const String k_CASESTATUS_LeadInvestigatorNeedsMoreDetails = 'LeadInvestigatorNeedsMoreDetails';

  static const String m_CASESTATUS_NewCase = 'คดีใหม่';
  static const String m_CASESTATUS_InProcess = 'อยู่ระหว่างดำเนินการ';
  static const String m_CASESTATUS_Sent = 'อยู่ระหว่างส่งสำนวน';
  static const String m_CASESTATUS_Approve = 'อนุมัติสำนวน';
  static const String m_CASESTATUS_NotApprove = 'ไม่อนุมัติสำนวน';
  static const String m_CASESTATUS_Closed = 'อัยการรับเรื่อง';
  static const String m_CASESTATUS_WaitingForProsecutorCaseResultNo = 'รอเลขที่อัยการ';
  static const String m_CASESTATUS_ProsecutorNeedsMoreDetails = 'สำนวนอัยการสั่งสอบเพิ่ม';
  static const String m_CASESTATUS_GotProsecutorReportReferenceNo = 'รับเลขที่อัยการแล้ว';
  static const String m_CASESTATUS_Compromised = 'ไกล่เกลี่ย/ยอมความ';
  static const String m_CASESTATUS_migrate = 'คดีโอน';
  static const String m_CASESTATUS_LeadInvestigatorNeedsMoreDetails = 'สานวนหัวหน้าพงส.ส่งสอบเพิ่ม';


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


  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_Withdraw = 'Withdraw';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_Fine = 'Fine';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_RevokeRequest = 'RevokeRequest';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_DropInvestigation = 'DropInvestigation';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_ExcludeSomeCharges = 'ExcludeSomeCharges';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_SueAllCharges = 'SueAllCharges';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_CancelAllCharges = 'CancelAllCharges';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_AddInvestigation = 'AddInvestigation';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_ReVokeCaseNum = 'ReVokeCaseNum';
  static const String k_DISPLAYRESULTC_HEADINVESTIGATO_OtherResults = 'OtherResults';

  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_Withdraw = 'จำหน่ายถอนคดี';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_Fine = 'เปรียบเทียบปรับ';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_RevokeRequest = 'ถอนคำร้องทุกข์';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_DropInvestigation = 'งดการสอบสวน';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_ExcludeSomeCharges = 'สั่งฟ้องบางข้อหา';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_SueAllCharges = 'สั่งฟ้องทุกข้อหา';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_CancelAllCharges = 'สั่งไม่ฟ้องทุกข้อหา';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_AddInvestigation = 'สั่งสอบสวนเพิ่มเติม';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_ReVokeCaseNum = 'ถอนเลขคดี';
  static const String m_DISPLAYRESULTC_HEADINVESTIGATO_OtherResults = 'อื่นๆ';


}