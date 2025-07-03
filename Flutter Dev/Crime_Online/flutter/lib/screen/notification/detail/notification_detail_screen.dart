import 'dart:math';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/noti.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/notification/detail/notification_detail_screen_view_model.dart';
import 'package:crimes/screen/notification/list/notification_list_screen_view_model.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationDetailScreenParam extends NavigationParameter {
  NotificationDetailScreenParam(this.notifyDto, this.userDto);

  final NotifyDto notifyDto;
  final UserDto userDto;
}

class NotificationDetailScreen extends StatefulWidget {
  NotificationDetailScreen(this.param, {Key? key}) : super(key: key);

  final NotificationDetailScreenParam param;

  @override
  _NotificationDetailScreenState createState() => _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  NotificationDetailScreenViewModel _viewModel = NotificationDetailScreenViewModel();

  @override
  void initState() {
    _viewModel.notifyDto = widget.param.notifyDto;
    _viewModel.userDto = widget.param.userDto;
    _updateRead();
    StringUtils.log('type: ${_viewModel.notifyDto.type}');
    StringUtils.log('url: ${_viewModel.notifyDto.url}');
    super.initState();
  }

  Future<void> _updateRead() async {
    await _viewModel.updateRead();
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
                    ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto));
                  }
              ),
            )
        )
    );
  }

  Future<void> _openAuthUrl() async {
    if(_viewModel.notifyDto.url == null && _viewModel.notifyDto.url!.isNotEmpty) return;

    Uri uri = Uri.parse(_viewModel.notifyDto.url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
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
        _buildAppBar('การแจ้งเตือน'),
        _buildContent(),
        if(_viewModel.notifyDto.type == 'AUTH')
          _buildAuthButton()
      ],
    ),
  );

  Widget _buildContent() => Expanded(
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                      "${_viewModel.notifyDto.title}",
                      style: TextStyles.titleBold.copyWith(color: Colors.black,),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                ),
                Text(
                  "${_viewModel.notifyDto.readDate}",
                  style: TextStyles.smallSemi.copyWith(color: AppColor.grey_noti,),
                )
              ],
            ),
            Text(
              "${_viewModel.notifyDto.content}",
              style: TextStyles.bodySemi.copyWith(color: AppColor.grey_noti_text,fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildAuthButton() => Container(
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
              'ยืนยันตัวตน',
              onPressed: () =>  _openAuthUrl(),
            ),
          ),
          Expanded(
            child: PrimaryCustomButton(
              'ยกเลิก',
              onPressed: () =>  "",
            ),
          ),
        ],
      ),
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
