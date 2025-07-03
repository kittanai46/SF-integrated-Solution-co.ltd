import 'dart:convert';
import 'dart:typed_data';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/client/response/inner/crimecase/get_crimecase_response_dto.dart';
import 'package:crimes/data/client/response/inner/trafficcase/get_trafficcase_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/house_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/idc_response_dto.dart';
import 'package:crimes/data/client/response/outer/common/image_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/travel_visa_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/house_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/make_card_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/person_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/social/employer_response_dto.dart';
import 'package:crimes/data/client/response/outer/social/hospital_response_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrant_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_dto.dart';
import 'package:crimes/data/dto/outer/civil/house_dto.dart';
import 'package:crimes/data/dto/outer/civil/idc_dto.dart';
import 'package:crimes/data/dto/outer/civil/person_dto.dart';
import 'package:crimes/data/dto/outer/civil/pop_house_dto.dart';
import 'package:crimes/data/dto/outer/common/image_dto.dart';
import 'package:crimes/data/dto/outer/foreign/worker_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_visa_dto.dart';
import 'package:crimes/data/dto/outer/linkage/alien_person_dto.dart';
import 'package:crimes/data/dto/outer/linkage/changename_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/house_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/make_card_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/move_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_inhouse_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_nonthai_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_noregis_dto.dart';
import 'package:crimes/data/dto/outer/social/employer_dto.dart';
import 'package:crimes/data/dto/outer/social/employment_dto.dart';
import 'package:crimes/data/dto/outer/social/hospital_dto.dart';
import 'package:crimes/data/dto/outer/prisoner/prisoner_dto.dart';
import 'package:crimes/data/dto/outer/warrantcourt/warrantcourt_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/form_detail.dart';
import 'package:crimes/data/entity/group_result.dart';
import 'package:crimes/data/mapper/form_mapper.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:crimes/util/device_infomation_utils.dart';

import 'package:crimes/data/dto/inner/crimecase/crimecase_vehicle_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_vehicle_dto.dart';

import '../../../data/client/response/outer/linkage/lk2_group1_response_dto.dart';
import '../../../data/dto/inner/warrant/rednotice_dto.dart';
import '../../../data/dto/inner/warrant/warrantcourtcrd_dto.dart';
import '../../../data/dto/inner/warrant/warrantcrd_dto.dart';
import '../../../data/dto/outer/cib/face_dto.dart';
import '../../../data/dto/outer/immigration/extension_dto.dart';
import '../../../data/dto/outer/linkage/alien_worker_dto.dart';
import '../../../data/dto/outer/linkage/lk2_group1_dto.dart';



part 'search_detail_screen_view_model.g.dart';


class SearchDetailScreenViewModel = SearchDetailScreenViewModelBase with _$SearchDetailScreenViewModel;

abstract class SearchDetailScreenViewModelBase with Store {
  SearchDetailScreenViewModelBase(){

  }

  UserDto? userDto;

  @observable String searchType = '';
  @observable String title = '';
  @observable String category = '';
  @observable Result result = Result();

  @observable WarrantDto? warrantDto = null;
  @observable WarrantCourtDto? warrantCourtDto = null; //หมายจับศาล

  @observable WarrantCRDDto? warrantCRDDto = null; //หมายจับศาลทหาร
  @observable WarrantCourtCRDDto? warrantCourtCRDDto = null; //หมายจับศาล (หมายนอก)
  //@observable RedNoticeDto? redNoticeDto = null; //หมายแดง (red notice)

  @observable PersonDto? personDto = null;
  // @observable List<CardDto> listCardDto = List<CardDto>();  //บัตรเก่าๆ
  @observable IdcDto? idcDto = null; // บัตรล่าสุด
  @observable List<FormDetail>? idcDetails = null;
  @observable ImageDto? personImageDto = null; // รูปบนบัตร
  @observable Uint8List? personImageBytes = null;
  // @observable IdcBp1Dto idcBp1Dto = IdcBp1Dto();  // รายละเอียดการทำบัตร

  @observable HouseDto? houseDto = null;  // บ้าน
  @observable List<FormDetail>? houseDetails = null;
  @observable List<PopHouseDto>? listpPopHouseDto = null;  //รายละเอียดคนในบ้าน

  // @observable List<ChangeNameDto> listChangeNameDto = List<ChangeNameDto>();
  // @observable List<ChangeAddressDto> listChangeAddressDto = List<ChangeAddressDto>();

  @observable WorkerDto? workerDto = null;
  @observable ImageDto? workerImageDto = null;
  @observable Uint8List? workerImageBytes = null;

  @observable PersonLkDto? personLkDto = null;
  @observable List<FormDetail>? personLkDetails = null;
  @observable ImageDto? personLkImageDto = null;
  @observable Uint8List? personLkImageBytes = null;
  @observable HouseLkDto? houseLkDto = null;
  @observable List<FormDetail>? houseLkDetails = null;
  @observable List<PersonInHouseLkDto>? listPersonInHouseLkDto = null;
  @observable MakeCardLkDto? makeCardLkDto = null;  // >>> List
  @observable List<FormDetail>? makeCardLkDetails = null;
  @observable List<ChangeNameLkDto>? listChangeNameLkDto = null;
  @observable List<MoveLkDto>? listMoveInLkDto = null;
  @observable List<MoveLkDto>? listMoveOutLkDto = null;

  @observable AlienPersonDto? alienPersonDto = null;
  @observable ImageDto? alienPersonImageDto = null;
  @observable Uint8List? alienPersonImageBytes = null;

  @observable AlienWorkerDto? alienWorkerDto = null;
  @observable ImageDto? alienWorkerImageDto = null;
  @observable Uint8List? alienWorkerImageBytes = null;

