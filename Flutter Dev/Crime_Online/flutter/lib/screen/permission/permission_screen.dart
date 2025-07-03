import 'dart:math';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/notification/detail/notification_detail_screen.dart';
import 'package:crimes/screen/permission/permission_screen_view_model.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PermissionScreenParam extends NavigationParameter {
  PermissionScreenParam(this.userDto);

  final UserDto userDto;
}

class PermissionScreen extends StatefulWidget {
  PermissionScreen(this.param, {Key? key}) : super(key: key);

  final PermissionScreenParam param;

  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PermissionScreenViewModel _viewModel = PermissionScreenViewModel();

  @override
  void initState() {
    _viewModel.roleSearchInternalDto = widget.param.userDto.roleSearchInternal!;
    _viewModel.roleSearchExternalDto = widget.param.userDto.roleSearchExternal!;
    super.initState();
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
          onRetry: () => {},
        ),
      ),
    );
  }

  Widget _buildLayout() => Container(
    decoration: getBg(),
    child: Column(
      children: <Widget>[
        _buildAppBar('รายละเอียดสิทธิ์การใช้งาน'),
        Expanded(
          child: Container(
            color: AppColor.white_bg,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // _buildInnerInfo(),
                  // SizedBox(height: 16.h,),
                  _buildOuterInfo(),
                  SizedBox(height: 32.h,),
                ],
              ),
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

  // Widget _buildInnerInfo() => Container(
  //   color: Colors.white,
  //   padding: EdgeInsets.all(16.w),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "หน่วยงานภายใน",
  //         style: TextStyles.titleBold.copyWith(color: Colors.black,),
  //       ),
  //
  //       // Person
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagPersonSs, AppConstant.msInnerPersonDoAya, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagPersonTc, AppConstant.msInnerPersonDoTraffic, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagPersonWr, AppConstant.msInnerPersonHasAya, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagPersonWr, AppConstant.msInnerPersonHasTraffic, '', '', false),
  //
  //       // Car
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagVehicleCc, AppConstant.msInnerCarAya, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagVehicleTc, AppConstant.msInnerCarTraffic, '', '', false),
  //
  //       // Info
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagCrimecase, AppConstant.msInnerInfoAya, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagPersonSs, AppConstant.msInnerInfoPersonSS, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagTrafficcase, AppConstant.msInnerInfoTraffic, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagPersonTc, AppConstant.msInnerInfoPersonTC, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagVehicleCc, AppConstant.msInnerInfoVehicleCc, '', '', false),
  //       _buildItem(context, _viewModel.roleSearchInternalDto.flagVehicleTc, AppConstant.msInnerInfoVehicleTc, '', '', false),
  //     ],
  //   )
  // );

  Widget _buildOuterInfo() => Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //show expire date
          Text(
            "ใช้งานได้ถึงวันที่ ${StringUtils.convertDateYYYYMMDD(widget.param.userDto.expireDate.toString())}",
            style: TextStyles.titleBold.copyWith(color: Colors.black,),
          ),
          Text(
            //"สามารถต่ออายุการใช้งานได้ก่อน 30 วันที่จะหมดอายุ โดยดำเนินการได้ในหน้าขอสิทธิ์ใช้งาน CRIMES online",
            "เมื่อถึงวันหมดอายุแล้วท่านสามารถต่ออายุ \nโดยการลงทะเบียนด้วย ThaID ใหม่อีกครั้ง",
            style: TextStyles.smallSemi.copyWith(color: AppColor.grey_noti_text,),
          ),
          SizedBox(height: 10.w,),
          Text(
            "หน่วยงานภายนอก",
            style: TextStyles.titleBold.copyWith(color: Colors.black,),
          ),
          // Person
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonDopaLinkage, AppConstant.msOuterPersonLinkage, _viewModel.roleSearchExternalDto.flagPersonDopaLinkageStart, _viewModel.roleSearchExternalDto.flagPersonDopaLinkageEnd, _viewModel.roleSearchExternalDto.flagPersonDopaLinkageLock),
          // _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonDopa, AppConstant.msOuterPersonCivil, _viewModel.roleSearchExternalDto.flagPersonDopaStart, _viewModel.roleSearchExternalDto.flagPersonDopaEnd, _viewModel.roleSearchExternalDto.flagPersonDopaLock),
          // _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonDoe, AppConstant.msOuterPersonForeign, _viewModel.roleSearchExternalDto.flagPersonDoeStart, _viewModel.roleSearchExternalDto.flagPersonDoeEnd, _viewModel.roleSearchExternalDto.flagPersonDoeLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonDlt, AppConstant.msOuterPersonCarLicense, _viewModel.roleSearchExternalDto.flagPersonDltStart, _viewModel.roleSearchExternalDto.flagPersonDltEnd, _viewModel.roleSearchExternalDto.flagPersonDltLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonDlt, AppConstant.msOuterPersonBusLicense, _viewModel.roleSearchExternalDto.flagPersonDltStart, _viewModel.roleSearchExternalDto.flagPersonDltEnd, _viewModel.roleSearchExternalDto.flagPersonDltLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonDlt, AppConstant.msOuterPersonCar, _viewModel.roleSearchExternalDto.flagPersonDltStart, _viewModel.roleSearchExternalDto.flagPersonDltEnd, _viewModel.roleSearchExternalDto.flagPersonDltLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonSso, AppConstant.msOuterPersonSocialEmployee, _viewModel.roleSearchExternalDto.flagPersonSsoStart, _viewModel.roleSearchExternalDto.flagPersonSsoEnd, _viewModel.roleSearchExternalDto.flagPersonSsoLock),
          // _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonNhso, AppConstant.msOuterPersonHealth, _viewModel.roleSearchExternalDto.flagPersonNhsoStart, _viewModel.roleSearchExternalDto.flagPersonNhsoEnd, _viewModel.roleSearchExternalDto.flagPersonNhsoLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonTm, AppConstant.msOuterPersonImmigration, _viewModel.roleSearchExternalDto.flagPersonTmStart, _viewModel.roleSearchExternalDto.flagPersonTmEnd, _viewModel.roleSearchExternalDto.flagPersonTmLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonTm, AppConstant.msOuterPersonForeignHouse, _viewModel.roleSearchExternalDto.flagPersonTmStart, _viewModel.roleSearchExternalDto.flagPersonTmEnd, _viewModel.roleSearchExternalDto.flagPersonTmLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonPtm, AppConstant.msOuterPersonTraffic, _viewModel.roleSearchExternalDto.flagPersonPtmStart, _viewModel.roleSearchExternalDto.flagPersonPtmEnd, _viewModel.roleSearchExternalDto.flagPersonPtmLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonGun, AppConstant.msOuterPersonP4, _viewModel.roleSearchExternalDto.flagPersonGunStart, _viewModel.roleSearchExternalDto.flagPersonGunEnd, _viewModel.roleSearchExternalDto.flagPersonGunLock),
          _buildItem(context, _viewModel.roleSearchExternalDto.flagPersonCorrection, AppConstant.msOuterPersonPrisoner, _viewModel.roleSearchExternalDto.flagPersonCorrectionStart, _viewModel.roleSearchExternalDto.flagPersonCorrectionEnd, _viewModel.roleSearchExternalDto.flagPersonCorrectionLock),
          //_buildItem(context, _viewModel.roleSearchExternalDto.flagPersonWarrantCourt, AppConstant.msOuterPersonWarrantCourt, _viewModel.roleSearchExternalDto.flagPersonWarrantCourtStart, _viewModel.roleSearchExternalDto.flagPersonWarrantCourtEnd, _viewModel.roleSearchExternalDto.flagPersonWarrantCourtLock),
          // Car
          // _buildItem(context, _viewModel.roleSearchExternalDto.flagVerhicleDlt, AppConstant.msOuterCarCar, '', '', false),
          // _buildItem(context, _viewModel.roleSearchExternalDto.flagVerhiclePtm, AppConstant.msOuterCarTraffic, '', '', false),

          SizedBox(height: 20.w,),
          Text(
                "หมายเหตุ: กรณีสิทธิสืบค้นหน่วยงานภายนอกหมดอายุ \n                 กรุณาต่ออายุได้ที่ระบบ CRIMES",
                style: TextStyles.smallSemi.copyWith(color: AppColor.grey_noti_text,),
          )
        ],

      )
  );



  Widget _buildItem(BuildContext context, bool? hasFlag, String title, String? dateStart, String? dateEnd, bool? isLock) => Container(
    padding: EdgeInsets.only(top: 16.h),
    width: MediaQuery.of(context).size.width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "${title}",
                  style: TextStyles.smallSemi.copyWith(color: AppColor.grey_noti_text,),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(width: 10.w,),
              if(hasFlag!=null && hasFlag && dateStart!='' && dateEnd!='' && isLock!=null && !isLock)
                Expanded(
                  child: Text(
                    // "${dateStart} - ${dateEnd}",
                    "${dateEnd}",
                    style: TextStyles.smallSemi.copyWith(color: Colors.black,),
                    textAlign: TextAlign.right,
                  ),
                ),
              if(hasFlag!=null && hasFlag && dateStart!='' && dateEnd!='' && isLock!=null && isLock)
                Expanded(
                  child: Text(
                    // "${dateStart} - ${dateEnd}",
                    "${dateEnd}",
                    style: TextStyles.smallSemi.copyWith(color: AppColor.grey_permission_lock,),
                    textAlign: TextAlign.right,
                  ),
                ),
              if(hasFlag!=null && !hasFlag)
                Expanded(
                  child: Text(
                    //"-",
                    "${dateEnd}",
                    style: TextStyles.smallSemi.copyWith(color: Colors.red,),
                    textAlign: TextAlign.right,
                  ),
                ),
            ],
          ),
        ),
        if(isLock!=null && isLock)
          SizedBox(width: 10.w,),
        if(isLock!=null && isLock)
          Image.asset(AppImage.ic_lock_grey, fit: BoxFit.contain, width: 13.w, color: AppColor.grey_permission_lock),
      ],
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
