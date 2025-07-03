import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';

class ParamScope {
  ParamScope();

  // TODO: Must check case by searchType and showInput,hasInput flag

  // Common
  String pid = '';            //                              - cc_person                         - tc_person                  - warrant    - civil              - car   - social   - health                                 - gun   - traffic  - rescue
  String firstName = '';      //                              - cc_person                         - tc_person                  - warrant    - civil              - car                                     - foreign_house           - traffic  - rescue
  String lastName = '';       //                              - cc_person                         - tc_person                  - warrant    - civil              - car                                     - foreign_house           - traffic  - rescue

  // Crimecase, Trafficcase, Warrant
  String orgCode = '';        //  รหัสหน่วยงาน           - cc   - cc_person   - cc_vehicle   - tc   - tc_person   - tc_vehicle   - warrant
  String crimeCaseYear = '';  //  เลขท่ีปีคดี              - cc   - cc_person   - cc_vehicle   - tc   - tc_person   - tc_vehicle
  String crimeCaseNo = '';    //  เลขที่คดี               - cc   - cc_person   - cc_vehicle   - tc   - tc_person   - tc_vehicle
  String pasId = '';          //  เลขพาสปอร์ต - ผู้ต้องหา         - cc_person                         - tc_person
  String nation = '';         //  สัญชาติ - ผู้ต้องหา              - cc_person                         - tc_person
  String proviceTc = '';      //  จังหวัด - ทะเบียนรถ                          - cc_vehicle                        - tc_vehicle
  String intitialNo = '';     //  ตัวอักษร - ทะเบียนรถ                         - cc_vehicle                        - tc_vehicle
  String number = '';         //  ตัวเลข - ทะเบียนรถ                          - cc_vehicle                        - tc_vehicle
  String status = '';         //  สถานะยานพาหนะในคดี                         - cc_vehicle                        - tc_vehicle
  String engineNo = '';       //  เลขตัวเครื่อง                                - cc_vehicle                        - tc_vehicle
  String proviceWr = '';      //                                                                                               - warrant
  String tambonWr = '';       //                                                                                               - warrant
  String amphurWr = '';       //                                                                                               - warrant
  String charge = '';         //  ข้อหา                                                                                         - warrant
  String court = '';          //  ศาล                                                                                          - warrant

  // Civil
  String pb1 = '';            //  หมายเลขบป.1                                                                                               - civil
  String hid = '';            //  เลขรหัสประจำบ้าน                                                                                            - civil
  String houseno = '';        //  บ้านเลขที่                                                                                                   - civil
  String moo = '';            //  หมู่ที่                                                                                                       - civil
  String lane = '';           //  รหัสตรอก                                                                                                   - civil
  String soiCode = '';        //  รหัสซอย                                                                                                    - civil
  String roadCode = '';       //  รหัสถนน                                                                                                    - civil
  String tambonCode = '';     //  รหัสตำบล/แขวง                                                                                              - civil
  String amphurCode = '';     //  รหัสอำเภอ/เขต                                                                                              - civil
  String provinceCode = '';   //  รหัสจังหวัด                                                                                                  - civil

  // Foreign
  String workerId = '';       //  เลขบัตรคนต่างด้าว                                                                                                     - foreign

  // Civil Lk

  // Gun Lk2
  String gunReg = '';  //  หมายเลขทะเบียนอาวุธปืน

  // Car
  String pltcode1 = '';        //  รหัสประเภทใบอนุญาตขับรถ
  String pltcode2 = '';        //  รหัสประเภทใบอนุญาตขับรถ-ขนส่ง  //                                                                                                - car
  String plate1Vh = '';       //  ทะเบียนรถ (ตัวอักษร)                                                                                                             - car                                                                           - rescue
  String plate2Vh = '';       //  ทะเบียนรถ (ตัวเลข)                                                                                                              - car                                                                           - rescue
  String provcode = '';       //  รหัสทะเบียนรถ (จังหวัด)                                                                                                           - car                                                                           - rescue
  String vhtype = '';         //  รหัสประเภทยานพาหนะ(กรมขนส่ง)                                                                                                    - car
  String numbody = '';        //  หมายเลขตัวถัง                                                                                                                   - car
  String brncode = '';        //  รหัสยี่ห้อ(กรมขนส่ง)                                                                                                               - car
  String licensenumber = '';  //  เลขหนังสืออนุญาต                                                                                                               - car