  @observable PersonNonThaiDto? personNonThaiDto = null;
  @observable ImageDto? personNonThaiImageDto = null;
  @observable Uint8List? personNonThaiImageBytes = null;

  @observable PersonNoRegisDto? personNoRegisDto = null;
  @observable ImageDto? personNoRegisImageDto = null;
  @observable Uint8List? personNoRegisImageBytes = null;

  @observable EmploymentDto? employmentDto = null;
  @observable HospitalDto? hospitalDto = null;
  @observable List<FormDetail>? hospitalDetails = null;
  @observable EmployerDto? employerDto = null;
  @observable List<FormDetail>? employerDetails = null;

  @observable TravelDto? travelDto = null;
  @observable ImageDto? travelImageDto = null;
  @observable Uint8List? travelImageBytes = null;
  @observable TravelVisaDto? travelVisaDto = null;
  @observable List<FormDetail>? travelVisaDetails = null;

  @observable ExtensionDto? extensionDto = null;
  // @observable ImageDto? extensionImageDto = null;
  @observable Uint8List? extensionImageBytes = null;

  @observable CrimeCaseDto? crimeCaseDto = null;
  @observable List<FormDetail>? crimeCaseDetails = null;
  @observable TrafficCaseDto? trafficCaseDto = null;
  @observable List<FormDetail>? trafficCaseDetails = null;

  @observable PrisonerDto? prisonerDto = null;
  @observable ImageDto? prisonerImageDto = null;
  @observable Uint8List? prisonerImageBytes = null;

  @observable CrimeCaseVehicleDto? crimeCaseVehicleDto = null;
  @observable TrafficCaseVehicleDto? trafficCaseVehicleDto = null;

  //Face Rec
  @observable FaceDto? faceDto = null;

  Position lastPosition = Position(longitude: 0,latitude: 0, timestamp: DateTime.now(), accuracy: 0.0, altitude: 0.0, heading: 0.0, speed: 0.0, speedAccuracy: 0.0, altitudeAccuracy: 0.0, headingAccuracy: 0.0); // initial with 0,0
  String pdfURL = '';

  @action
  void checkData(){
    if(category == AppConstant.dbInnerPersonHasAya && result.data is WarrantDto){
      warrantDto = result.data as WarrantDto;
      if(warrantDto!=null){
        StringUtils.log('warrantDto.orgCode=${warrantDto!.orgCode}');
        StringUtils.log("warrantDto.getCaseNumber=${warrantDto!.getCaseNumber()}");
        StringUtils.log("warrantDto.getCaseYear=${warrantDto!.getCaseYear()}");
        StringUtils.log("warrantDto.getCaseYear=${warrantDto!.getCaseYear()}");
      }
    }else if(category == AppConstant.dbInnerPersonWarrantCRD && result.data is WarrantCRDDto){
      warrantCRDDto = result.data as WarrantCRDDto;
      // if(warrantCRDDto!=null){
      //   StringUtils.log('warrantCRDDto.idno=${warrantCRDDto!.idno}');
      //   StringUtils.log('warrantCRDDto.warrant_doc=${warrantCRDDto!.warrant_doc}');
      // }
    }else if(category == AppConstant.dbInnerPersonWarrantCourtCRD && result.data is WarrantCourtCRDDto){
      warrantCourtCRDDto = result.data as WarrantCourtCRDDto;
    }else if(category == AppConstant.dbOuterPersonCivil && result.data is PersonDto){
      personDto = result.data as PersonDto;
      requestImageIdc();
    }else if(category == AppConstant.dbOuterPersonForeign && result.data is WorkerDto){
      workerDto = result.data as WorkerDto;
      requestWorkerImage();
    }else if(category == AppConstant.dbOuterPersonLinkage && result.data is PersonLkDto) {
      personLkDto = result.data as PersonLkDto;
      requestPersonLkImage();
    }
    // Not sure
    else if(category == AppConstant.dbInnerPersonFaceRec && result.data is PersonLkDto) {
      personLkDto = result.data as PersonLkDto;
      //requestPersonLkImage();
    }
    else if(category == AppConstant.dbOuterPersonSocialEmployee && result.data is EmploymentDto){
      employmentDto = result.data as EmploymentDto;
    }
    // else if(category == AppConstant.dbOuterPersonImmigration && result.data is TravelDto){
    //   travelDto = result.data as TravelDto;
    //   if(travelDto!=null && travelDto!.isInputPassport!=null && travelDto!.isInputPassport!){
    //     requestTravelVisa();
    //   }
    // }
    else if(category == AppConstant.dbOuterPersonExtension && result.data is ExtensionDto){
      extensionDto = result.data as ExtensionDto;
    }
    else if(category == AppConstant.dbOuterPersonPrisoner && result.data is PrisonerDto){
      prisonerDto = result.data as PrisonerDto;
      requestPrisonerImage();
    }else if(category == AppConstant.dbOuterPersonAlien && result.data is AlienPersonDto){
      alienPersonDto = result.data as AlienPersonDto;
      requestAlienPersonImage();
    }else if(category == AppConstant.dbOuterPersonWorker && result.data is AlienWorkerDto){
      alienWorkerDto = result.data as AlienWorkerDto;
      requestAlienWorkerImage();
    }else if(category == AppConstant.dbOuterPersonNonThai && result.data is PersonNonThaiDto){
      personNonThaiDto = result.data as PersonNonThaiDto;
      requestPersonNonThaiImage();
    }else if(category == AppConstant.dbOuterPersonNoRegis && result.data is PersonNoRegisDto){
      personNoRegisDto = result.data as PersonNoRegisDto;
      requestPersonNoRegisImage();
    }else if(category == AppConstant.dbInnerCarAya && result.data is CrimeCaseVehicleDto){
      crimeCaseVehicleDto = result.data as CrimeCaseVehicleDto;
    }else if(category == AppConstant.dbInnerCarTraffic && result.data is TrafficCaseVehicleDto){
      trafficCaseVehicleDto = result.data as TrafficCaseVehicleDto;
    }else if(category == AppConstant.dbInnerPersonFaceRec && result.data is FaceDto) {
      faceDto = result.data as FaceDto;
      requestLk2Group1();
    }
  }

