import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/database.dart';
import 'package:crimes/data/entity/source_db.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/favorite/criteria/favorite_criteria_screen_view_model.dart';
import 'package:crimes/screen/favorite/db/favorite_db_screen.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/search/db/search_db_screen_view_model.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/screen/search/result/search_result_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/custom_notification.dart';
import 'package:crimes/widget/custom_text_field.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCriteriaScreenParam extends NavigationParameter {
  FavoriteCriteriaScreenParam(this.type, this.userDto, this.favoriteDto, this.editIndex);

  final String type;
  final UserDto userDto;
  final FavoriteDto favoriteDto;
  final int editIndex;
}

class FavoriteCriteriaScreen extends StatefulWidget {
  FavoriteCriteriaScreen(this.param, {Key? key}) : super(key: key);

  final FavoriteCriteriaScreenParam param;

  @override
  _FavoriteCriteriaScreenState createState() => _FavoriteCriteriaScreenState();
}

class _FavoriteCriteriaScreenState extends State<FavoriteCriteriaScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavoriteCriteriaScreenViewModel _viewModel = FavoriteCriteriaScreenViewModel();

  @override
  void initState() {
    _viewModel.userDto = widget.param.userDto;
    _viewModel.favoriteDto = widget.param.favoriteDto;
    _viewModel.setType(widget.param.type);
    super.initState();
  }

  void _openFavoriteDB() {
    if(!_viewModel.isEnableButton) return;

    ScreenNavigator.navigateTo(Routes.favoriteDB, param: FavoriteDBScreenParam(_viewModel.searchType, _viewModel.userDto!, _viewModel.scope, _viewModel.favoriteDto, widget.param.editIndex));
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
        ),
      ),
    );
  }

  Widget _buildLayout() => Container(
    decoration: getBg(),
    child: Column(
      children: <Widget>[
        _buildAppBar('เพิ่มรายการโปรด'),
        Expanded(
          child: Container(
            color: AppColor.white_bg,
            child: Column(
              children: [
                _buildMainContent(),
                _buildButtons(),
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
            onTap: (){}, //_backToHomeScreen(),
            child: Container(
              width: 45.w,
              // child: Center(
              //   child: Image.asset(AppImage.ic_home, fit: BoxFit.contain, width: 24.w, height: 45.h),
              // ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildMainContent() => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              "กรุณาเลือกรายการข้อมูลที่ต้องกรอก",
              style: TextStyles.titleBold.copyWith(color: Colors.black),
            ),

            if(_viewModel.scope.showInputPid || _viewModel.scope.showInputNames)
              SizedBox(height: 16.h),
            if(_viewModel.scope.showInputPid || _viewModel.scope.showInputNames)
              Text(
                'เงื่อนไขการค้นหาพื้นฐาน',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputPid || _viewModel.scope.showInputPidPlt1 || _viewModel.scope.showInputPidPlt2)
              _getListItem('เลขบัตรประชาชน', AppConstant.showFormIdCard),
            if(_viewModel.scope.showInputNames || _viewModel.scope.showInputNamesPlt1 || _viewModel.scope.showInputNamesPlt2)
              _getListItem('ชื่อ', AppConstant.showFormFirstName),
            if(_viewModel.scope.showInputNames || _viewModel.scope.showInputNamesPlt1 || _viewModel.scope.showInputNamesPlt2)
              _getListItem('นามสกุล', AppConstant.showFormLastName),

            if(_viewModel.scope.showInputWorkerId)
              SizedBox(height: 16.h),
            if(_viewModel.scope.showInputWorkerId)
              Text(
                'เงื่อนไข กลุ่ม: แรงงานต่างด้าว ตรวจคนเข้าเมือง',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputWorkerId)
              _getListItem('เลขบัตรคนต่างด้าว', AppConstant.showFormWorkerId),

            if(_viewModel.scope.showInputPasId || _viewModel.scope.showInputPassportNo)
              _getListItem('เลขพาสปอร์ต', AppConstant.showFormPasId),
            if(_viewModel.scope.showInputPasId)
              _getListItem('สัญชาติ', AppConstant.showFormNation),

            if(_viewModel.scope.showInputFullNoPlate || _viewModel.scope.showInputFullEngineNo || _viewModel.scope.showInputPlateProv || _viewModel.scope.showInputNumBody)
              SizedBox(height: 16.h),
            if(_viewModel.scope.showInputFullNoPlate || _viewModel.scope.showInputFullEngineNo || _viewModel.scope.showInputPlateProv || _viewModel.scope.showInputNumBody)
              Text(
                'เงื่อนไข กลุ่ม: ยานพาหนะในคดี',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputFullNoPlate)
              _getListItem('จังหวัด - ทะเบียนรถ', AppConstant.showFormProviceTc),
            if(_viewModel.scope.showInputFullNoPlate)
              _getListItem('ตัวอักษร - ทะเบียนรถ', AppConstant.showFormIntitialNo),
            if(_viewModel.scope.showInputFullNoPlate)
              _getListItem('ตัวเลข - ทะเบียนรถ', AppConstant.showFormNumber),
            // if(_viewModel.scope.showInputFullNoPlate || _viewModel.scope.showInputFullEngineNo)
            //   _getListItem('สถานะยานพาหนะในคดี', AppConstant.showFormStatus),
            if(_viewModel.scope.showInputFullEngineNo)
              _getListItem('เลขตัวเครื่อง', AppConstant.showFormEngineNo),

            if(_viewModel.scope.showInputPidPlt1 || _viewModel.scope.showInputNamesPlt1 || _viewModel.scope.showInputPidPlt2 || _viewModel.scope.showInputNamesPlt2 || _viewModel.scope.showInputPlateProv)
              SizedBox(height: 16.h),
            if(_viewModel.scope.showInputPidPlt1 || _viewModel.scope.showInputNamesPlt1 || _viewModel.scope.showInputPidPlt2 || _viewModel.scope.showInputNamesPlt2 || _viewModel.scope.showInputPlateProv)
              Text(
                'เงื่อนไข กลุ่ม: กรมขนส่ง',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputPidPlt1 || _viewModel.scope.showInputNamesPlt1)
              _getListItem('รหัสประเภทใบอนุญาตขับรถ', AppConstant.showFormPltcode1),
            if(_viewModel.scope.showInputPidPlt2 || _viewModel.scope.showInputNamesPlt2)
              _getListItem('รหัสประเภทใบอนุญาตขับรถ-ขนส่ง', AppConstant.showFormPltcode2),

            // if(_viewModel.scope.showInputPlateProv)
            //   _getListItem('ทะเบียนรถ (ตัวอักษร)', AppConstant.showFormPlate1Vh),
            // if(_viewModel.scope.showInputPlateProv)
            //   _getListItem('ทะเบียนรถ (ตัวเลข)', AppConstant.showFormPlate2Vh),
            // if(_viewModel.scope.showInputPlateProv)
            //   _getListItem('รหัสทะเบียนรถ (จังหวัด)', AppConstant.showFormProvcode),
            if(_viewModel.scope.showInputPlateProv)
              _getListItem('รหัสประเภทยานพาหนะ (กรมขนส่ง)', AppConstant.showFormVhtype),

            if(_viewModel.scope.showInputNumBody)
              _getListItem('หมายเลขตัวถัง', AppConstant.showFormNumbody),
            if(_viewModel.scope.showInputNumBody)
              _getListItem('รหัสยี่ห้อ (กรมขนส่ง)', AppConstant.showFormBrncode),

            if(_viewModel.scope.showInputGunReg)
            SizedBox(height: 16.h),
            if(_viewModel.scope.showInputGunReg)
              Text(
                'เงื่อนไข กลุ่ม: กรมการปกครอง',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputGunReg)
              _getListItem('หมายเลขทะเบียนอาวุธปืน', AppConstant.showFormGunReg),

            if(_viewModel.scope.showInputPlateTicket)
              SizedBox(height: 16.h),
            if(_viewModel.scope.showInputPlateTicket)
              Text(
                'เงื่อนไข กลุ่ม: ใบสั่งจราจร',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputPlateTicket)
              _getListItem('เลขที่ใบสั่ง', AppConstant.showFormTicketId),

            if(_viewModel.scope.showInputLicenseNumber)
              SizedBox(height: 16.h),
            if(_viewModel.scope.showInputLicenseNumber)
              Text(
                'เงื่อนไข กลุ่ม: รถฉุกเฉิน',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputLicenseNumber)
              _getListItem('เลขหนังสืออนุญาต', AppConstant.showFormLicenseNumber),

            if(_viewModel.scope.showInputFullcaseNo)
              SizedBox(height: 16.h),
            if(_viewModel.scope.showInputFullcaseNo)
              Text(
                'เงื่อนไข กลุ่ม: คดีอาญา คดีจราจร หมายจับ',
                style: TextStyles.bodyBold.copyWith(color: Colors.black),
              ),
            if(_viewModel.scope.showInputFullcaseNo)
              _getListItem('เลขที่คดี', AppConstant.showFormCrimeCaseNo),
            if(_viewModel.scope.showInputFullcaseNo)
              _getListItem('เลขท่ีปีคดี', AppConstant.showFormCrimeCaseYear),
            if(_viewModel.scope.showInputFullcaseNo)
              _getListItem('หน่วยงาน', AppConstant.showFormOrgCode),

            SizedBox(height: 32.h,),
          ],
        ),
      ),
    ),
  );

  void _selectItem(String value) {
    setState(() {
      _viewModel.selectItem(value);
    });
  }

  Widget _getListItem(String title, String value) {
    bool checked =  _viewModel.favoriteDto.choices!=null && _viewModel.favoriteDto.choices!.contains(value);

    if(checked){
      return Column(
        children: [
          SizedBox(height: 15.h,),
          Material(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: (){
                _selectItem(value);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.grey_line,
                    style: BorderStyle.solid,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      child: Image.asset(AppImage.ic_radio_check, fit: BoxFit.contain, width: 20.w),
                    ),
                    Expanded(
                      child: Text(
                        '${title}',
                        style: TextStyles.bodySemi.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }else {
      return Column(
        children: [
          SizedBox(height: 15.h,),
          Material(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: (){
                _selectItem(value);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.grey_line,
                    style: BorderStyle.solid,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      child: Image.asset(AppImage.ic_radio, fit: BoxFit.contain, width: 20.w),
                    ),
                    Expanded(
                      child: Text(
                        '${title}',
                        style: TextStyles.bodySemi.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildButtons() => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
      boxShadow: [
        BoxShadow(
            color: AppColor.grey_btn_text,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0.0, -2.0)// changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.all(24.w),
      child: Row(
        children: [
          Expanded(
            child: PrimaryCustomButton(
              'ถัดไป',
              onPressed: () =>  _openFavoriteDB(),
              isEnabled: _viewModel.isEnableButton,
            ),
          ),
        ],
      ),
    ),
  );

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