  // Social
  String accno = '';          //  รหัสสถานประกอบการ                                                                                                                      - social
  String accbranch = '';      //  รหัสสาขา                                                                                                                               - social

  // Immigration, ForeignHouse
  String passportNo = '';     //  เลขพาสปอร์ต                                                                                                                                              - immigration   - foreign_house
  String tmrunno = '';        //  หมายเลขอ้างอิง                                                                                                                                            - immigration

  // Traffic
  String plate1Tf = '';       //  ทะเบียนรถ (ตัวอักษร)                                                                                                                                                                                  - traffic
  String plate2Tf = '';       //  ทะเบียนรถ (ตัวเลข)                                                                                                                                                                                   - traffic
  String plate3Tf = '';       //  ทะเบียนรถ (จังหวัด)                                                                                                                                                                                   - traffic
  String ticketId = '';       //  เลขที่ใบสั่ง                                                                                                                                                                                           - traffic

  // FaceRec
  String base64Image = '';

  // ------------- Observe for show Input by Search Type -------------
  //
  // //SEARCH_PERSON
  // bool showInputPersonSS = false;
  // bool showInputPersonTC = false;
  // bool showInputPersonWR = false;
  //
  // bool showInputCivil = false;
  // bool showInputForeign = false;
  // bool showInputCivilLk = false;
  // bool showInputCar = false;
  // bool showInputSocial = false;
  // bool showInputImmigration = false;
  //
  // //SEARCH_CAR
  // bool showInputTraffic = false;

  bool showInputPid = false;
  bool showInputNames = false;

  // Crimecase, Trafficcase, Warrant
  bool showInputFullcaseNo = false;
  bool showInputPasId = false;
  bool showInputFullNoPlate = false;
  bool showInputFullEngineNo = false;
  bool showInputWrAddress = false;
  bool showInputCourt = false;
  bool showInputOrgCode = false;

  // Civil
  bool showInputPb1 = false;
  bool showInputHid = false;

  // Foreign
  bool showInputWorkerId = false;

  // Gun Lk2
  bool showInputGunReg = false;

  // Car
  bool showInputPidPlt1 = false;
  bool showInputNamesPlt1 = false;
  bool showInputPidPlt2 = false;
  bool showInputNamesPlt2 = false;
  bool showInputPlateProv = false;
  bool showInputNumBody = false;
  bool showInputLicenseNumber = false;

  // Social
  bool showInputAcc = false;

  // Immigration, ForeignHouse
  bool showInputPassportNo = false;
  bool showInputTmRunNo = false;

  // Traffic
  bool showInputPlateTicket = false;

  void resetAllInput() {
    // showInputPersonSS = false;
    // showInputPersonTC = false;
    // showInputPersonWR = false;
    //
    // showInputCivil = false;
    // showInputForeign = false;
    // showInputCivilLk = false;
    // showInputCar = false;
    // showInputSocial = false;
    // showInputImmigration = false;
    // showInputTraffic = false;

    showInputPid = false;
    showInputNames = false;
    showInputFullcaseNo = false;
    showInputPasId = false;
    showInputFullNoPlate = false;
    showInputFullEngineNo = false;
    showInputWrAddress = false;
    showInputCourt = false;
    showInputOrgCode = false;
    showInputPb1 = false;
    showInputHid = false;
    showInputWorkerId = false;
    showInputPidPlt1 = false;
    showInputNamesPlt1 = false;
    showInputPidPlt2 = false;
    showInputNamesPlt2 = false;
    showInputPlateProv = false;
    showInputNumBody = false;
    showInputAcc = false;
    showInputPassportNo = false;
    showInputTmRunNo = false;
    showInputPlateTicket = false;
    showInputLicenseNumber = false;
    showInputGunReg = false;

  }

