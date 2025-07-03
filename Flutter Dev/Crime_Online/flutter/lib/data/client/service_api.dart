import 'package:crimes/data/client/request/auth/check_version_request_dto.dart';
import 'package:crimes/data/client/request/auth/login_scanqr_crimes_request_dto.dart';
import 'package:crimes/data/client/request/auth/nearest_station_request_dto.dart';
import 'package:crimes/data/client/request/auth/responsible_station_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_getscope_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_lk2_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_regis_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_renew_request_dto.dart';
import 'package:crimes/data/client/request/outer/acc_request_dto.dart';
import 'package:crimes/data/client/request/encrypt_request_dto.dart';
import 'package:crimes/data/client/request/outer/hid_request_dto.dart';
import 'package:crimes/data/client/request/outer/house_request_dto.dart';
import 'package:crimes/data/client/request/auth/login_scanqr_request_dto.dart';
import 'package:crimes/data/client/request/outer/name_plt_request_dto.dart';
import 'package:crimes/data/client/request/outer/name_request_dto.dart';
import 'package:crimes/data/client/request/outer/numbody_request_dto.dart';
import 'package:crimes/data/client/request/outer/passport_request_dto.dart';
import 'package:crimes/data/client/request/outer/pb1_request_dto.dart';
import 'package:crimes/data/client/request/outer/pid_plt_request_dto.dart';
import 'package:crimes/data/client/request/outer/pid_request_dto.dart';
import 'package:crimes/data/client/request/outer/plate_ticket_request_dto.dart';
import 'package:crimes/data/client/request/outer/plate_vh_request_dto.dart';
import 'package:crimes/data/client/request/outer/tmrunno_request_dto.dart';
import 'package:crimes/data/client/request/outer/workerid_request_dto.dart';
import 'package:crimes/data/client/response/auth/check_version_response_dto.dart';
import 'package:crimes/data/client/response/auth/generate_thaidstate_response_dto.dart';
import 'package:crimes/data/client/response/auth/login_scanqr_crimes_response_dto.dart';
import 'package:crimes/data/client/response/auth/nearest_station_response_dto.dart';
import 'package:crimes/data/client/response/auth/responsible_station_response_dto.dart';
import 'package:crimes/data/client/response/auth/thaid_getscope_response_dto.dart';
import 'package:crimes/data/client/response/auth/thaid_regis_response_dto.dart';
import 'package:crimes/data/client/response/auth/thaid_renew_response_dto.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/client/response/encrypt_response_dto.dart';
import 'package:crimes/data/client/response/auth/login_scanqr_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'service_api.g.dart';

@RestApi()
abstract class ServiceApi {
  factory ServiceApi(Dio dio) = _ServiceApi;

  //---------------------- Authentication -----------------------------

  @POST('/crimesservice/mobile/version.check')
  Future<CheckVersionResponseDto> checkVersion(@Body() CheckVersionRequestDto request);

  @POST('/crimesservice/mobile/login.scanqr')
  Future<LoginScanQrResponseDto> scanQrLogin(@Body() LoginScanQrRequestDto request);  //Send Keys

  @POST('/crimesservice/mobile/thaid.generatestate')
  Future<GenerateThaIDStateResponseDto> generateThaIDState();

  @POST('/crimesservice/mobile/thaid.getscope')
  Future<ThaIDGetScopeResponseDto> getThaIDScope(@Body() ThaIDGetScopeRequestDto request);

  @POST('/crimesservice/mobile/thaid.regiscrimesonline')
  Future<ThaIDRegisResponseDto> regisThaIDCrimesOnline(@Body() ThaIDRegisRequestDto request);

  @POST('/crimesservice/mobile/thaid.renewcrimesonline')
  Future<ThaIDRenewResponseDto> renewThaIDCrimesOnline(@Body() ThaIDRenewRequestDto request);

  // @POST('/crimesservice/mobile/mx4.authen.test')
  // Future<LoginScanQrCRIMESResponseDto> scanQrLoginCRIMES(@Body() LoginScanQrCRIMESRequestDto request);

