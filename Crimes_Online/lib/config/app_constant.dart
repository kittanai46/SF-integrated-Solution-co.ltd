class AppConstant {
  AppConstant._();

  static bool isDebug = false;
  static const String host = 'bdamobile.crimespolice.com';
  static const String apiUrl = 'https://${host}';
  static const String downloadWarrantPath =
      '/crimesservice/web/webreport/getwarrantfile/';
  static const String storeUrl = 'https://${host}';
  static const String kHeaderAuthorization = 'Authorization';
  static const String tempBiometrics = 'NULL';
  static const int alphaDialog = 150;
  static const int maxFavorite = 10;
  static bool isMockUser = false;
  // static const String thaIDhost = 'https://imauth.bora.dopa.go.th/api/v2/oauth2/auth/?response_type=code&client_id=ZHdkVkwwbGR1bk5MT2diWUlmaE1UR2ltUGwxcFRGaU4=&redirect_uri=https%3A%2F%2Fbdamobile.crimespolice.com%2Fcrimesservicedopa%2Fapi%2Fcallback&scope=pid%20given_name%20family_name%20birthdate';

  static const String kIsLogin = 'is_login';
  static const String kCookie = 'cookie';
  static const String kUsername = 'username';
  static const String kServerPublicKey = 'server_public_key';
  static const String kClientPublicKey = 'client_public_key';
  static const String kClientSecretKey = 'client_private_key';
  static const String kBiometricToken = 'biometric_token';
  static const String kFavorite = 'favorite';
  static const String kEulaVersion = 'eula_version';
  static const String kInstalled = 'installed';
  static const String kThaidState = 'thaid_state';
  static const String kThaidResult = 'thaid_result';
  static const String kThaidCode = 'thaid_code';

  // Search Type
  static const String kSearchPerson = 'search_person';
  static const String kSearchCar = 'search_car';
  static const String kSearchWeapon = 'search_weapon';
  static const String kSearchInfo = 'search_info';
  static const String kSearchFirm = 'search_firm';
  static const String kSearchAsset = 'search_asset';

  static const String statusSuccess = 'success';
  static const String statusError = 'error';

  static const String pushState_getInitialMessage = 'getInitialMessage';
  static const String pushState_onMessage = 'onMessage';
  static const String pushState_onMessageOpenedApp = 'onMessageOpenedApp';

  // ------------- For update show FormInput by Favorite ---------------

  static const String showFormImg = 'img';
  static const String showFormIdCard = 'pid';
  static const String showFormFirstName = 'firstname';
  static const String showFormLastName = 'lastname';
  static const String showFormWorkerId = 'workerid';
  static const String showFormPasId = 'pasid';
  static const String showFormNation = 'nation';
  static const String showFormGunReg = 'gunreg';
  static const String showFormAlienNo = 'alienno';
  static const String showFormProviceTc = 'province_tc';
  static const String showFormIntitialNo = 'initialno';
  static const String showFormNumber = 'number';
  static const String showFormStatus = 'status';
  static const String showFormEngineNo = 'engineno';
  static const String showFormPltcode1 = 'pltcode1';
  static const String showFormPltcode2 = 'pltcode2';
  static const String showFormPlate1Vh = 'plate1_vh';
  static const String showFormPlate2Vh = 'plate2_vh';
  static const String showFormProvcode = 'provcode';
  static const String showFormVhtype = 'vhtype';
  static const String showFormNumbody = 'numbody';
  static const String showFormBrncode = 'brncode';
  static const String showFormTicketId = 'ticketid';
  static const String showFormLicenseNumber = 'licensenumber';
  static const String showFormOrgCode = 'orgcode';
  static const String showFormCrimeCaseYear = 'crimecaseyear';
  static const String showFormCrimeCaseNo = 'crimecaseno';

  // ----------------------------------------------------------------------
  // --------------- DB ---------------------------------------------------
  // ----------------------------------------------------------------------

  // -------------------------- Outer -------------------------------

  // DB - Outer - Person

  static const String dbOuterPersonLinkage = 'db_outer_person_linkage';
  static const String dbOuterPersonCivil = 'db_outer_person_civil';
  static const String dbOuterPersonForeign = 'db_outer_person_foreign';
  static const String dbOuterPersonCarLicense = 'db_outer_person_car_license';
  static const String dbOuterPersonBusLicense = 'db_outer_person_bus_license';
  static const String dbOuterPersonCar = 'db_outer_person_car';
  static const String dbOuterPersonSocialEmployee =
      'db_outer_person_social_employee';
  static const String dbOuterPersonSocialHospital =
      'db_outer_person_social_hospital';
  static const String dbOuterPersonSocialEmployer =
      'db_outer_person_social_employer';
  static const String dbOuterPersonHealth = 'db_outer_person_health';
  static const String dbOuterPersonImmigration = 'db_outer_person_immigration';
  static const String dbOuterPersonExtension = 'db_outer_person_extension';
  static const String dbOuterPersonForeignHouse =
      'db_outer_person_foreign_house';
  static const String dbOuterPersonTraffic = 'db_outer_person_traffic';
  static const String dbOuterPersonP4 = 'db_outer_person_p4';
  static const String dbOuterPersonPrisoner = 'db_outer_person_prisoner';
  static const String dbOuterPersonWarrantCourt =
      'db_outer_person_warrant_court';
  static const String dbOuterPersonRescueVolunteer =
      'db_outer_person_rescue_volunteer';
  static const String dbOuterPersonRescueTraining =
      'db_outer_person_rescue_training';

  static const String dbOuterPersonAlien = 'db_outer_person_alien';
  static const String dbOuterPersonWorker = 'db_outer_person_worker';
  static const String dbOuterPersonNonThai = 'db_outer_person_nonthai';
  static const String dbOuterPersonNoRegis = 'db_outer_person_noregis';
  static const String dbOuterPersonMigwis = 'db_outer_person_migwis';

  // DB - Outer - Car
  static const String dbOuterCarCar = 'db_outer_car_car';
  static const String dbOuterCarTraffic = 'db_outer_car_traffic';
  static const String dbOuterCarAmbulanceLicense =
      'db_outer_car_ambulance_license';
  static const String dbOuterCarFlashingLightLicense =
      'db_outer_car_flashing_light_license';

  // DB - Outer - Info
  static const String dbOuterInfoPdc = 'db_outer_info_pdc';

  // DB - Outer - Firm
  static const String dbOuterFirmDbd = 'db_outer_firm_dbd';

  // -------------------------- Inner -------------------------------

  // DB - Inner - Person
  static const String dbInnerPersonHasAya = 'db_inner_person_has_aya';
  static const String dbInnerPersonDoAya = 'db_inner_person_do_aya';
  //static const String dbInnerPersonHasTraffic = 'db_inner_person_has_traffic';
  static const String dbInnerPersonDoTraffic = 'db_inner_person_do_traffic';
  static const String dbInnerPersonWarrantCRD = 'db_inner_person_warrant_crd';
  static const String dbInnerPersonWarrantCourtCRD =
      'db_inner_person_warrant_court_crd';
  static const String dbInnerPersonRedNotice = 'db_inner_person_red_notice';
  static const String dbInnerPersonFaceRec = 'db_inner_person_facerec';

  // DB - Inner - Car
  static const String dbInnerCarAya = 'db_inner_car_aya';
  static const String dbInnerCarTraffic = 'db_inner_car_traffic';
  static const String dbInnerCarLost = 'db_inner_car_lost';
  static const String dbInnerCarWanted = 'db_inner_car_wanted';
  static const String dbInnerCarEmergency = 'db_inner_car_emergency';

  // DB - Inner - Info
  static const String dbInnerInfoAya = 'db_inner_info_aya';
  static const String dbInnerInfoPersonSS = 'db_inner_info_person_ss';
  static const String dbInnerInfoTraffic = 'db_inner_info_traffic';
  static const String dbInnerInfoPersonTC = 'db_inner_info_person_tc';
  static const String dbInnerInfoVehicleCc = 'db_inner_info_vehicle_cc';
  static const String dbInnerInfoVehicleTc = 'db_inner_info_vehicle_tc';

  // ----------------------------------------------------------------------
  // --------------- Message ---------------------------------------------------
  // ----------------------------------------------------------------------

  // -------------------------- Outer -------------------------------

  // Message - Outer - Person
  static const String msOuterPersonLinkage = 'ทะเบียนราษฎร (linkage)';
  static const String msOuterPersonCivil = 'ทะเบียนราษฎร';
  static const String msOuterPersonForeign = 'แรงงานต่างด้าว';
  static const String msOuterPersonCarLicense = 'ใบอนุญาตขับรถ';
  static const String msOuterPersonBusLicense = 'ใบอนุญาตขับรถขนส่ง';
  static const String msOuterPersonCar = 'ยานพาหนะ (กรมขนส่ง)';
  static const String msOuterPersonSocialEmployee =
      'ประกันสังคม'; //'ประกันสังคม - ลูกจ้าง';
  static const String msOuterPersonSocialHospital = 'ประกันสังคม - โรงพยาบาล';
  static const String msOuterPersonSocialEmployer = 'ประกันสังคม - นายจ้าง';
  static const String msOuterPersonHealth = 'ประกันสุขภาพ';
  static const String msOuterPersonImmigration = 'เดินทางเข้า-ออก ตม.';
  static const String msOuterPersonExtension = 'ขออยู่ต่อในราชอาณาจักร ตม.';
  static const String msOuterPersonForeignHouse = 'ที่พักต่างด้าว';
  static const String msOuterPersonTraffic = 'ใบสั่งจราจร';
  static const String msOuterPersonP4 = 'ใบอนุญาต ป.4';
  static const String msOuterPersonPrisoner = 'ผู้ต้องขังพ้นโทษ กรมราชทัณฑ์';
  static const String msOuterPersonWarrantCourt = 'ผู้มีหมายจับที่ศาลออก';
  // static const String msOuterPersonRescueVolunteer = 'อาสาสมัครกู้ภัย';
  // static const String msOuterPersonRescueTraining = 'ผู้ผ่านการฝึกอบรมอาสาสมัครกู้ภัย';
  static const String msOuterPersonAlien = 'คนต่างด้าว (linkage)';
  static const String msOuterPersonWorker = 'แรงงานต่างด้าว (linkage)';
  static const String msOuterPersonNonThai = 'บุคคลผู้ไม่มีสัญชาติไทย';
  static const String msOuterPersonNoRegis = 'บุคคลผู้ไม่มีสถานะทางทะเบียน';
  static const String msOuterPersonMigwis = 'แรงงาน 4 สัญชาติ';

  // Message - Outer - Car
  static const String msOuterCarCar = 'กรมขนส่ง - ยานพาหนะ';
  static const String msOuterCarTraffic = 'ใบสั่งจราจร';
  // static const String msOuterCarAmbulanceLicense = 'ใบอนุญาตรถกู้ภัย';
  // static const String msOuterCarFlashingLightLicense = 'ใบอนุญาตใช้สัญญาณไฟวับวาบ';

  // Message - Outer - Info
  static const String msOuterInfoPdc = 'หมายจับ PDC';

  // Message - Outer - Firm
  static const String msOuterFirmDbd = 'จดทะเบียนบริษัท';

  // -------------------------- Inner -------------------------------

  // DB - Inner - Person
  static const String msInnerPersonDoAya = 'คดีอาญา';
  static const String msInnerPersonDoTraffic = 'คดีจราจร';
  static const String msInnerPersonHasAya =
      'ผู้มีหมายจับ CRIMES (หมายใน)'; //warrant // ผู้มีหมายจับ (สน./สภ./หน่วยสอบสวน)
  //static const String msInnerPersonHasTraffic = 'ผู้มีหมายจับ Polis';  //warrant
  static const String msInnerPersonWarrantCRD = 'ผู้มีหมายจับศาลทหาร';
  static const String msInnerPersonWarrantCourtCRD = 'หมายจับศาล (หมายนอก)';
  static const String msInnerPersonRedNotice = 'หมายแดง (red notice)';
  static const String msInnerPersonFaceRec = 'บุคคลจากภาพใบหน้า';

  // DB - Inner - Car
  static const String msInnerCarAya = 'ยานพาหนะคดีอาญา';
  static const String msInnerCarTraffic = 'ยานพาหนะคดีจราจร';
  static const String msInnerCarLost = 'ยานพาหนะหาย';
  // static const String msInnerCarWanted = 'ยานพาหนะสกัดจับ';
  //static const String msInnerCarImpound = 'ยานพาหนะตรวจยึด';
  static const String msInnerCarEmergency = 'รถฉุกเฉิน';

  // DB - Inner - Info
  static const String msInnerInfoAya = 'คดีอาญา';
  static const String msInnerInfoPersonSS = 'ผู้กระทำความผิดกฎหมายอาญา';
  static const String msInnerInfoTraffic = 'คดีจราจร';
  static const String msInnerInfoPersonTC = 'ผู้กระทำความผิดกฎหมายจราจร';
  static const String msInnerInfoVehicleCc = 'ยานพาหนะในคดีอาญา';
  static const String msInnerInfoVehicleTc = 'ยานพาหนะในคดีจราจร';

  // 8 สืบค้นหมายจับ                --> msInnerPersonHasAya
  // 3 สืบค้นผู้กระทาความผิดในคดีอาญา  --> msInnerPersonDoAya
  // 8 สืบค้นหมายจับ                --> msInnerPersonHasTraffic
  // 6 สืบค้นผู้กระทาความผิดในคดีจราจร --> msInnerPersonDoTraffic

  // 4 สืบค้นยานพาหนะในคดีอาญา      --> msInnerCarAya
  // 7 สืบค้นยานพาหนะในคดีจราจร     --> msInnerCarTraffic

  // 2 สืบค้นคดีอาญา                -->  msInnerInfoAya
  // 5 สืบค้นคดีจราจร               --> msInnerInfoTraffic

  static const String blank = 'ไม่ระบุ';
  static const List<String> pltcode1Keys = [
    blank,
    '11 - รถยนต์ส่วนบุคคลชั่วคราว',
    '12 - รถยนต์สามล้อส่วนบุคคลชั่วคราว',
    '13 - รถจักรยานยนต์ส่วนบุคคลชั่วคราว',
    '21 - รถยนต์ส่วนบุคคลหนึ่งปี',
    '22 - รถยนต์สามล้อส่วนบุคคลหนึ่งปี',
    '23 - รถจักรยานยนต์หนึ่งปี',
    '24 - รถยนต์ส่วนบุคคล',
    '25 - รถยนต์สามล้อส่วนบุคคล',
    '26 - รถจักรยานยนต์ส่วนบุคคล',
    '31 - รถยนต์ส่วนบุคคลตลอดชีพ',
    '32 - รถยนต์สามล้อส่วนบุคคลตลอดชีพ',
    '33 - รถจักรยานยนต์ตลอดชีพ',
    '41 - รถยนต์สาธารณะ',
    '42 - รถยนต์สามล้อสาธารณะ',
    '43 - รถจักรยานยนต์สาธารณะ',
    '51 - รถระหว่างประเทศ',
    '61 - รถบดถนน',
    '62 - รถแทรกเตอร์',
    '63 - รถใช้งานเกษตรกรรม',
    '71 - รถอื่นๆ',
    '81 - รถจักรยานสองล้อตลอดชีพ',
    '82 - รถไถนา',
  ];
  static const List<String> pltcode1Values = [
    '',
    '11',
    '12',
    '13',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '31',
    '32',
    '33',
    '41',
    '42',
    '43',
    '51',
    '61',
    '62',
    '63',
    '71',
    '81',
    '82',
  ];

  static const List<String> pltcode2Keys = [
    blank,
    '11 - ผู้ขับรถส่วนบุคคลชนิดที่ 1',
    '12 - ผู้ขับรถส่วนบุคคลชนิดที่ 2',
    '13 - ผู้ขับรถส่วนบุคคลชนิดที่ 3',
    '14 - ผู้ขับรถส่วนบุคคลชนิดที่ 4',
    '21 - ผู้ขับรถทุกประเภทชนิดที่ 1',
    '22 - ผู้ขับรถทุกประเภทชนิดที่ 2',
    '23 - ผู้ขับรถทุกประเภทชนิดที่ 3',
    '24 - ผู้ขับรถทุกประเภทชนิดที่ 4',
    '30 - ผู้เก็บค่าโดยสาร',
    '40 - นายตรวจ',
    '50 - ผู้บริการ',
  ];
  static const List<String> pltcode2Values = [
    '',
    '11',
    '12',
    '13',
    '14',
    '21',
    '22',
    '23',
    '24',
    '30',
    '40',
    '50',
  ];

  static const List<String> proviceTcKeys = [
    blank,
    'กรุงเทพมหานคร',
    'ชัยนาท',
    'สิงห์บุรี',
    'ลพบุรี',
    'อ่างทอง',
    'สระบุรี',
    'พระนครศรีอยุธยา',
    'ปทุมธานี',
    'นนทบุรี',
    'สมุทรปราการ',
    'นครนายก',
    'ปราจีนบุรี',
    'ฉะเชิงเทรา',
    'ชลบุรี',
    'ระยอง',
    'จันทบุรี',
    'ตราด',
    'สระแก้ว',
    'ชัยภูมิ',
    'ยโสธร',
    'อุบลราชธานี',
    'ศรีสะเกษ',
    'บุรีรัมย์',
    'นครราชสีมา',
    'สุรินทร์',
    'อำนาจเจริญ',
    'หนองบัวลำภู',
    'บึงกาฬ',
    'หนองคาย',
    'เลย',
    'อุดรธานี',
    'นครพนม',
    'สกลนคร',
    'ขอนแก่น',
    'กาฬสินธุ์',
    'มหาสารคาม',
    'ร้อยเอ็ด',
    'มุกดาหาร',
    'เชียงราย',
    'แม่ฮ่องสอน',
    'เชียงใหม่',
    'พะเยา',
    'น่าน',
    'ลำพูน',
    'ลำปาง',
    'แพร่',
    'อุตรดิตถ์',
    'สุโขทัย',
    'ตาก',
    'พิษณุโลก',
    'กำแพงเพชร',
    'พิจิตร',
    'เพชรบูรณ์',
    'นครสวรรค์',
    'อุทัยธานี',
    'สุพรรณบุรี',
    'กาญจนบุรี',
    'นครปฐม',
    'ราชบุรี',
    'สมุทรสาคร',
    'สมุทรสงคราม',
    'เพชรบุรี',
    'ประจวบคีรีขันธ์',
    'ชุมพร',
    'ระนอง',
    'สุราษฎร์ธานี',
    'พังงา',
    'นครศรีธรรมราช',
    'กระบี่',
    'ภูเก็ต',
    'พัทลุง',
    'ตรัง',
    'สงขลา',
    'สตูล',
    'ปัตตานี',
    'ยะลา',
    'เบตง',
    'นราธิวาส',
  ];
  static const List<String> proviceTcValues = [
    '',
    'กรุงเทพมหานคร',
    'ชัยนาท',
    'สิงห์บุรี',
    'ลพบุรี',
    'อ่างทอง',
    'สระบุรี',
    'พระนครศรีอยุธยา',
    'ปทุมธานี',
    'นนทบุรี',
    'สมุทรปราการ',
    'นครนายก',
    'ปราจีนบุรี',
    'ฉะเชิงเทรา',
    'ชลบุรี',
    'ระยอง',
    'จันทบุรี',
    'ตราด',
    'สระแก้ว',
    'ชัยภูมิ',
    'ยโสธร',
    'อุบลราชธานี',
    'ศรีสะเกษ',
    'บุรีรัมย์',
    'นครราชสีมา',
    'สุรินทร์',
    'อำนาจเจริญ',
    'หนองบัวลำภู',
    'บึงกาฬ',
    'หนองคาย',
    'เลย',
    'อุดรธานี',
    'นครพนม',
    'สกลนคร',
    'ขอนแก่น',
    'กาฬสินธุ์',
    'มหาสารคาม',
    'ร้อยเอ็ด',
    'มุกดาหาร',
    'เชียงราย',
    'แม่ฮ่องสอน',
    'เชียงใหม่',
    'พะเยา',
    'น่าน',
    'ลำพูน',
    'ลำปาง',
    'แพร่',
    'อุตรดิตถ์',
    'สุโขทัย',
    'ตาก',
    'พิษณุโลก',
    'กำแพงเพชร',
    'พิจิตร',
    'เพชรบูรณ์',
    'นครสวรรค์',
    'อุทัยธานี',
    'สุพรรณบุรี',
    'กาญจนบุรี',
    'นครปฐม',
    'ราชบุรี',
    'สมุทรสาคร',
    'สมุทรสงคราม',
    'เพชรบุรี',
    'ประจวบคีรีขันธ์',
    'ชุมพร',
    'ระนอง',
    'สุราษฎร์ธานี',
    'พังงา',
    'นครศรีธรรมราช',
    'กระบี่',
    'ภูเก็ต',
    'พัทลุง',
    'ตรัง',
    'สงขลา',
    'สตูล',
    'ปัตตานี',
    'ยะลา',
    'เบตง',
    'นราธิวาส',
  ];

  static const List<String> statusKeys = [
    blank,
    'ยานพาหนะเกี่ยวกับคดี',
    'ยานพาหนะแจ้งสกัดจับ',
    'ยานพาหนะแจ้งหาย',
    'ยานพาหนะแจ้งหายและสกัดจับ',
  ];
  static const List<String> statusValues = [
    '',
    '0',
    '1',
    '2',
    '3',
  ];

  static const List<String> provCodeKeys = [
    blank,
    '00100 - กรุงเทพมหานคร',
    '10000 - ชัยนาท',
    '10100 - สิงห์บุรี',
    '10200 - ลพบุรี',
    '10300 - อ่างทอง',
    '10400 - สระบุรี',
    '10500 - พระนครศรีอยุธยา',
    '10600 - ปทุมธานี',
    '10700 - นนทบุรี',
    '10800 - สมุทรปราการ',
    '20000 - นครนายก',
    '20100 - ปราจีนบุรี',
    '20200 - ฉะเชิงเทรา',
    '20300 - ชลบุรี',
    '20400 - ระยอง',
    '20500 - จันทบุรี',
    '20600 - ตราด',
    '20700 - สระแก้ว',
    '30000 - ชัยภูมิ',
    '30100 - ยโสธร',
    '30200 - อุบลราชธานี',
    '30300 - ศรีสะเกษ',
    '30400 - บุรีรัมย์',
    '30500 - นครราชสีมา',
    '30600 - สุรินทร์',
    '30700 - อำนาจเจริญ',
    '30800 - หนองบัวลำภู',
    '30900 - บึงกาฬ',
    '40000 - หนองคาย',
    '40100 - เลย',
    '40200 - อุดรธานี',
    '40300 - นครพนม',
    '40400 - สกลนคร',
    '40500 - ขอนแก่น',
    '40600 - กาฬสินธุ์',
    '40700 - มหาสารคาม',
    '40800 - ร้อยเอ็ด',
    '40900 - มุกดาหาร',
    '50000 - เชียงราย',
    '50100 - แม่ฮ่องสอน',
    '50200 - เชียงใหม่',
    '50300 - พะเยา',
    '50400 - น่าน',
    '50500 - ลำพูน',
    '50600 - ลำปาง',
    '50700 - แพร่',
    '60000 - อุตรดิตถ์',
    '60100 - สุโขทัย',
    '60200 - ตาก',
    '60300 - พิษณุโลก',
    '60400 - กำแพงเพชร',
    '60500 - พิจิตร',
    '60600 - เพชรบูรณ์',
    '60700 - นครสวรรค์',
    '60800 - อุทัยธานี',
    '70000 - สุพรรณบุรี',
    '70100 - กาญจนบุรี',
    '70200 - นครปฐม',
    '70300 - ราชบุรี',
    '70400 - สมุทรสาคร',
    '70500 - สมุทรสงคราม',
    '70600 - เพชรบุรี',
    '70700 - ประจวบคีรีขันธ์',
    '80000 - ชุมพร',
    '80100 - ระนอง',
    '80200 - สุราษฎร์ธานี',
    '80300 - พังงา',
    '80400 - นครศรีธรรมราช',
    '80500 - กระบี่',
    '80600 - ภูเก็ต',
    '90000 - พัทลุง',
    '90100 - ตรัง',
    '90200 - สงขลา',
    '90300 - สตูล',
    '90400 - ปัตตานี',
    '90500 - ยะลา',
    '90501 - เบตง',
    '90600 - นราธิวาส',
  ];
  static const List<String> provCodeValues = [
    '',
    '00100',
    '10000',
    '10100',
    '10200',
    '10300',
    '10400',
    '10500',
    '10600',
    '10700',
    '10800',
    '20000',
    '20100',
    '20200',
    '20300',
    '20400',
    '20500',
    '20600',
    '20700',
    '30000',
    '30100',
    '30200',
    '30300',
    '30400',
    '30500',
    '30600',
    '30700',
    '30800',
    '30900',
    '40000',
    '40100',
    '40200',
    '40300',
    '40400',
    '40500',
    '40600',
    '40700',
    '40800',
    '40900',
    '50000',
    '50100',
    '50200',
    '50300',
    '50400',
    '50500',
    '50600',
    '50700',
    '60000',
    '60100',
    '60200',
    '60300',
    '60400',
    '60500',
    '60600',
    '60700',
    '60800',
    '70000',
    '70100',
    '70200',
    '70300',
    '70400',
    '70500',
    '70600',
    '70700',
    '80000',
    '80100',
    '80200',
    '80300',
    '80400',
    '80500',
    '80600',
    '90000',
    '90100',
    '90200',
    '90300',
    '90400',
    '90500',
    '90501',
    '90600',
  ];

  static const List<String> vhTypeKeys = [
    blank,
    '1 - รถยนต์นั่งส่วนบุคคลไม่เกิน 7 คน',
    '2 - รถยนต์นั่งส่วนบุคคลเกิน 7 คน',
    '3 - รถยนต์บรรทุกส่วนบุคคล',
    '4 - รถยนต์สามล้อส่วนบุคคล',
    '5 - รถยนต์รับจ้างระหว่างจังหวัด',
    '6 - รถยนต์รับจ้างบรรทุกคนโดยสารไม่เกิน 7 คน',
    '7 - รถยนต์สี่ล้อเล็กรับจ้าง (โดยสารไม่เกิน 7 คน)',
    '8 - รถยนต์รับจ้างสามล้อ',
    '9 - รถยนต์บริการธุรกิจ',
    '10 - รถยนต์บริการทัศนาจร',
    '11 - รถยนต์บริการให้เช่า',
    '12 - รถจักรยานยนต์',
    '13 - รถแทร็กเตอร์',
    '14 - รถบดถนน',
    '15 - รถใช้ในงานเกษตรกรรม',
    '16 - รถพ่วง',
    '17 - รถจักรยานยนต์สาธารณะ',
    '18 - รถใช้เพื่อการทดสอบ',
    '19 - รถ จยย.ของเจ้าพนักงานกงสุลกิตติมศักดิ์',
    '20 - รถยนต์ของเจ้าพนักงานกงสุลกิตติมศักดิ์',
    '21 - ป้ายแดง',
    '22 - รถจยย.ของบุคคลในคณะผู้แทนทางกงศุล',
    '23 - รถจยย.ของบุคคลในหน่วยงานพิเศษของสถานทูตต่างๆ',
    '24 - รถจยย.ของผู้แทนทางการทูต',
    '25 - รถจยย.ของบุคคลในองค์การระหว่างประเทศหรือทบวงการชำนาญพิเศษแห่งสหประชาชาติซึ่งประจำอยู่ในประเทศไทย',
    '26 - รถยนต์ของบุคคลในคณะผู้แทนทางกงศุล',
    '27 - รถยนต์ของบุคคลในหน่วยงานพิเศษของสถานฑูตต่างๆ',
    '28 - รถยนต์ของผู้แทนทางการทูต',
    '29 - รถยนต์ของบุคคลในองค์การระหว่างประเทศหรือทบวงการชำนาญพิเศษแห่งสหประชาชาติซึ่งประจำอยู่ในประเทศไทย',
    '30 - รถโดยสาร ประจำทาง',
    '31 - รถขนาดเล็ก',
    '32 - รถโดยสาร ไม่ประจำทาง',
    '33 - รถโดยสาร ส่วนบุคคล',
    '34 - รถบรรทุก ไม่ประจำทาง',
    '35 - รถบรรทุก ส่วนบุคคล',
    '36 - รถเพื่อขายหรือเพื่อซ่อม',
  ];
  static const List<String> vhTypeValues = [
    blank,
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
  ];

  static const List<String> brncodeKeys = [
    blank,
    'T06 - TOYOTA',
    'H11 - HONDA',
    'N09 - NISSAN',
    'I09 - ISUZU',
    'M19 - MITSUBISHI',
    'M52 - MERCEDES BENZ',
    'M11 - MAZDA',
    'B08 - BMW',
    'F09 - FORD',
    'S29 - SUZUKI',
    'A04 - ALFA ROMEO',
    'A10 - ASTON MARTIN',
    'A12 - AUDI',
    'A13 - AUSTIN',
    'B90 - BYD',
    'B05 - BENTLEY',
    'B06 - BENZ',
    'C01 - CADILLAC',
    'C81 - CHERY',
    'C11 - CHEVROLET',
    'C12 - CHRYSLER',
    'C15 - CITROEN',
    'D03 - DAIHATSU',
    'D06 - DATSUN',
    'D23 - DODGE',
    'F05 - FERRARI',
    'F06 - FIAT',
    'F29 - FOTON',
    'G35 - GMC',
    'H10 - HOLDEN',
    'H28 - HUMMER',
    'H19 - HYUNDAI',
    'I32 - INFINITI',
    'J01 - JAGUAR',
    'J06 - JEEP',
    'J46 - JOYLONG',
    'K02 - KAWASAKI',
    'K11 - KIA',
    'L02 - LAMBORGHINI',
    'L05 - LAND ROVER',
    'L15 - LEXUS',
    'L13 - LOTUS',
    'M16 - MG',
    'M06 - MASERATI',
    'MF7 - MAXUS',
    'MD4 - MCLAREN',
    'M40 - MINI',
    'M91 - MITSUOKA',
    'N49 - NAZA',
    'O02 - OLDSMOBILE',
    'O04 - OPEL',
    'P10 - PEUGEOT',
    'P17 - PORSCHE',
    'P21 - PROTON',
    'R12 - ROLLS-ROYCE',
    'R17 - RUF',
    'S01 - SAAB',
    'S38 - SEAT',
    'S14 - SKODA',
    'S60 - SMART',
    'S40 - SSANGYONG',
    'S27 - SUBARU',
    'T24 - TR',
    'T21 - TATA',
    'T83 - TESLA',
    'V10 - VOLKSWAGEN',
    'V11 - VOLVO',
    'Y01 - YAMAHA',
  ];
  static const List<String> brncodeValues = [
    blank,
    'T06',
    'H11',
    'N09',
    'I09',
    'M19',
    'M52',
    'M11',
    'B08',
    'F09',
    'S29',
    'A04',
    'A10',
    'A12',
    'A13',
    'B90',
    'B05',
    'B06',
    'C01',
    'C81',
    'C11',
    'C12',
    'C15',
    'D03',
    'D06',
    'D23',
    'F05',
    'F06',
    'F29',
    'G35',
    'H10',
    'H28',
    'H19',
    'I32',
    'J01',
    'J06',
    'J46',
    'K02',
    'K11',
    'L02',
    'L05',
    'L15',
    'L13',
    'M16',
    'M06',
    'MF7',
    'MD4',
    'M40',
    'M91',
    'N49',
    'O02',
    'O04',
    'P10',
    'P17',
    'P21',
    'R12',
    'R17',
    'S01',
    'S38',
    'S14',
    'S60',
    'S40',
    'S27',
    'T24',
    'T21',
    'T83',
    'V10',
    'V11',
    'Y01',
  ];

  static const List<String> plate3TfKeys = [
    blank,
    'กรุงเทพมหานคร',
    'ชัยนาท',
    'สิงห์บุรี',
    'ลพบุรี',
    'อ่างทอง',
    'สระบุรี',
    'พระนครศรีอยุธยา',
    'ปทุมธานี',
    'นนทบุรี',
    'สมุทรปราการ',
    'นครนายก',
    'ปราจีนบุรี',
    'ฉะเชิงเทรา',
    'ชลบุรี',
    'ระยอง',
    'จันทบุรี',
    'ตราด',
    'สระแก้ว',
    'ชัยภูมิ',
    'ยโสธร',
    'อุบลราชธานี',
    'ศรีสะเกษ',
    'บุรีรัมย์',
    'นครราชสีมา',
    'สุรินทร์',
    'อำนาจเจริญ',
    'หนองบัวลำภู',
    'บึงกาฬ',
    'หนองคาย',
    'เลย',
    'อุดรธานี',
    'นครพนม',
    'สกลนคร',
    'ขอนแก่น',
    'กาฬสินธุ์',
    'มหาสารคาม',
    'ร้อยเอ็ด',
    'มุกดาหาร',
    'เชียงราย',
    'แม่ฮ่องสอน',
    'เชียงใหม่',
    'พะเยา',
    'น่าน',
    'ลำพูน',
    'ลำปาง',
    'แพร่',
    'อุตรดิตถ์',
    'สุโขทัย',
    'ตาก',
    'พิษณุโลก',
    'กำแพงเพชร',
    'พิจิตร',
    'เพชรบูรณ์',
    'นครสวรรค์',
    'อุทัยธานี',
    'สุพรรณบุรี',
    'กาญจนบุรี',
    'นครปฐม',
    'ราชบุรี',
    'สมุทรสาคร',
    'สมุทรสงคราม',
    'เพชรบุรี',
    'ประจวบคีรีขันธ์',
    'ชุมพร',
    'ระนอง',
    'สุราษฎร์ธานี',
    'พังงา',
    'นครศรีธรรมราช',
    'กระบี่',
    'ภูเก็ต',
    'พัทลุง',
    'ตรัง',
    'สงขลา',
    'สตูล',
    'ปัตตานี',
    'ยะลา',
    'เบตง',
    'นราธิวาส',
  ];
  static const List<String> plate3TfValues = [
    '',
    '00100',
    '10000',
    '10100',
    '10200',
    '10300',
    '10400',
    '10500',
    '10600',
    '10700',
    '10800',
    '20000',
    '20100',
    '20200',
    '20300',
    '20400',
    '20500',
    '20600',
    '20700',
    '30000',
    '30100',
    '30200',
    '30300',
    '30400',
    '30500',
    '30600',
    '30700',
    '30800',
    '30900',
    '40000',
    '40100',
    '40200',
    '40300',
    '40400',
    '40500',
    '40600',
    '40700',
    '40800',
    '40900',
    '50000',
    '50100',
    '50200',
    '50300',
    '50400',
    '50500',
    '50600',
    '50700',
    '60000',
    '60100',
    '60200',
    '60300',
    '60400',
    '60500',
    '60600',
    '60700',
    '60800',
    '70000',
    '70100',
    '70200',
    '70300',
    '70400',
    '70500',
    '70600',
    '70700',
    '80000',
    '80100',
    '80200',
    '80300',
    '80400',
    '80500',
    '80600',
    '90000',
    '90100',
    '90200',
    '90300',
    '90400',
    '90500',
    '90501',
    '90600',
  ];

  //for tutorial
  static const String kIsReadTutorHome = 'is_rtutor_home';
  static const String kIsReadTutorSearchPerson = 'is_rtutor_sperson';
  static const String kIsReadTutorSearchVehicle = 'is_rtutor_svehicle';

  //for profile
  static const String kFileProfile = 'file_profile';
}