  //-------------------- For check set of params foreach API ----------------------

  // Common
  bool hasInputPid = false;
  bool hasInputNames = false;

  // Crimecase, Trafficcase, Warrant
  bool hasInputFullcaseNo = false;
  bool hasInputPasId = false;
  bool hasInputFullNoPlate = false;
  bool hasInputFullEngineNo = false;
  bool hasInputWrAddress = false;
  bool hasInputCourt = false;
  bool hasInputOrgCode = false;

  // Civil
  bool hasInputPb1 = false;
  bool hasInputHid = false;

  // Foreign
  bool hasInputWorkerId = false;

  //Gun Lk2
  bool hasInputGunReg = false;

  // Car
  bool hasInputPidPlt1 = false;
  bool hasInputNamesPlt1 = false;
  bool hasInputPidPlt2 = false;
  bool hasInputNamesPlt2 = false;
  bool hasInputPlateProv = false;   // plate1+plate2+prov+vhtype
  bool hasInputNumBody = false;
  bool hasInputPlate = false;       // plate1+plate2+prov
  //bool hasInputPlateEmc = false;       // intitialno+number+provcode
  bool hasInputLicenseNumber = false;

  // Social
  bool hasInputAcc = false;

  // Immigration, ForeignHouse
  bool hasInputPassportNo = false;
  bool hasInputTmRunNo = false;

  // Traffic
  bool hasInputPlateTicket = false;

  // FaceRec
  bool hasInputImg = false;

  @override
  String toString() {
    return 'ParamScope{pid: $pid, firstName: $firstName, lastName: $lastName, gunReg: $gunReg, orgCode: $orgCode, crimeCaseYear: $crimeCaseYear, crimeCaseNo: $crimeCaseNo, pasId: $pasId, nation: $nation, proviceTc: $proviceTc, intitialNo: $intitialNo, number: $number, status: $status, engineNo: $engineNo, licenseNumber: $licensenumber, proviceWr: $proviceWr, tambonWr: $tambonWr, amphurWr: $amphurWr, charge: $charge, court: $court, pb1: $pb1, hid: $hid, houseno: $houseno, moo: $moo, lane: $lane, soiCode: $soiCode, roadCode: $roadCode, tambonCode: $tambonCode, amphurCode: $amphurCode, provinceCode: $provinceCode, workerId: $workerId, pltcode1: $pltcode1, pltcode2: $pltcode2, plate1Vh: $plate1Vh, plate2Vh: $plate2Vh, provcode: $provcode, vhtype: $vhtype, numbody: $numbody, brncode: $brncode, accno: $accno, accbranch: $accbranch, passportNo: $passportNo, tmrunno: $tmrunno, plate1Tf: $plate1Tf, plate2Tf: $plate2Tf, plate3Tf: $plate3Tf, ticketId: $ticketId, showInputPid: $showInputPid, showInputNames: $showInputNames, showInputGunReg: $showInputGunReg, showInputFullcaseNo: $showInputFullcaseNo, showInputPasId: $showInputPasId, showInputFullNoPlate: $showInputFullNoPlate, showInputFullEngineNo: $showInputFullEngineNo, showInputLicenseNumber: $showInputLicenseNumber, showInputWrAddress: $showInputWrAddress, showInputCourt: $showInputCourt, showInputOrgCode: $showInputOrgCode, showInputPb1: $showInputPb1, showInputHid: $showInputHid, showInputWorkerId: $showInputWorkerId, showInputPidPlt1: $showInputPidPlt1, showInputNamesPlt1: $showInputNamesPlt1, showInputPidPlt2: $showInputPidPlt2, showInputNamesPlt2: $showInputNamesPlt2, showInputPlateProv: $showInputPlateProv, showInputNumBody: $showInputNumBody, showInputAcc: $showInputAcc, showInputPassportNo: $showInputPassportNo, showInputTmRunNo: $showInputTmRunNo, showInputPlateTicket: $showInputPlateTicket, hasInputPid: $hasInputPid, hasInputNames: $hasInputNames, hasInputFullcaseNo: $hasInputFullcaseNo, hasInputPasId: $hasInputPasId, hasInputFullNoPlate: $hasInputFullNoPlate, hasInputFullEngineNo: $hasInputFullEngineNo, hasInputWrAddress: $hasInputWrAddress, hasInputCourt: $hasInputCourt, hasInputOrgCode: $hasInputOrgCode, hasInputPb1: $hasInputPb1, hasInputHid: $hasInputHid, hasInputWorkerId: $hasInputWorkerId, hasInputPidPlt1: $hasInputPidPlt1, hasInputNamesPlt1: $hasInputNamesPlt1, hasInputPidPlt2: $hasInputPidPlt2, hasInputNamesPlt2: $hasInputNamesPlt2, hasInputPlateProv: $hasInputPlateProv, hasInputNumBody: $hasInputNumBody, hasInputAcc: $hasInputAcc, hasInputPassportNo: $hasInputPassportNo, hasInputTmRunNo: $hasInputTmRunNo, hasInputPlateTicket: $hasInputPlateTicket, hasInputPlate: $hasInputPlate, hasInputLicenseNumber: $hasInputLicenseNumber}';
  }