  @POST('/crimesservice/mobile/mx4.authen')
  Future<CommonResponseDto> scanQrLoginCRIMES(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/device.activate.check')
  Future<CommonResponseDto> checkActivateDevice(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/pin.register')
  Future<CommonResponseDto> registerPin(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/pin.change')
  Future<CommonResponseDto> changePin(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/biometrics.register')
  Future<CommonResponseDto> registerBiometrics(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/biometrics.change')
  Future<CommonResponseDto> changeBiometrics(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/biometrics.verify')
  Future<CommonResponseDto> verifyBiometrics(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/pin.verify')
  Future<CommonResponseDto> verifyPin(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/pin.verify.passcode')
  Future<CommonResponseDto> verifyPinPasscode(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/user.get')
  Future<EncryptResponseDto> getUser(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/passcode.generate')
  Future<EncryptResponseDto> generatePasscode(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/pushtoken.update')
  Future<CommonResponseDto> updatePushToken(@Body() EncryptRequestDto request);

  @POST('/crimesservice/socauthen/token.get')
  Future<EncryptResponseDto> getToken(@Body() EncryptRequestDto request);


  //----------------------- Linkage II -----------------------

  @POST('/crimesservice/mobile/thaid/lk2.generatestate')
  Future<GenerateThaIDStateResponseDto> generateThaIDStateLK2();

  @POST('/crimesservice/mobile/thaid/lk2.login.confirm')
  Future<ThaIDRegisResponseDto> loginConfirmLK2(@Body() ThaIDLk2RequestDto request);

  //---------------------- Outer -----------------------------

  // DOPA - ทะเบียนราษฎร (civil)
  @POST('/crimesservice/mobile/crimesapidopa.getpersondetailbypid')  // PidRequest, Civil/Person
  Future<EncryptResponseDto> getPersonDetailByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getpersondetailbyname')  // NameRequest, Civil/Person
  Future<EncryptResponseDto> getPersonDetailByName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getpersondetailbyoldname')  // NameRequest, Civil/Person
  Future<EncryptResponseDto> getPersonDetailByOldName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getcarddetailallbypid')  // PidRequest, Civil/Card
  Future<EncryptResponseDto> getCardDetailByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getcarddetaillatestbypid')  // PidRequest, Civil/Idc
  Future<EncryptResponseDto> getCardDetailLatestByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getpersonimagebypb1')  // Pb1Request, Common/Image
  Future<EncryptResponseDto> getPersonImageByPb1(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getcountpersonbyhid')  // HidRequest, Civil/NumberResident
  Future<EncryptResponseDto> getCountPersonByHid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getpersondetailbyhid')  // HidRequest, Civil/PopHouse
  Future<EncryptResponseDto> getPersonDetailByHid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getpersonchangenamebypid')  // PidRequest, Civil/ChangeName
  Future<EncryptResponseDto> getPersonChangeNameByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getpersonchangeaddrbypid')  // PidRequest, Civil/ChangeAddress
  Future<EncryptResponseDto> getPersonChangeAddrByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getcarddetailbypb1')  // Pb1Request, Civil/IdcBp1
  Future<EncryptResponseDto> getCardDetailBypb1(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.gethousedetailbyhid')  // HidRequest, Civil/House
  Future<EncryptResponseDto> getHouseDetailByHid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.gethousedetailbyaddr')  // HouseRequest, Civil/House
  Future<EncryptResponseDto> getHouseDetailByAddr(@Body() EncryptRequestDto request);


  // DOPA - แรงงาน (กรมการปกครอง) (foreign)
  @POST('/crimesservice/mobile/crimesapidopa.getforeignworkerdetailbyworkerid')  // WorkerIdRequest, Foreign/Worker
  Future<EncryptResponseDto> getForeignWorkerDetailByWorkerId(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidopa.getforeignworkerimagebyworkerid')  // WorkerIdRequest, Common/Image
  Future<EncryptResponseDto> getForeignWorkerImageByWorkerId(@Body() EncryptRequestDto request);


  // LINKAGE - ทร (new_linkage)
  @POST('/crimesservice/mobile/crimesapilinkage.getpersoninfobypid')  // PidRequest, Linkage/PersonLk
  Future<EncryptResponseDto> getPersonInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersoninfobyname')  // NameRequest, Linkage/PersonLk
  Future<EncryptResponseDto> getPersonInfoByName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersoninfobyoldname')  // NameRequest, Linkage/PersonLk
  Future<EncryptResponseDto> getPersonInfoByOldName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.gethouseinfobyhid')  // HidRequest, Linkage/HouseLk
  Future<EncryptResponseDto> getHouseInfoByHid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.gethouseinfobypid')  // PidRequest, Linkage/HouseLk
  Future<EncryptResponseDto> getHouseInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getcardlistbypid')  // PidRequest, Linkage/CardLk
  Future<EncryptResponseDto> getCardListByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersoninfolistbyhid')   // HidRequest, Linkage/PersonInHouseLk
  Future<EncryptResponseDto> getPersonInfoListByHid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersoninfolistbypid')  // PidRequest, Linkage/PersonInHouseLk
  Future<EncryptResponseDto> getPersonInfoListByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getcardinfobypb1')  // Pb1Request, Linkage/MakeCardLk
  Future<EncryptResponseDto> getCardInfoByPb1(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getcardinfobypid')  // PidRequest, Linkage/MakeCardLk
  Future<EncryptResponseDto> getCardInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getchangeaddrmoveinbypid')  // PidRequest, Linkage/MoveLk
  Future<EncryptResponseDto> getChangeAddrMoveInByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getchangeaddrmoveoutbypid')  // PidRequest, Linkage/MoveLk
  Future<EncryptResponseDto> getChangeAddrMoveOutByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getchangenameinfobypid')  // PidRequest, Linkage/ChangeNameLk
  Future<EncryptResponseDto> getChangeNameInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersonimageinfobypid')  // PidRequest, Common/Image
  Future<EncryptResponseDto> getPersonImageInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersonimageinfobypb1')  // Pb1Request, Common/Image
  Future<EncryptResponseDto> getPersonImageInfoByPb1(@Body() EncryptRequestDto request);

  // คนต่างด้าว / แรงงานต่างด้าว (linkage)
  @POST('/crimesservice/mobile/crimesapilinkage.getforeignpersoninfobypid')  // PidRequest, Linkage/ForeignPersonLk
  Future<EncryptResponseDto> getForeignPersonInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getforeignpersonimageinfobypid')  // PidRequest, Common/Image
  Future<EncryptResponseDto> getForeignPersonImageInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getforeignworkerinfobypid')  // PidRequest, Linkage/WorkerLk
  Future<EncryptResponseDto> getForeignWorkerInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersonnonnationthaiinfobypid')  // PidRequest, Linkage/WorkerLk
  Future<EncryptResponseDto> getPersonNonNationThaiInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getpersonnoregisterstatusinfobypid')  // PidRequest, Linkage/WorkerLk
  Future<EncryptResponseDto> getPersonNoRegisterStatusInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getlk2group1')  // PidRequest
  Future<EncryptResponseDto> getLk2Group1(@Body() EncryptRequestDto request);

  // DLT - กรมขนส่ง - ใบอนุญาตขับรถ (car_license)
  @POST('/crimesservice/mobile/crimesapidlt.getdriverlicenceinfobypid')  // PidPltRequest, Car/DriverLicenseInfo
  Future<EncryptResponseDto> getDriverLicenceInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidlt.getdriverlicenceinfobyname')  // NamePltRequest, Car/DriverLicenseInfo
  Future<EncryptResponseDto> getDriverLicenceInfoByName(@Body() EncryptRequestDto request);


  // DLT - กรมขนส่ง - ใบอนุญาตขับรถขนส่ง (bus_license)
  @POST('/crimesservice/mobile/crimesapidlt.getpublicLicenceInfobypid')  // PidPltRequest, Car/DriverLicenseInfo
  Future<EncryptResponseDto> getPublicLicenceInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidlt.getpubliclicenceinfobyname')  // NamePltRequest, Car/DriverLicenseInfo
  Future<EncryptResponseDto> getPublicLicenceInfoByName(@Body() EncryptRequestDto request);


  // DLT - กรมขนส่ง - ยานพาหนะ (car)
  @POST('/crimesservice/mobile/crimesapidlt.getvehicleinfobypid')  // PidPltRequest, Car/VehicleInfo
  Future<EncryptResponseDto> getVehicleInfoByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidlt.getvehicleinfobyname')  // NamePltRequest, Car/VehicleInfo
  Future<EncryptResponseDto> getVehicleInfoByName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidlt.getvehicleinfobyplate')  // PlateVhRequest, Car/VehicleInfo
  Future<EncryptResponseDto> getVehicleInfoByPlate(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidlt.getvehicleinfobynumbody')  // NumBodyRequest, Car/VehicleInfo
  Future<EncryptResponseDto> getVehicleInfoByNumBody(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapidlt.getvehicleinfobypassport')  // PassportRequest, Car/VehicleInfo
  Future<EncryptResponseDto> getVehicleInfoByPassport(@Body() EncryptRequestDto request);

  // SSO - ประกันสังคม (social)
  @POST('/crimesservice/mobile/crimesapisso.getemployeeemploymentbypid')  // PidRequest, Social/Employment
  Future<EncryptResponseDto> getEmployeeEmploymentByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapisso.getselecthospitalpid')  // PidRequest, Social/Hospital
  Future<EncryptResponseDto> getSelectHospitalPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapisso.getemployerdetail')  // AccRequest, Social/Employer
  Future<EncryptResponseDto> getEmployerDetail(@Body() EncryptRequestDto request);


  // NHSO - ประกันสุขภาพ (health)
  @POST('/crimesservice/mobile/crimesapinhso.gethealthinsurancebypid')  // PidRequest, Health/Health
  Future<EncryptResponseDto> getHealthInsuranceByPid(@Body() EncryptRequestDto request);


  // TM - ตรวจคนเข้าเมือง (immigration)
  @POST('/crimesservice/mobile/crimesapitm.gettraveldetailbypassport')  // PassportRequest, Immigration/Travel
  Future<EncryptResponseDto> getTravelDetailByPassport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapitm.gettraveldetailbypid')  // PidRequest, Immigration/Travel
  Future<EncryptResponseDto> getTravelDetailByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapitm.gettraveldetailbytmrunno')  // TmRunnoRequest, Immigration/TravelVisa
  Future<EncryptResponseDto> getTravelDetailByTmRunno(@Body() EncryptRequestDto request);

  // Immigration
  @POST('/crimesservice/mobile/immigration/pasid')
  Future<EncryptResponseDto> getImmigrationByPassport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/immigration/name')
  Future<EncryptResponseDto> getImmigrationByName(@Body() EncryptRequestDto request);

  // Extension
  @POST('/crimesservice/mobile/crimesapibio.getextension')
  Future<EncryptResponseDto> getExtension(@Body() EncryptRequestDto request);

  // TM - ที่พักต่างด้าว (foreignhouse)
  @POST('/crimesservice/mobile/crimesapitm.gettm61detailbypassport')  // PassportRequest, ForeignHouse/Tm61
  Future<EncryptResponseDto> getTm61DetailByPassport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapitm.gettm61detailbyname')  // NameRequest, ForeignHouse/Tm61
  Future<EncryptResponseDto> getTm61DetailByName(@Body() EncryptRequestDto request);

  // LINKAGE - ใบอนุญาต ป.4 (p4)
  @POST('/crimesservice/mobile/crimesapilinkage.getgundetailbypid')  // PidRequest, P4/Gun
  Future<EncryptResponseDto> getGunDetailByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapilinkage.getguninfo')  // PidRequest, P4/Gun
  Future<EncryptResponseDto> getGunInfo(@Body() EncryptRequestDto request);

  // PTM - ใบสั่งจราจร (traffic)
  @POST('/crimesservice/mobile/crimesapiptm.getalltickelist')  // PlateTicketRequest, Traffic/Ticket
  Future<EncryptResponseDto> getAllTickeList(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapiptm.getalltickelistbyname')  // NameRequest, Traffic/Ticket
  Future<EncryptResponseDto> getAllTickeListByName(@Body() EncryptRequestDto request);

  // FaceRec บช.ก.
  @POST('/crimesservice/mobile/cib.getpersonbyface')
  Future<EncryptResponseDto> getPersonByFace(@Body() EncryptRequestDto request);

  //---------------------- Inner -----------------------------


  @POST('/crimesservice/mobile/crimecase/fullcaseno')  // FullcaseNoRequest, CrimeCase
  Future<EncryptResponseDto> crimeCaseByFullcaseNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimecase/object_id')  // ObectIdRequest, CrimeCase
  Future<EncryptResponseDto> crimeCaseByObjectId(@Body() EncryptRequestDto request);


  //@POST('/crimesservice/mobile/cc_person/pid')  // PidRequest, CrimeCasePerson
  @POST('/crimesservice/mobile/cc_person_case/pid')  // PidRequest, CrimeCasePerson
  Future<EncryptResponseDto> ccPersonByPid(@Body() EncryptRequestDto request);

  //@POST('/crimesservice/mobile/cc_person/pasid')  // PasIdRequest, CrimeCasePerson
  @POST('/crimesservice/mobile/cc_person_case/pasid')  // PasIdRequest, CrimeCasePerson
  Future<EncryptResponseDto> ccPersonByPasId(@Body() EncryptRequestDto request);

  //@POST('/crimesservice/mobile/cc_person/name')  // NameRequest, CrimeCasePerson
  @POST('/crimesservice/mobile/cc_person_case/name')  // NameRequest, CrimeCasePerson
  Future<EncryptResponseDto> ccPersonByName(@Body() EncryptRequestDto request);

  //@POST('/crimesservice/mobile/cc_person/fullcaseno')  // FullcaseNoRequest, CrimeCasePerson
  @POST('/crimesservice/mobile/cc_person_case/fullcaseno')  // FullcaseNoRequest, CrimeCasePerson
  Future<EncryptResponseDto> ccPersonByFullcaseNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/cc_person/object_id')  // ObectIdRequest, CrimeCasePerson
  Future<EncryptResponseDto> ccPersonByObjectId(@Body() EncryptRequestDto request);


  @POST('/crimesservice/mobile/cc_vehicle/fullnoplate')  // FullNoPlateRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> ccVehicleByFullNoPlate(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/cc_vehicle/fullengineno')  // FullEngineNoRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> ccVehicleByFullEngineNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/cc_vehicle/fullcaseno')  // FullcaseNoRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> ccVehicleByFullcaseNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/cc_vehicle/object_id')  // ObectIdRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> ccVehicleByObjectId(@Body() EncryptRequestDto request);


  @POST('/crimesservice/mobile/trafficcase/fullcaseno')  // FullcaseNoRequest, TrafficCase
  Future<EncryptResponseDto> trafficCaseByFullcaseNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/trafficcase/object_id')  // ObectIdRequest, TrafficCase
  Future<EncryptResponseDto> trafficCaseByObjectId(@Body() EncryptRequestDto request);

  //@POST('/crimesservice/mobile/tc_person/pid')  // PidRequest, TrafficCasePerson
  @POST('/crimesservice/mobile/tc_person_case/pid')  // PidRequest, TrafficCasePerson
  Future<EncryptResponseDto> tcPersonByPid(@Body() EncryptRequestDto request);

  //@POST('/crimesservice/mobile/tc_person/pasid')  // PasIdRequest, TrafficCasePerson
  @POST('/crimesservice/mobile/tc_person_case/pasid')  // PasIdRequest, TrafficCasePerson
  Future<EncryptResponseDto> tcPersonByPasId(@Body() EncryptRequestDto request);

  //@POST('/crimesservice/mobile/tc_person/name')  // NameRequest, TrafficCasePerson
  @POST('/crimesservice/mobile/tc_person_case/name')  // NameRequest, TrafficCasePerson
  Future<EncryptResponseDto> tcPersonByName(@Body() EncryptRequestDto request);

  //@POST('/crimesservice/mobile/tc_person/fullcaseno')  // FullcaseNoRequest, TrafficCasePerson
  @POST('/crimesservice/mobile/tc_person_case/fullcaseno')  // FullcaseNoRequest, TrafficCasePerson
  Future<EncryptResponseDto> tcPersonByFullcaseNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/tc_person/object_id')  // ObectIdRequest, TrafficCasePerson
  Future<EncryptResponseDto> tcPersonByObjectId(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/tc_vehicle/fullnoplate')  // FullNoPlateRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> tcVehicleByFullNoPlate(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/tc_vehicle/fullengineno')  // FullEngineNoRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> tcVehicleByFullEngineNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/tc_vehicle/fullcaseno')  // FullcaseNoRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> tcVehicleByFullcaseNo(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/tc_vehicle/object_id')  // ObectIdRequest, CrimeCaseVehicle
  Future<EncryptResponseDto> tcVehicleByObjectId(@Body() EncryptRequestDto request);


  @POST('/crimesservice/mobile/warrant')  // WarrantRequest, Warrant
  Future<EncryptResponseDto> warrant(@Body() EncryptRequestDto request);

  // @POST('/crimesservice/mobile/warrantCrimesview')  // WarrantRequest, Warrant
  // Future<EncryptResponseDto> warrantPolis(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/warrant')  // WarrantCourtRequest, Warrant
  Future<EncryptResponseDto> warrantCourt(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/warrantcrd')  // WarrantRequest, Warrant
  Future<EncryptResponseDto> warrantCRD(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/warrantcourtcrd')  // WarrantRequest, Warrant
  Future<EncryptResponseDto> warrantCourtCRD(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/rednotice')  // WarrantRequest, Warrant
  Future<EncryptResponseDto> redNotice(@Body() EncryptRequestDto request);

  //------TEST BY KHUNPON -----//

  @POST('/crimesservice/mobile/news.get')
  Future<EncryptResponseDto> getNews(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/eula.get')
  Future<EncryptResponseDto> getEula(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/notify.get')
  Future<EncryptResponseDto> getNotify(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/notifyreadflag.update')
  Future<CommonResponseDto> updateNotify(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/favorite.update')
  Future<CommonResponseDto> updateFavorite(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/ssoreport')
  Future<EncryptResponseDto> getSsoReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/dopareport')
  Future<EncryptResponseDto> getDopaReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/doereport')
  Future<EncryptResponseDto> getDoeReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/vehiclereport')
  Future<EncryptResponseDto> getVehicleReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/driverlicencereport')
  Future<EncryptResponseDto> getDriverLicenceReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/publiclicencereport')
  Future<EncryptResponseDto> getPublicLicenceReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/nhsoreport')
  Future<EncryptResponseDto> getNhsoReport(@Body() EncryptRequestDto request);

  // @POST('/crimesservice/mob/mobreport/travelreport')
  // Future<EncryptResponseDto> getTravelReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/immigrationreport')
  Future<EncryptResponseDto> getImmReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/extensionreport')
  Future<EncryptResponseDto> getExtensionReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/tm61report')
  Future<EncryptResponseDto> getTm61Report(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/gunlinkagereport')
  Future<EncryptResponseDto> getGunLinkageReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/ptmreport')
  Future<EncryptResponseDto> getPtmReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/dopalinkagereport')
  Future<EncryptResponseDto> getDopaLinkageReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/crimecasepersonreport')
  Future<EncryptResponseDto> getCrimecasePersonReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/crimecasevehiclereport')
  Future<EncryptResponseDto> getCrimecaseVehicleReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/crimecasereport')
  Future<EncryptResponseDto> getCrimecaseReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/trafficcasereport')
  Future<EncryptResponseDto> getTrafficcaseReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/trafficcasepersonreport')
  Future<EncryptResponseDto> getTrafficcasePersonReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/trafficcasevehiclereport')
  Future<EncryptResponseDto> getTrafficcaseVehicleReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/warrantreport')
  Future<EncryptResponseDto> getWarrantReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/warrantcrdreport')
  Future<EncryptResponseDto> getWarrantCRDReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/warrantcourtcrdreport')
  Future<EncryptResponseDto> getWarrantCourtCRDReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/rednoticereport')
  Future<EncryptResponseDto> getRedNoticeReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapi.getpolicestationbypoliceid')
  Future<EncryptResponseDto> getPoliceStationList(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapiprisoner.getcorrectbyname')
  Future<EncryptResponseDto> getPrisonerByName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapiprisoner.getcorrectbypid')
  Future<EncryptResponseDto> getPrisonerByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapiprisoner.getcorrectimagebyurl')
  Future<EncryptResponseDto> getPrisonerImageByUrl(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/correctreport')
  Future<EncryptResponseDto> getPrisonerReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/map/getnearestpolicestation')
  Future<NearestStationResponseDto> getNearestPoliceStation(@Body() NearestStationRequestDto request);

  @POST('/crimesservice/map/getresponsiblepolicestation')
  Future<ResponsibleStationResponseDto> getResponsibletPoliceStation(@Body() ResponsibleStationRequestDto request);

  //MockUp Rescue
  @POST('/crimesservice/mobile/crimesapirescue.getrescuevolunteerinfobypid')
  Future<EncryptResponseDto> getPersonRescueVolunteerByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapirescue.getrescuevolunteerinfobyname')
  Future<EncryptResponseDto> getPersonRescueVolunteerByName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapirescue.getcheckrescuetrainingbypid')
  Future<EncryptResponseDto> getPersonRescueTraniningByPid(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapirescue.getcheckrescuetrainingbyname')
  Future<EncryptResponseDto> getPersonRescueTrainingByName(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapirescue.getflashinglightlicenseinfobyplate')
  Future<EncryptResponseDto> getFlashingLightLicenseInfoByPlate(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/crimesapirescue.getambulancelicensebyplate')
  Future<EncryptResponseDto> getAmbulanceLicenseByPlate(@Body() EncryptRequestDto request);

  //EmergencyCar
  @POST('/crimesservice/mobile/getemergencycarbyplate')
  Future<EncryptResponseDto> getEmergencyCarByPlate(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mobile/getemergencycarbylicensenumber')
  Future<EncryptResponseDto> getEmergencyCarbyLicenseNumber(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/emergencycarreport')
  Future<EncryptResponseDto> getEmergencyCarReport(@Body() EncryptRequestDto request);

  //foreign
  @POST('/crimesservice/mob/mobreport/foreignreport')
  Future<EncryptResponseDto> getForeignReport(@Body() EncryptRequestDto request);

  //worker
  @POST('/crimesservice/mob/mobreport/workerreport')
  Future<EncryptResponseDto> getWorkerReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/personnonthaireport')
  Future<EncryptResponseDto> getPersonNonThaiReport(@Body() EncryptRequestDto request);

  @POST('/crimesservice/mob/mobreport/personnoregisreport')
  Future<EncryptResponseDto> getPersonNoRegisReport(@Body() EncryptRequestDto request);

}