  @action
  void setType(String type) {
    searchType = type;
    switch (searchType) {
      case AppConstant.kSearchPerson:
        title = AppMessage.searchPerson;
        break;
      case AppConstant.kSearchCar:
        title = AppMessage.searchCar;
        break;
      case AppConstant.kSearchWeapon:
        title = AppMessage.searchWeapon;
        break;
      case AppConstant.kSearchInfo:
        title = AppMessage.searchInfo;
        break;
      case AppConstant.kSearchFirm:
        title = AppMessage.searchDBD;
        break;
      case AppConstant.kSearchAsset:
        title = AppMessage.searchAsset;
        break;
    }
  }

  // --- START Civil ------
  @action
  Future<void> requestIdc() async {
    if(personDto==null || personDto!.pID == null || personDto!.pID!.isEmpty) return;
    openGPSDisabled = false;
    try{
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    };

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        IdcResponseDto response = await ApiClient().getCardDetailLatestByPid(
            personDto!.pID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listIdcDto = response.listIdcDto!.data;
        if (listIdcDto==null || listIdcDto.length == 0) {
          StringUtils.log("listIdcDto.length == 0");
          throw Exception(response.message);
        }
        idcDto = listIdcDto[0];
        idcDetails = FormMapper().mapIdc(idcDto);
        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  @action
  Future<void> requestImageIdc() async {
    if(idcDto==null || idcDto!.pB1Number == null || idcDto!.pB1Number!.isEmpty) {
      await requestIdc(); // Required Before Call Image
    }
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto responseImage = await ApiClient().getPersonImageByPb1(
            idcDto!.pB1Number!, lastPosition.latitude, lastPosition.longitude);
        if (responseImage == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }
        final listImageDto = responseImage.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(responseImage.message);
          status = ActionStatus.success;
          return;
        }
        personImageDto = listImageDto[0];
        if (personImageDto==null || personImageDto!.image == null || personImageDto!.image!.isEmpty) {
          StringUtils.log("personImageDto.image == null || personImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(personImageDto!.image!=null){
          personImageBytes = Base64Decoder().convert(personImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }


  @action
  Future<void> requestHouse() async {
    if(personDto==null || personDto!.houseID == null || personDto!.houseID!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        HouseResponseDto response = await ApiClient().getHouseDetailByHid(
            personDto!.houseID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listHouseDto = response.listHouseDto!.data;
        if (listHouseDto==null || listHouseDto.length == 0) {
          StringUtils.log("listHouseDto.length == 0");
          throw Exception(response.message);
        }
        houseDto = listHouseDto[0];
        houseDetails = FormMapper().mapHouse(houseDto!);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END Civil ------

  // --- START Foreign ------
  @action
  Future<void> requestWorkerImage() async {
    if(workerDto==null || workerDto!.workerID == null || workerDto!.workerID!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto response = await ApiClient()
            .getForeignWorkerImageByWorkerId(
            workerDto!.workerID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listImageDto = response.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(response.message);
          status = ActionStatus.success;
          return;
        }
        workerImageDto = listImageDto[0];
        if (workerImageDto!.image == null || workerImageDto!.image!.isEmpty) {
          StringUtils.log("workerImageDto.image == null || workerImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(workerImageDto!.image != null){
          workerImageBytes = Base64Decoder().convert(workerImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END Foreign ------

  // --- START Foreign ------
  @action
  Future<void> requestPrisonerImage() async {
    if(prisonerDto==null || prisonerDto!.image == null ||prisonerDto!.prisonerId ==null) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto response = await ApiClient()
            .getPrisonerImageByUrl(
            prisonerDto!.image!, "0", prisonerDto!.prisonerId!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listImageDto = response.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(response.message);
          status = ActionStatus.success;
          return;
        }
        prisonerImageDto = listImageDto[0];
        if (prisonerImageDto!.image == null || prisonerImageDto!.image!.isEmpty) {
          StringUtils.log("prisonerImageDto.image == null || prisonerImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(prisonerImageDto!.image != null){
          prisonerImageBytes = Base64Decoder().convert(prisonerImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END Foreign ------

  // --- START Linkage ------
  @action
  Future<void> requestPersonLkImage() async {
    if(personLkDto==null || personLkDto!.pid == null || personLkDto!.pid!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto response = await ApiClient().getPersonImageInfoByPid(
            personLkDto!.pid!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listImageDto = response.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(response.message);
          status = ActionStatus.success;
          return;
        }
        personLkImageDto = listImageDto[0];
        if (personLkImageDto!.image == null || personLkImageDto!.image!.isEmpty) {
          StringUtils.log(
              "personLkImageDto.image == null || personLkImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(personLkImageDto!.image!=null){
          personLkImageBytes = Base64Decoder().convert(personLkImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  @action
  Future<void> requestMakeCardLk() async {
    if(personLkDto==null || personLkDto!.pid == null || personLkDto!.pid!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        MakeCardLkResponseDto response = await ApiClient().getCardInfoByPid(
            personLkDto!.pid!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listMakeCardLkDto = response.listMakeCardLkDto!.data;
        if (listMakeCardLkDto==null || listMakeCardLkDto.length == 0) {
          StringUtils.log("listMakeCardLkDto.length == 0");
          throw Exception(response.message);
        }
        makeCardLkDto = listMakeCardLkDto[0];
        makeCardLkDetails = FormMapper().mapMakeCardLk(makeCardLkDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  @action
  Future<void> requestPersonLk() async {
    if(personLkDto==null || personLkDto!.pid == null || personLkDto!.pid!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        PersonLkResponseDto response = await ApiClient().getPersonInfoByPid(
            personLkDto!.pid!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listPersonLkDto = response.listPersonLkDto!.data;
        if (listPersonLkDto==null || listPersonLkDto.length == 0) {
          StringUtils.log("listPersonLkDto.length == 0");
          throw Exception(response.message);
        }
        personLkDto = listPersonLkDto[0];
        personLkDetails = FormMapper().mapPersonLk(personLkDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  @action
  Future<void> requestHouseLk() async {
    if(personLkDto==null || personLkDto!.pid == null || personLkDto!.pid!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        HouseLkResponseDto response = await ApiClient().getHouseInfoByPid(
            personLkDto!.pid!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listHouseLkDto = response.listHouseLkDto!.data;
        if (listHouseLkDto==null || listHouseLkDto.length == 0) {
          StringUtils.log("listHouseLkDto.length == 0");
          throw Exception(response.message);
        }
        houseLkDto = listHouseLkDto[0];
        houseLkDetails = FormMapper().mapHouseLk(houseLkDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  Future<void> requestAlienHouseLk() async {
    if(alienPersonDto==null || alienPersonDto!.personalID == null || alienPersonDto!.personalID!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        HouseLkResponseDto response = await ApiClient().getHouseInfoByPid(
            alienPersonDto!.personalID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listHouseLkDto = response.listHouseLkDto!.data;
        if (listHouseLkDto==null || listHouseLkDto.length == 0) {
          StringUtils.log("listHouseLkDto.length == 0");
          throw Exception(response.message);
        }
        houseLkDto = listHouseLkDto[0];
        houseLkDetails = FormMapper().mapHouseLk(houseLkDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  Future<void> requestAlienPersonImage() async {
    if(alienPersonDto==null || alienPersonDto!.personalID == null || alienPersonDto!.personalID!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto response = await ApiClient().getAlienPersonImageInfoByPid(
            alienPersonDto!.personalID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listImageDto = response.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(response.message);
          status = ActionStatus.success;
          return;
        }
        alienPersonImageDto = listImageDto[0];
        if (alienPersonImageDto!.image == null || alienPersonImageDto!.image!.isEmpty) {
          StringUtils.log("alienPersonImageDto.image == null || alienPersonImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(alienPersonImageDto!.image!=null){
          alienPersonImageBytes = Base64Decoder().convert(alienPersonImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  Future<void> requestAlienWorkerImage() async {
    if(alienWorkerDto==null || alienWorkerDto!.personalID == null || alienWorkerDto!.personalID!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto response = await ApiClient().getAlienPersonImageInfoByPid(
            alienWorkerDto!.personalID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listImageDto = response.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(response.message);
          status = ActionStatus.success;
          return;
        }
        alienWorkerImageDto = listImageDto[0];
        if (alienWorkerImageDto!.image == null || alienWorkerImageDto!.image!.isEmpty) {
          StringUtils.log("alienWorkerImageDto.image == null || alienWorkerImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(alienWorkerImageDto!.image!=null){
          alienWorkerImageBytes = Base64Decoder().convert(alienWorkerImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  Future<void> requestPersonNonThaiImage() async {
    if(personNonThaiDto==null || personNonThaiDto!.personalID == null || personNonThaiDto!.personalID!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto response = await ApiClient().getAlienPersonImageInfoByPid(
            personNonThaiDto!.personalID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listImageDto = response.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(response.message);
          status = ActionStatus.success;
          return;
        }
        personNonThaiImageDto = listImageDto[0];
        if (personNonThaiImageDto!.image == null || personNonThaiImageDto!.image!.isEmpty) {
          StringUtils.log("personNonThaiImageDto.image == null || personNonThaiImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(personNonThaiImageDto!.image!=null){
          personNonThaiImageBytes = Base64Decoder().convert(personNonThaiImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  Future<void> requestPersonNoRegisImage() async {
    if(personNoRegisDto==null || personNoRegisDto!.personalID == null || personNoRegisDto!.personalID!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled==false) {
        status = ActionStatus.inProgress;
        ImageResponseDto response = await ApiClient().getAlienPersonImageInfoByPid(
            personNoRegisDto!.personalID!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listImageDto = response.listImageDto!.data;
        if (listImageDto==null || listImageDto.length == 0) {
          StringUtils.log("listImageDto.length == 0");
          // throw Exception(response.message);
          status = ActionStatus.success;
          return;
        }
        personNoRegisImageDto = listImageDto[0];
        if (personNoRegisImageDto!.image == null || personNoRegisImageDto!.image!.isEmpty) {
          StringUtils.log("personNoRegisImageDto.image == null || personNoRegisImageDto.image.isEmpty");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        if(personNoRegisImageDto!.image!=null){
          personNoRegisImageBytes = Base64Decoder().convert(personNoRegisImageDto!.image!);
        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  Future<void> requestLk2Group1() async {
    if (faceDto == null || faceDto!.personalid == null || faceDto!.personalid!.isEmpty) return;

    openGPSDisabled = false;
    try {
      lastPosition = await DeviceInformationUtils.determinePosition();
    } catch (e) {
      StringUtils.log("determinePosition Error " + e.toString());
      openGPSDisabled = true;
      status = ActionStatus.error;
    }

    try {
      if (!openGPSDisabled) {
        status = ActionStatus.inProgress;
        Lk2Group1ResponseDto response = await ApiClient().getLk2Group1(
            faceDto!.personalid!, lastPosition.latitude, lastPosition.longitude);

        StringUtils.log("listLk2Group1Dto json: ${jsonEncode(response.listLk2Group1Dto?.toJson())}");
        StringUtils.log("status: ${response.listLk2Group1Dto?.status}");

        if (response == null) {
          StringUtils.log("response == null");
          // throw Exception(AppMessage.pleaseTryAgain);
          status = ActionStatus.success;
          return;
        }

        final listLk2Group1Dto = response.listLk2Group1Dto!.data;
        StringUtils.log("status: ${response.status}");

        if (response.status == 'error') {
          StringUtils.log("response.status=='error'");
          // throw Exception(AppMessage.pleaseAuthenLK2);
          //throw Exception("${response.message} \n" + AppMessage.pleaseAuthenLK2);
          throw Exception("${response.message}");
        }

        // StringUtils.log("listLk2Group1Dto count: ${listLk2Group1Dto?.length ?? 0}");

        // if (listLk2Group1Dto != null && listLk2Group1Dto.isNotEmpty) {
        //   for (var item in listLk2Group1Dto) {
        //     // StringUtils.log("listLk2Group1Dto item: ${item.toJson()}");
        //   }
        // } else {
        //   StringUtils.log("listLk2Group1Dto ว่างหรือ null");
        // }

        if (listLk2Group1Dto == null || listLk2Group1Dto.isEmpty) {
          StringUtils.log("listLk2Group1Dto หรือ data ว่าง");
          status = ActionStatus.success;
          return;
        }

        for (var lk2Group1Dto in listLk2Group1Dto) {
          StringUtils.log("วนลูปแต่ละ lk2Group1Dto");

          final personInfo = lk2Group1Dto.listPersonLkDto;
          final houseInfo = lk2Group1Dto.listHouseLkDto;
          final imageInfo = lk2Group1Dto.listImageDto;
          final cardInfo = lk2Group1Dto.listCardInfo;

          if (personInfo != null && personInfo.data != null && personInfo.data!.isNotEmpty) {
            StringUtils.log("personInfo มีข้อมูล ${personInfo.data!.length} รายการ");
            for (var person in personInfo.data!) {
              StringUtils.log("person pid: ${person.pid}");
              StringUtils.log("person fullnameAndRank: ${person.fullnameAndRank}");
              personLkDto = person;
              personLkDetails = FormMapper().mapPersonLk(person);
            }
          } else {
            StringUtils.log("personInfo ไม่มีข้อมูลหรือว่าง");
          }

          if (houseInfo != null && houseInfo.data != null && houseInfo.data!.isNotEmpty) {
            StringUtils.log("houseInfo มีข้อมูล ${houseInfo.data!.length} รายการ");
            for (var house in houseInfo.data!) {
              StringUtils.log("houseID: ${house.houseID}");
              StringUtils.log("houseNo: ${house.houseNo}");
              StringUtils.log("houseTypeDesc: ${house.houseTypeDesc}");
              houseLkDto = house;
              houseLkDetails = FormMapper().mapHouseLk(houseLkDto);
            }
          } else {
            StringUtils.log("houseInfo ไม่มีข้อมูลหรือว่าง");
          }

          if (imageInfo != null && imageInfo.data != null && imageInfo.data!.isNotEmpty) {
            StringUtils.log("imageInfo มีข้อมูล ${imageInfo.data!.length} รายการ");
            for (var img in imageInfo.data!) {
              StringUtils.log("imageInfo mineType: ${img.mineType}");
              personLkImageDto = img;
              if(personLkImageDto!.image!=null){
                personLkImageBytes = Base64Decoder().convert(personLkImageDto!.image!);
              }
            }
          } else {
            StringUtils.log("imageInfo ไม่มีข้อมูลหรือว่าง");
          }

          if (cardInfo != null && cardInfo.data != null && cardInfo.data!.isNotEmpty) {
            StringUtils.log("cardInfo มีข้อมูล ${cardInfo.data!.length} รายการ");
            for (var card in cardInfo.data!) {
              StringUtils.log("card documentNumber: ${card.documentNumber}");
              StringUtils.log("card phoneNumber: ${card.phoneNumber}");
              makeCardLkDto = card;
              makeCardLkDetails = FormMapper().mapMakeCardLk(makeCardLkDto);
            }
          } else {
            StringUtils.log("cardInfo ไม่มีข้อมูลหรือว่าง");
          }

        }

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  // --- END Linkage ------

  // --- START Social ----
  @action
  Future<void> requestHospital() async {
    if(employmentDto==null || employmentDto!.ssoNum == null || employmentDto!.ssoNum!.isEmpty) return;
    openGPSDisabled = false;
    try {
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled=true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        HospitalResponseDto response = await ApiClient().getSelectHospitalPid(
            employmentDto!.ssoNum!, lastPosition.latitude,
            lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listHospitalDto = response.listHospitalDto!.data;
        if (listHospitalDto==null || listHospitalDto.length == 0) {
          StringUtils.log("listHospitalDto.length == 0");
          throw Exception(response.message);
        }
        hospitalDto = listHospitalDto[0];
        hospitalDetails = FormMapper().mapHospital(hospitalDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }

  @action
  Future<void> requestEmployer() async {
    if(employmentDto==null || employmentDto!.accNo == null || employmentDto!.accNo!.isEmpty || employmentDto!.accBran == null || employmentDto!.accBran!.isEmpty) return;
    openGPSDisabled = false;
    try{
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled = true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        EmployerResponseDto response = await ApiClient().getEmployerDetail(
            employmentDto!.accNo!, employmentDto!.accBran!, lastPosition.latitude,
            lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listEmployerDto = response.listEmployerDto!.data;
        if (listEmployerDto==null || listEmployerDto.length == 0) {
          StringUtils.log("listEmployerDto.length == 0");
          throw Exception(response.message);
        }
        employerDto = listEmployerDto[0];
        employerDetails = FormMapper().mapEmployer(employerDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END Social ----

  // --- START Travel ----
  // @action
  // Future<void> requestTravelVisa() async {
  //   if(travelDto==null || travelDto!.tMRunNo == null || travelDto!.tMRunNo!.isEmpty) return;
  //   openGPSDisabled = false;
  //   try{
  //     lastPosition= await DeviceInformationUtils.determinePosition();
  //   }catch(e){
  //     StringUtils.log("determinePosition Error "+e.toString());
  //     openGPSDisabled = true;
  //     status = ActionStatus.error;
  //   }
  //
  //   try {
  //     if(openGPSDisabled == false) {
  //       status = ActionStatus.inProgress;
  //       TravelVisaResponseDto response = await ApiClient()
  //           .getTravelDetailByTmRunno(
  //           travelDto!.tMRunNo!, lastPosition.latitude, lastPosition.longitude);
  //       if (response == null) {
  //         StringUtils.log("response == null");
  //         throw Exception(AppMessage.pleaseTryAgain);
  //       }
  //
  //       final listTravelVisaDto = response.listTravelVisaDto!.data;
  //       if (listTravelVisaDto==null || listTravelVisaDto.length == 0) {
  //         StringUtils.log("listTravelVisaDto.length == 0");
  //         throw Exception(response.message);
  //       }
  //       travelVisaDto = listTravelVisaDto[0];
  //       travelVisaDetails = FormMapper().mapTravelVisa(travelVisaDto);
  //
  //       if (travelVisaDto!=null && travelVisaDto!.img != null && travelVisaDto!.img!.isNotEmpty) {
  //         travelImageBytes = Base64Decoder().convert(travelVisaDto!.img!);
  //       }
  //
  //       status = ActionStatus.success;
  //     }
  //   } on Exception catch (obj) {
  //     await _handleError(obj);
  //   }
  // }
  // --- END Travel ----

  // --- START Extension ----
  @action
  Future<void> decodeExtensionImage() async {
    final imageData = extensionDto?.livephoto;

    if (imageData != null && imageData.isNotEmpty) {
      try {
        print("Start decoding image. Length = ${imageData.length}");
        extensionImageBytes = Base64Decoder().convert(imageData);
      } catch (e) {
        print("Error decoding base64 image: $e");
      }
    } else {
      print("No image data found.");
    }
  }

  // --- END Extension ----

  @action
  Future<void> requestWarrantCaseDetail() async {
    if(warrantDto!.caseType=='อาญา' || warrantDto!.caseType=='คดีอาญา'){
      requestWarrantCrimeCaseDetail();
    }else{
      requestWarrantTrafficCaseDetail();
    }
  }


  // --- START WarrantCrimeCaseDetail ----
  @action
  Future<void> requestWarrantCrimeCaseDetail() async {

    if(warrantDto==null || warrantDto!.orgCode == null || warrantDto!.orgCode!.isEmpty
        || warrantDto!.getCaseNumber() == null ||warrantDto!.getCaseNumber() == ''
        || warrantDto!.getCaseYear() == null ||warrantDto!.getCaseYear() == '') return;
    openGPSDisabled = false;
    try{
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled = true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        GetCrimeCaseResponseDto response = await ApiClient()
            .getCrimeCaseByFullcaseNo(
            warrantDto!.orgCode!, warrantDto!.getCaseYear(), warrantDto!.getCaseNumber(), lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listCrimeCaseDto = response.listCrimeCase!.data;
        if (listCrimeCaseDto==null || listCrimeCaseDto.length == 0) {
          StringUtils.log("listCrimeCaseDto.length == 0");
          throw Exception("ไม่พบข้อมูลคดี");
        }
        crimeCaseDto = listCrimeCaseDto[0];
        crimeCaseDetails = FormMapper().mapCrimeCase(crimeCaseDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END WarrantCrimeCaseDetail ----

  // --- START WarrantTrafficCaseDetail ----
  @action
  Future<void> requestWarrantTrafficCaseDetail() async {

    if(warrantDto==null || warrantDto!.orgCode == null || warrantDto!.orgCode!.isEmpty
        || warrantDto!.getCaseNumber() == null ||warrantDto!.getCaseNumber() == ''
        || warrantDto!.getCaseYear() == null ||warrantDto!.getCaseYear() == '') return;
    openGPSDisabled = false;
    try{
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled = true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        GetTrafficCaseResponseDto response = await ApiClient()
            .getTrafficCaseByFullcaseNo(
            warrantDto!.orgCode!, warrantDto!.getCaseYear(), warrantDto!.getCaseNumber(), lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listTrafficCaseDto = response.listTrafficCase!.data;
        if (listTrafficCaseDto==null || listTrafficCaseDto.length == 0) {
          StringUtils.log("listCrimeCaseDto.length == 0");
          throw Exception(response.message);
        }
        trafficCaseDto = listTrafficCaseDto[0];
        trafficCaseDetails = FormMapper().mapTrafficCase(trafficCaseDto!);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END Travel ----


  // --- START VehicleCrimeCaseDetail ----
  @action
  Future<void> requestVehicleCrimeCaseDetail() async {

    if(crimeCaseVehicleDto==null || crimeCaseVehicleDto!.orgCode == null || crimeCaseVehicleDto!.orgCode!.isEmpty
        || crimeCaseVehicleDto!.getCrimeCaseNo() == null ||crimeCaseVehicleDto!.getCrimeCaseNo() == ''
        || crimeCaseVehicleDto!.getCrimeCaseYear() == null ||crimeCaseVehicleDto!.getCrimeCaseYear() == '') return;
    openGPSDisabled = false;
    try{
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled = true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        GetCrimeCaseResponseDto response = await ApiClient()
            .getCrimeCaseByFullcaseNo(
            crimeCaseVehicleDto!.orgCode!, crimeCaseVehicleDto!.getCrimeCaseYear()!, crimeCaseVehicleDto!.getCrimeCaseNo()!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listCrimeCaseDto = response.listCrimeCase!.data;
        if (listCrimeCaseDto==null || listCrimeCaseDto.length == 0) {
          StringUtils.log("listCrimeCaseDto.length == 0");
          throw Exception("ไม่พบข้อมูลคดี");
        }
        crimeCaseDto = listCrimeCaseDto[0];
        crimeCaseDetails = FormMapper().mapCrimeCase(crimeCaseDto);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END VehicleCrimeCaseDetail ----

// --- START VehicleTrafficCaseDetail ----
  @action
  Future<void> requestVehicleTrafficCaseDetail() async {

    if(trafficCaseVehicleDto==null || trafficCaseVehicleDto!.orgCode == null || trafficCaseVehicleDto!.orgCode!.isEmpty
        || trafficCaseVehicleDto!.getCrimeCaseNo() == null || trafficCaseVehicleDto!.getCrimeCaseNo() == ''
        || trafficCaseVehicleDto!.getCrimeCaseYear() == null || trafficCaseVehicleDto!.getCrimeCaseYear() == '') return;
    openGPSDisabled = false;
    try{
      lastPosition= await DeviceInformationUtils.determinePosition();
    }catch(e){
      StringUtils.log("determinePosition Error "+e.toString());
      openGPSDisabled = true;
      status = ActionStatus.error;
    }

    try {
      if(openGPSDisabled == false) {
        status = ActionStatus.inProgress;
        GetTrafficCaseResponseDto response = await ApiClient()
            .getTrafficCaseByFullcaseNo(
            trafficCaseVehicleDto!.orgCode!, trafficCaseVehicleDto!.getCrimeCaseYear()!, trafficCaseVehicleDto!.getCrimeCaseNo()!, lastPosition.latitude, lastPosition.longitude);
        if (response == null) {
          StringUtils.log("response == null");
          throw Exception(AppMessage.pleaseTryAgain);
        }

        final listTrafficCaseDto = response.listTrafficCase!.data;
        if (listTrafficCaseDto==null || listTrafficCaseDto.length == 0) {
          StringUtils.log("listCrimeCaseDto.length == 0");
          throw Exception("ไม่พบข้อมูลคดี");
        }
        trafficCaseDto = listTrafficCaseDto[0];
        trafficCaseDetails = FormMapper().mapTrafficCase(trafficCaseDto!);

        status = ActionStatus.success;
      }
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END VehicleTrafficCaseDetail ----

  // --- START getPDFUrl ----
  @action
  Future<void> getPDFUrl() async {
    pdfURL = '';
    status = ActionStatus.inProgress;
    try {
      if(category == AppConstant.dbOuterPersonSocialEmployee ||category == AppConstant.dbOuterPersonSocialEmployer || category == AppConstant.dbOuterPersonSocialHospital) {
        pdfURL = await ApiClient().getSsoReport(employmentDto, hospitalDto, employerDto);
      }else if(category == AppConstant.dbOuterPersonForeign) {
        pdfURL = await ApiClient().getDoeReport(workerDto, workerImageDto==null ? "":workerImageDto!.image!);
      }else if(category == AppConstant.dbOuterPersonCivil){
        pdfURL = await ApiClient().getDopaReport(personDto, personImageDto==null ? "":personImageDto!.image!);
      }else if(category == AppConstant.dbOuterPersonLinkage){
        pdfURL = await ApiClient().getDopaLinkageReport(personLkDto, houseLkDto, personLkImageDto==null ? "":personLkImageDto!.image!);
      }else if(category == AppConstant.dbInnerPersonFaceRec){
        pdfURL = await ApiClient().getDopaLinkageReport(personLkDto, houseLkDto, personLkImageDto==null ? "":personLkImageDto!.image!);
      }else if(category == AppConstant.dbOuterPersonAlien){
        pdfURL = await ApiClient().getForeignReport(alienPersonDto, houseLkDto, alienPersonImageDto==null ? "":alienPersonImageDto!.image!);
      }else if(category == AppConstant.dbOuterPersonWorker){
        pdfURL = await ApiClient().getWorkerReport(alienWorkerDto, /*houseLkDto,*/ alienWorkerImageDto==null ? "":alienWorkerImageDto!.image!);
      }else if(category == AppConstant.dbOuterPersonNonThai){
        pdfURL = await ApiClient().getPersonNonThaiReport(personNonThaiDto, /*houseLkDto,*/ personNonThaiImageDto==null ? "":personNonThaiImageDto!.image!);
      }else if(category == AppConstant.dbOuterPersonNoRegis){
        pdfURL = await ApiClient().getPersonNoRegisReport(personNoRegisDto, /*houseLkDto,*/ personNoRegisImageDto==null ? "":personNoRegisImageDto!.image!);
      }else if(category == AppConstant.dbOuterPersonCarLicense){
        pdfURL = await ApiClient().getDriverLicenceReport(result.data);
      }else if(category == AppConstant.dbOuterPersonBusLicense){
        pdfURL = await ApiClient().getPublicLicenceReport(result.data);
      }else if(category == AppConstant.dbOuterPersonCar || category == AppConstant.dbOuterCarCar){
        pdfURL = await ApiClient().getVehicleReport(result.data);
      }else if(category == AppConstant.dbOuterPersonHealth){
        pdfURL = await ApiClient().getNhsoReport(result.data);
      }
      // else if(category == AppConstant.dbOuterPersonImmigration){
      //   pdfURL = await ApiClient().getTravelReport(travelDto, travelVisaDto);
      // }
      else if(category == AppConstant.dbOuterPersonImmigration){
        pdfURL = await ApiClient().getImmReport(result.data);
      }else if(category == AppConstant.dbOuterPersonExtension){
        pdfURL = await ApiClient().getExtensionReport(result.data);
      }else if(category == AppConstant.dbOuterPersonForeignHouse){
        pdfURL = await ApiClient().getTm61Report(result.data);
      }else if(category == AppConstant.dbOuterPersonTraffic || category == AppConstant.dbOuterCarTraffic){
        pdfURL = await ApiClient().getPtmReport(result.data);
      }else if(category == AppConstant.dbOuterPersonP4){
        pdfURL = await ApiClient().getGunLinkageReport(result.data);
      }else if(category == AppConstant.dbInnerPersonHasAya /*|| category == AppConstant.dbInnerPersonHasTraffic*/){
        pdfURL = await ApiClient().getWarrantReport(result.data);
      }else if(category == AppConstant.dbInnerPersonWarrantCRD){
        pdfURL = await ApiClient().getWarrantCRDReport(result.data);
      }else if(category == AppConstant.dbInnerPersonWarrantCourtCRD){
        pdfURL = await ApiClient().getWarrantCourtCRDReport(result.data);
      }else if(category == AppConstant.dbInnerPersonRedNotice){
        pdfURL = await ApiClient().getRedNoticeReport(result.data);
      }else if(category == AppConstant.dbInnerPersonDoAya || category == AppConstant.dbInnerInfoPersonSS){
        pdfURL = await ApiClient().getCrimecasePersonReport(result.data);
      }else if(category == AppConstant.dbInnerPersonDoTraffic || category == AppConstant.dbInnerInfoPersonTC){
        pdfURL = await ApiClient().getTrafficcasePersonReport(result.data);
      }else if(category == AppConstant.dbInnerCarAya || category == AppConstant.dbInnerInfoVehicleCc || category == AppConstant.dbInnerCarLost || category == AppConstant.dbInnerCarWanted){
        pdfURL = await ApiClient().getCrimecaseVehicleReport(result.data);
      }else if(category == AppConstant.dbInnerCarTraffic || category == AppConstant.dbInnerInfoVehicleTc){
        pdfURL = await ApiClient().getTrafficcaseVehicleReport(result.data);
      }else if(category == AppConstant.dbInnerInfoAya){
        pdfURL = await ApiClient().getCrimecaseReport(result.data);
      }else if(category == AppConstant.dbInnerInfoTraffic){
        pdfURL = await ApiClient().getTrafficcaseReport(result.data);
      }else if(category == AppConstant.dbOuterPersonPrisoner){
        pdfURL = await ApiClient().getPrisonerReport(result.data, prisonerImageDto==null ? "":prisonerImageDto!.image!);
      }else if(category == AppConstant.dbInnerCarEmergency){
        pdfURL = await ApiClient().getEmergencyCarReport(result.data);
      }else{
        pdfURL = "ERROR";
      }
      StringUtils.log("pdfURL: " + pdfURL);

      if(pdfURL == "ERROR") {
        StringUtils.log("response == null");
        throw Exception(AppMessage.pleaseTryAgain);
      }
      // if (await canLaunch(pdfURL)) {
      //   await launch(pdfURL);
      // }
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleError(obj);
    }
  }
  // --- END getPDFUrl ----


  // --------- COMMON ------------

  @observable ActionStatus status = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  bool openLogin = false;
  bool openWaitSMS = false;
  bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;
  bool openGPSDisabled = false;
  bool openVerifyPin = false;

  @action
  void resetStatus() {
    status = ActionStatus.idle;
    showError = false;
  }

  Future<void> _handleError(Object obj) async{
    switch (obj.runtimeType) {
      case DioError:
        final type = (obj as DioError).type;
        if(type == DioErrorType.connectionTimeout){
          showError = true;
          errorTitle = AppMessage.error;
          errorMessage = AppMessage.connectedTimeout;

        }else {
          final response = (obj as DioError).response;
          final statusCode = response!.statusCode!;

          if(statusCode>=400 && statusCode<500) {
            final responseDto = CommonResponseDto.fromJson(
                gsonDecode(response.data.toString()));
            errorTitle = AppMessage.error;
            errorMessage = responseDto.message;

            if (statusCode == 400) {
              showError = true;
            } else if (statusCode == 401) {
              await KeyUtils.clearAll();
              openLogin = true;
            } else if (statusCode == 402) {
              openWaitSMS = true;
            } else if (statusCode == 403) {
              openWaitAdmin = true;
            } else if (statusCode == 404) {
              openRegisterPin = true;
            } else if (statusCode == 405) {
              openRegisterBiometrics = true;
            } else if (statusCode == 406) {
              openVerifyPin = true;
            }
          }else{
            showError = true;
            errorTitle = AppMessage.error;
            errorMessage = AppMessage.pleaseTryAgain;
          }
        }

        break;
      default:
        final exception = obj as Exception;
        String message = exception.toString();
        if(message == null || message.isEmpty){
          message = AppMessage.pleaseTryAgain;
        }else if(message.indexOf("Exception: ")>-1){
          message = message.substring(message.indexOf("Exception: ")+"Exception: ".length);
        }
        showError = true;
        errorTitle = AppMessage.error;
        errorMessage = message;
        break;
    }
    status = ActionStatus.error;
  }
}