  void setTypeAndUserDto(String type, UserDto userDto) {
    resetAllInput();
    if(userDto==null) return;

    switch (type) {
      case AppConstant.kSearchPerson: {

        // ------------ INNER --------------
        if(userDto.roleSearchInternal!.flagPersonSs!){
          showInputPid = true;
          showInputPasId = true;
          showInputNames = true;
        }
        if(userDto.roleSearchInternal!.flagPersonTc!){
          showInputPid = true;
          showInputPasId = true;
          showInputNames = true;
        }
        if(userDto.roleSearchInternal!.flagPersonWr!){
          showInputPid = true;
          showInputNames = true;
        }

        // ------------ OUTER --------------
        if(userDto.roleSearchExternal!.flagPersonDopa!){
          showInputPid = true;
          showInputNames = true;
        }
        if(userDto.roleSearchExternal!.flagPersonDoe!){
          showInputWorkerId = true;
        }
        if(userDto.roleSearchExternal!.flagPersonDopaLinkage!){
          showInputPid = true;
          showInputNames = true;
          showInputGunReg = true;
        }
        if(userDto.roleSearchExternal!.flagPersonDlt!){
          showInputPid = true;
          showInputNames = true;
          showInputPidPlt1 = true;
          showInputNamesPlt1 = true;
          showInputPidPlt2 = true;
          showInputNamesPlt2 = true;
          showInputPassportNo = true;
        }
        if(userDto.roleSearchExternal!.flagPersonSso!){
          showInputPid = true;
        }
        if(userDto.roleSearchExternal!.flagPersonNhso!){
          showInputPid = true;
        }
        if(userDto.roleSearchExternal!.flagPersonTm!){
          showInputPid = true;
          showInputNames = true;
          showInputPassportNo = true;
        }
        if(userDto.roleSearchExternal!.flagPersonPtm!){
          showInputPid = true;
          showInputNames = true;
        }
        if(userDto.roleSearchExternal!.flagPersonGun!){
          showInputPid = true;
        }

        // showInputCrimes = true;
        // showInputCivil = true;
        // showInputForeign = true;
        // showInputCar = true;
        // showInputSocial = true;
        // showInputImmigration = true;
      }
      break;
      case AppConstant.kSearchCar: {

        // ------------ INNER --------------
        if(userDto.roleSearchInternal!.flagVehicleCc!){
          showInputFullNoPlate = true;
          showInputFullEngineNo = true;
          showInputLicenseNumber = true;
        }
        if(userDto.roleSearchInternal!.flagVehicleTc!){
          showInputFullNoPlate = true;
          showInputFullEngineNo = true;
        }

        // ------------ OUTER --------------
        if(userDto.roleSearchExternal!.flagVerhicleDlt!){
          showInputPlateProv = true;
          showInputNumBody = true;
        }
        if(userDto.roleSearchExternal!.flagVerhiclePtm!){

        }

        // showInputTraffic = true;
      }
      break;
      case AppConstant.kSearchWeapon: {

      }
      break;
      case AppConstant.kSearchInfo: {

        // ------------ INNER --------------
        if(userDto.roleSearchInternal!.flagCrimecase!
            || userDto.roleSearchInternal!.flagPersonSs!
            || userDto.roleSearchInternal!.flagTrafficcase!
            || userDto.roleSearchInternal!.flagPersonTc!
            || userDto.roleSearchInternal!.flagVehicleCc!
            || userDto.roleSearchInternal!.flagVehicleTc!
        ){
          showInputFullcaseNo = true;
        }

      }
      break;
      case AppConstant.kSearchFirm: {

      }
      break;
      case AppConstant.kSearchAsset: {

      }
      break;
    }
  }

