import 'package:crimes/config/app_constant.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/register_biometrics/register_biometrics_screen_view_model.dart';
import 'package:crimes/screen/term/term_screen.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBiometricsScreen extends StatefulWidget {
  RegisterBiometricsScreen({Key? key}) : super(key: key);

  @override
  _RegisterBiometricsScreenState createState() => _RegisterBiometricsScreenState();
}

class _RegisterBiometricsScreenState extends State<RegisterBiometricsScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RegisterBiometricsScreenViewModel _viewModel = RegisterBiometricsScreenViewModel();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _verify() async {
    if (!mounted) return;

    FocusScope.of(context).unfocus();
    await _viewModel.authenticate();

    if (_viewModel.status == ActionStatus.success) {
      await KeyUtils.saveLogin(true);

      bool isNewVersion = false;
      if(_viewModel.eulaDto != null){
        isNewVersion = await KeyUtils.isNewEulaVersion(_viewModel.eulaDto!.version!);
      }
      ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_success,
          title: AppMessage.titleRegisterSuccess,
          message: AppMessage.messageRegisterSuccess,
          confirmButtonText: AppMessage.ok,
          onConfirm: () {
            if(isNewVersion){
              ScreenNavigator.replaceEntireStackTo(Routes.term, param: TermScreenParam(_viewModel.userDto!, _viewModel.eulaDto!));
            }else{
              ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto!));
            }
          },
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
  }

  Future<void> _skip() async {
    if (!mounted) return;

    FocusScope.of(context).unfocus();
    await _viewModel.skipRegisterBiometric();

    bool isNewVersion = false;
    if(_viewModel.eulaDto != null){
      isNewVersion = await KeyUtils.isNewEulaVersion(_viewModel.eulaDto!.version!);
    }
    if (_viewModel.status == ActionStatus.success) {
      await KeyUtils.saveLogin(true);
      ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_success,
          title: AppMessage.titleRegisterSuccess,
          message: AppMessage.messageRegisterSuccess,
          confirmButtonText: AppMessage.ok,
          onConfirm: () {
            if(isNewVersion){
              ScreenNavigator.replaceEntireStackTo(Routes.term, param: TermScreenParam(_viewModel.userDto!, _viewModel.eulaDto!));
            }else{
              ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto!));
            }
          },
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      body: Observer(
          builder: (_) => StatusAwareContainer(
            _viewModel.status,
            showError: _viewModel.showError,
            idle: _buildLayout(),
            error: Stack(children: [
              _buildError(),
            ]),
            onRetry: () => {},
          )));

  Widget _buildLayout() => Container(
    decoration: getBgBiometric(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 120.h),
        Text(
          'เปิดใช้งานระบบสแกนนิ้ว/ใบหน้า',
          textAlign: TextAlign.center,
          style: TextStyles.xTitleBold.copyWith(color: AppColor.yellow_hard),
        ),
        SizedBox(height: 8.h),
        Text(
          'เพื่อเข้าใช้งาน “CRIMES Online” ครั้งต่อไป\nด้วยระบบสแกนนิ้ว/ใบหน้าแทนการใส่ PIN',
          textAlign: TextAlign.center,
          style: TextStyles.body.copyWith(color: Colors.white),
        ),
        Expanded(child: Container()),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: PrimaryCustomButton(
            'เปิดใช้งาน',
            onPressed: () => _verify(),
          ),
        ),
        SizedBox(height: 28.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SecondaryCustomButton(
            'ข้าม',
            onPressed: () => _skip(),
          ),
        ),
        SizedBox(height: 40.h),
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
    }/*else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    }*/
  }
}
