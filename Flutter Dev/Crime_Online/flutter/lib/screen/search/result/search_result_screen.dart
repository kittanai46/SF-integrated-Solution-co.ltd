import 'dart:io';
import 'dart:math';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/form_detail.dart';
import 'package:crimes/data/entity/group_result.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/search/detail/search_detail_screen.dart';
import 'package:crimes/screen/search/result/search_result_screen_view_model.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchResultScreenParam extends NavigationParameter {
  SearchResultScreenParam(
      this.type,
      this.groupResultArray,
      this.userDto,
  );

  final String type;
  final List<GroupResult> groupResultArray;
  final UserDto userDto;

}

class SearchResultScreen extends StatefulWidget {
  SearchResultScreen(this.param, {Key? key}) : super(key: key);

  final SearchResultScreenParam param;

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SearchResultScreenViewModel _viewModel = SearchResultScreenViewModel();
  String _title = '';

  @override
  void initState() {
    super.initState();
    _viewModel.userDto = widget.param.userDto;
    _viewModel.setType(widget.param.type);
    _viewModel.groupResultArray = widget.param.groupResultArray;
    _title = _viewModel.title;
  }

  void _backToHomeScreen() {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: 'ยืนยันกลับไปหน้าหลัก',
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto!));
                  }
              ),
            )
        )
    );
  }

  Future<void> _exportExcel(List<Result> resultArray, String? category) async{
    StringUtils.log("====> _exportExcel()");

    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];
    String title = '';
    if(category!=null) title = _getFormTitle(category);

    sheetObject.appendRow([TextCellValue("ข้อมูลจาก ${title}")]);
    sheetObject.appendRow([TextCellValue("")]);

    if(resultArray.length > 0){
      final result = resultArray[0];
      if(result.excelTitle!=null) {
        List<String> titles = result.excelTitle ?? [];
        for(int i=0; i<titles.length; i++){
          String title = titles[i];
          sheetObject.appendRow([TextCellValue(title)]);
        }
      }
    }
    for(int i=0; i<resultArray.length; i++) {
      final result = resultArray[i];
      if(result.excelValue!=null) {
        List<String> values = result.excelValue ?? [];
        for(int i=0; i<values.length; i++){
          String value = values[i];
          sheetObject.appendRow([TextCellValue(value)]);
        }
      }
    }

    Directory? directory;
    if(Platform.isAndroid) {
      // directory = await DownloadsPathProvider.downloadsDirectory;

      List<Directory>? directories = await getExternalStorageDirectories(type: StorageDirectory.downloads);
      if(directories==null || directories.length==0) {
        StringUtils.log('Not found directory download!');
        return;
      }
      directory = directories[0];

      // directory = await getExternalStorageDirectory();
      // String newPath = "";
      // List<String> paths = directory!.path.split("/");
      // for (int x = 1; x < paths.length; x++) {
      //   String folder = paths[x];
      //   if (folder != "Android") {
      //     newPath += "/" + folder;
      //   } else {
      //     break;
      //   }
      // }
      // newPath = newPath + "/Downloads";
      // directory = Directory(newPath);

      // String newPath = "/storage/emulated/0/Downloads";
      // directory = Directory(newPath);
    } else if(Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }
    if(directory == null) return;
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    String path = '${directory.path}/${_getFileName(title)}.xlsx';
    StringUtils.log('path: ${path}');

    List<int>? onValue = excel.encode();
    if(onValue!=null){
      File(path)
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);

      Fluttertoast.showToast(msg: "ดาวน์โหลดไฟล์ .xlxs เก็บไว้ที่: ${path}", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
    }
  }

  void _checkPermissionExport(List<Result> resultArray, String? category) {
    if(Platform.isAndroid){
      _checkPermissionStorage(resultArray, category);
    }else if(Platform.isIOS){
      // _checkPermissionGallery(resultArray, category);
      _exportExcel(resultArray, category);
    }
  }

  Future<void> _checkPermissionStorage(List<Result> resultArray, String? category) async{
    PermissionStatus storageStatus = await Permission.storage.status;
    StringUtils.log('_checkPermissionStorage - storageStatus: ${storageStatus}');

    List<Permission> _permissions = [];
    if(!storageStatus.isGranted){
      _permissions.add(Permission.storage);
    }

    if(_permissions.length > 0){
      if(storageStatus.isPermanentlyDenied) {
        _askOpenSettingStorage();
      }else {
        _requestPermissionStorage(storageStatus, _permissions, resultArray, category);
      }
    }else if(_permissions.length == 0){
      _exportExcel(resultArray, category);
    }
  }

  Future<void> _requestPermissionStorage(PermissionStatus storageStatus, List<Permission> _permissions, List<Result> resultArray, String? category) async{
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if(!storageStatus.isGranted) {
      storageStatus = statuses[Permission.storage] as PermissionStatus;
    }
    StringUtils.log('_requestPermissionStorage - storageStatus: ${storageStatus}');

    if(storageStatus.isPermanentlyDenied){
      _askOpenSettingStorage();
    }else{
      await _checkPermissionStorage(resultArray, category);
    }
  }

  void _askOpenSettingStorage() {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: AppMessage.askPermissionStorage,
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    openAppSettings();
                  }
              ),
            )
        )
    );
  }

  Future<void> _checkPermissionGallery(List<Result> resultArray, String? category) async{
    PermissionStatus photoStatus = await Permission.photos.status;
    StringUtils.log('_checkPermissionGallery - photoStatus: ${photoStatus}');

    List<Permission> _permissions = [];
    if(!photoStatus.isGranted){
      _permissions.add(Permission.photos);
    }

    if(_permissions.length > 0){
      if(photoStatus.isPermanentlyDenied) {
        _askOpenSettingGallery();
      }else {
        _requestPermissionGallery(photoStatus, _permissions, resultArray, category);
      }
    }else if(_permissions.length == 0){
      _exportExcel(resultArray, category);
    }
  }

  Future<void> _requestPermissionGallery(PermissionStatus photoStatus, List<Permission> _permissions, List<Result> resultArray, String? category) async{
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if(!photoStatus.isGranted) {
      photoStatus = statuses[Permission.photos] as PermissionStatus;
    }
    StringUtils.log('_requestPermissionGallery - photoStatus: ${photoStatus}');

    if(photoStatus.isPermanentlyDenied){
      _askOpenSettingGallery();
    }else{
      await _checkPermissionGallery(resultArray, category);
    }
  }

  void _askOpenSettingGallery(){
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: AppMessage.askPermissionGallery,
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    openAppSettings();
                  }
              ),
            )
        )
    );
  }

  String _getFileName(String title){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd_HH:mm').format(now);
    return "รายงานการสืบค้นข้อมูล${_title}_ฐานข้อมูล${title}_${formattedDate}";
  }

  String _getFormTitle(String category) {
    String title = "";
    switch(category) {

    // Person Inner
      case AppConstant.dbInnerPersonHasAya: title = AppConstant.msInnerPersonHasAya; break;
      case AppConstant.dbInnerPersonDoAya: title = AppConstant.msInnerPersonDoAya; break;
      // case AppConstant.dbInnerPersonHasTraffic: title = AppConstant.msInnerPersonHasTraffic; break;
      case AppConstant.dbInnerPersonDoTraffic: title = AppConstant.msInnerPersonDoTraffic; break;
      case AppConstant.dbInnerPersonWarrantCRD: title = AppConstant.msInnerPersonWarrantCRD; break;
      case AppConstant.dbInnerPersonWarrantCourtCRD: title = AppConstant.msInnerPersonWarrantCourtCRD; break;
      case AppConstant.dbInnerPersonRedNotice: title = AppConstant.msInnerPersonRedNotice; break;
      case AppConstant.dbInnerPersonFaceRec: title = AppConstant.msInnerPersonFaceRec; break;

    // Person Outer
      case AppConstant.dbOuterPersonLinkage: title = AppConstant.msOuterPersonLinkage; break;
      case AppConstant.dbOuterPersonCivil: title = AppConstant.msOuterPersonCivil; break;
      case AppConstant.dbOuterPersonForeign: title = AppConstant.msOuterPersonForeign; break;
      case AppConstant.dbOuterPersonAlien: title = AppConstant.msOuterPersonAlien; break;
      case AppConstant.dbOuterPersonWorker: title = AppConstant.msOuterPersonWorker; break;
      case AppConstant.dbOuterPersonCarLicense: title = AppConstant.msOuterPersonCarLicense; break;
      case AppConstant.dbOuterPersonBusLicense: title = AppConstant.msOuterPersonBusLicense; break;
      case AppConstant.dbOuterPersonCar: title = AppConstant.msOuterPersonCar; break;
      case AppConstant.dbOuterPersonSocialEmployee: title = AppConstant.msOuterPersonSocialEmployee; break;
      case AppConstant.dbOuterPersonSocialHospital: title = AppConstant.msOuterPersonSocialHospital; break;
      case AppConstant.dbOuterPersonSocialEmployer: title = AppConstant.msOuterPersonSocialEmployer; break;
      case AppConstant.dbOuterPersonHealth: title = AppConstant.msOuterPersonHealth; break;
      case AppConstant.dbOuterPersonImmigration: title = AppConstant.msOuterPersonImmigration; break;
      case AppConstant.dbOuterPersonForeignHouse: title = AppConstant.msOuterPersonForeignHouse; break;
      case AppConstant.dbOuterPersonTraffic: title = AppConstant.msOuterPersonTraffic; break;
      case AppConstant.dbOuterPersonP4: title = AppConstant.msOuterPersonP4; break;
      case AppConstant.dbOuterPersonPrisoner: title = AppConstant.msOuterPersonPrisoner; break;
      // case AppConstant.dbOuterPersonRescueVolunteer: title = AppConstant.msOuterPersonRescueVolunteer; break;
      // case AppConstant.dbOuterPersonRescueTraining: title = AppConstant.msOuterPersonRescueTraining; break;
      // case AppConstant.dbOuterPersonRescueVolunteer: title = AppConstant.msOuterPersonRescueVolunteer; break;
      // case AppConstant.dbOuterPersonRescueTraining: title = AppConstant.msOuterPersonRescueTraining; break;

      case AppConstant.dbOuterPersonNonThai: title = AppConstant.msOuterPersonNonThai; break;
      case AppConstant.dbOuterPersonNoRegis: title = AppConstant.msOuterPersonNoRegis; break;

    // Car Inner
      case AppConstant.dbInnerCarAya: title = AppConstant.msInnerCarAya; break;
      case AppConstant.dbInnerCarLost: title = AppConstant.msInnerCarLost; break;
      // case AppConstant.dbInnerCarWanted: title = AppConstant.msInnerCarWanted; break;
      case AppConstant.dbInnerCarTraffic: title = AppConstant.msInnerCarTraffic; break;
      case AppConstant.dbInnerCarEmergency: title = AppConstant.msInnerCarEmergency; break;
    // Car Outer
      case AppConstant.dbOuterCarCar: title = AppConstant.msOuterCarCar; break;
      case AppConstant.dbOuterCarTraffic: title = AppConstant.msOuterCarTraffic; break;
      // case AppConstant.dbOuterCarAmbulanceLicense: title = AppConstant.msOuterCarAmbulanceLicense; break;
      // case AppConstant.dbOuterCarFlashingLightLicense: title = AppConstant.msOuterCarFlashingLightLicense; break;

    // Info Inner
      case AppConstant.dbInnerInfoAya: title = AppConstant.msInnerInfoAya; break;
      case AppConstant.dbInnerInfoPersonSS: title = AppConstant.msInnerInfoPersonSS; break;
      case AppConstant.dbInnerInfoTraffic: title = AppConstant.msInnerInfoTraffic; break;
      case AppConstant.dbInnerInfoPersonTC: title = AppConstant.msInnerInfoPersonTC; break;
      case AppConstant.dbInnerInfoVehicleCc: title = AppConstant.msInnerInfoVehicleCc; break;
      case AppConstant.dbInnerInfoVehicleTc: title = AppConstant.msInnerInfoVehicleTc; break;

    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.primaryColor,
      body: Observer(
        builder: (_) => StatusAwareContainer(
          _viewModel.status,
          showError: _viewModel.showError,
          idle: _buildLayout(),
          error: Stack(children: [
            _buildError(),
          ]),
          // onRetry: _refreshDB,
        ),
      ),
    );
  }

  Widget _buildLayout() => Container(
    decoration: getBg(),
    child: Column(
      children: <Widget>[
        _buildAppBar('ผลการสืบค้น'),
        Expanded(
          child: Container(
            color: AppColor.white_bg,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h,),
                Text(
                    "รายการผลการสืบค้นข้อมูล$_title",
                    style: TextStyles.titleBold.copyWith(color: Colors.black),
                ),
                _buildList(),
                SizedBox(height: 16.h,),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildAppBar(String title) => Container(
    padding: EdgeInsets.fromLTRB(8.w, 32.h, 8.w, 8.h),
    child: Row(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            onTap: (){
              ScreenNavigator.pop();
            },
            child: Container(
              width: 45.w,
              child: Center(
                child: Image.asset(AppImage.ic_back, fit: BoxFit.contain, width: 24.w, height: 45.h),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${title}",
              style: TextStyles.titleBold.copyWith(color: Colors.white),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            onTap: (){
              _backToHomeScreen();
            },
            child: Container(
              width: 45.w,
              child: Center(
                child: Image.asset(AppImage.ic_home, fit: BoxFit.contain, width: 24.w, height: 45.h),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildList() => Expanded(
    child: ListView.builder(
      itemCount: _viewModel.groupResultArray.length,
      itemBuilder: _getGroupListItem,
    ),
  );

  Widget _getGroupListItem(BuildContext context, int index) {
    final groupResult = _viewModel.groupResultArray[index];
    final category = groupResult.category;
    final title = groupResult.title;
    final resultArray = groupResult.resultArray;
    final errorMessage = groupResult.errorMessage;
    return Column(
      children:[
        _getList(category, title, resultArray, errorMessage),
        SizedBox(height: 16.h,),
      ]
    );
  }

  void _selectItem(Result result, String category) {
    ScreenNavigator.navigateTo(Routes.searchDetail, param: SearchDetailScreenParam(_viewModel.searchType, category, result, _viewModel.userDto!));
  }

  Widget _getList(String? category, String? title, List<Result>? resultArray, String? errorMessage) {
    int count = 0;
    if(resultArray!=null) count = resultArray.length;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: -8,
              blurRadius: 24,
              offset: Offset(0.0, 12.0)// changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${title}',
                  style: TextStyles.bodySemi.copyWith(color: AppColor.blue_text),
                ),
              ),
              Text(
                '$count รายการ',
                style: TextStyles.body.copyWith(color: AppColor.grey_text),
              ),
              SizedBox(width: 11.w),
              if(resultArray!=null && resultArray.length > 0 && resultArray[0].excelTitle != null && resultArray[0].excelTitle!.length > 0)
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: (){
                        _checkPermissionExport(resultArray, category);
                      },
                      child: Image.asset(AppImage.ic_share, fit: BoxFit.contain, width: 24.w),
                    ),
                ),
              if(resultArray!=null && resultArray.length > 0 && resultArray[0].excelTitle != null && resultArray[0].excelTitle!.length == 0)
                Image.asset(AppImage.ic_share_grey, fit: BoxFit.contain, width: 24.w),
            ],
          ),
          if(resultArray!=null)
            for(int i=0; i<resultArray.length; i++)
              Column(
                children: [
                  if(i>0)
                    SizedBox(height: 14.h),
                  if(i>0)
                    Container(
                      color: AppColor.grey_line,
                      height: 0.5,
                      width: double.infinity,
                    ),
                  SizedBox(height: 14.h),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: (){
                        _selectItem(resultArray[i], category!);
                      },
                      child: Container(
                        child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${resultArray[i].title}",
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.smallSemi.copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      "${resultArray[i].line1}",
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.small.copyWith(color: AppColor.grey_text),
                                    ),
                                    Text(
                                      "${resultArray[i].line2}",
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.small.copyWith(color: AppColor.grey_text),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Image.asset(AppImage.ic_chevron_right, fit: BoxFit.contain, width: 16.w),
                            ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),


          if(errorMessage!=null && errorMessage.isNotEmpty)
            Container(
              padding: EdgeInsets.only(top: 14.h),
              child: Center(
                child: Text(
                  "${errorMessage}",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyles.smallSemi.copyWith(color: Colors.red),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildError() => Container(
    color: Colors.black.withAlpha(AppConstant.alphaDialog),
    child: Center(
      child: StatusPopup(
        title: _viewModel.errorTitle,
        description: _viewModel.errorMessage,
        buttonText: AppMessage.ok,
        onPress: () => _viewModel.resetStatus(),
      ),
    ),
  );

  void _handleError(){

    if(_viewModel.openLogin){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleChangePhone,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
          onConfirm: () => ScreenNavigator.navigateReplaceTo(Routes.login),
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitSMS){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitSMS,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitAdmin){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitAdmin,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openRegisterPin){
      ScreenNavigator.replaceEntireStackTo(Routes.createPin, param: CreatePinScreenParam(false));
    }else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    }else if(_viewModel.openVerifyPin){
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    title: AppMessage.error,
                    description: _viewModel.errorMessage,
                    buttonText: AppMessage.ok,
                    onPress: () {
                      Navigator.of(context).pop();
                      ScreenNavigator.navigateTo(Routes.verifyPin, param: VerifyPinScreenParam(true));
                    }
                ),
              )
          )
      );
    }
  }
}