  void refreshHasInput(String type) {
    switch (type) {
      case AppConstant.kSearchPerson: {

        hasInputPid = (pid.isNotEmpty && pid.length==13);
        hasInputPasId = pasId.isNotEmpty && nation.isNotEmpty;
        hasInputNames = (firstName.isNotEmpty && lastName.isNotEmpty);
        hasInputWorkerId = workerId.isNotEmpty;
        hasInputPassportNo = passportNo.isNotEmpty;
        hasInputPidPlt1 = (pid.isNotEmpty && pid.length==13)  && pltcode1.isNotEmpty;
        hasInputNamesPlt1 = (firstName.isNotEmpty && lastName.isNotEmpty)  && pltcode1.isNotEmpty;
        hasInputPidPlt2 = (pid.isNotEmpty && pid.length==13)  && pltcode2.isNotEmpty;
        hasInputNamesPlt2 = (firstName.isNotEmpty && lastName.isNotEmpty)  && pltcode2.isNotEmpty;

        hasInputImg = base64Image!=null;
        hasInputGunReg = gunReg.isNotEmpty;

      }
      break;
      case AppConstant.kSearchCar: {

        hasInputFullNoPlate = proviceTc.isNotEmpty && intitialNo.isNotEmpty && number.isNotEmpty && status.isNotEmpty;
        hasInputFullEngineNo = engineNo.isNotEmpty && status.isNotEmpty;
        hasInputPlateProv = plate1Vh.isNotEmpty && plate2Vh.isNotEmpty && provcode.isNotEmpty && vhtype.isNotEmpty;
        hasInputNumBody = numbody.isNotEmpty && brncode.isNotEmpty;
        hasInputPlateTicket = (plate1Tf.isNotEmpty && plate2Tf.isNotEmpty && plate3Tf.isNotEmpty) || ticketId.isNotEmpty;
        hasInputPlate = plate1Vh.isNotEmpty && plate2Vh.isNotEmpty && provcode.isNotEmpty;

      }
      break;
      case AppConstant.kSearchWeapon: {

      }
      break;
      case AppConstant.kSearchInfo: {
        hasInputFullcaseNo = orgCode.isNotEmpty && crimeCaseYear.isNotEmpty && crimeCaseNo.isNotEmpty;

      }
      break;
      case AppConstant.kSearchFirm: {

      }
      break;
      case AppConstant.kSearchAsset: {

      }
      break;
    }
  }

}