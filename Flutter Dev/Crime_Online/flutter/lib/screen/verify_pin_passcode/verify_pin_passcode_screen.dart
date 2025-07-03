import 'package:crimes/config/app_constant.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
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
import 'package:crimes/screen/term/term_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen_view_model.dart';
import 'package:crimes/screen/verify_pin_passcode/verify_pin_passcode_screen_view_model.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';

class VerifyPinPasscodeScreenParam extends NavigationParameter {
  VerifyPinPasscodeScreenParam(this.fromSessionTimeout);

  final bool fromSessionTimeout;
}

class VerifyPinPasscodeScreen extends StatefulWidget {
  VerifyPinPasscodeScreen(this.param, {Key? key}) : super(key: key);

  final VerifyPinPasscodeScreenParam param;

  @override
  _VerifyPinPasscodeScreenState createState() => _VerifyPinPasscodeScreenState();
}

class _VerifyPinPasscodeScreenState extends State<VerifyPinPasscodeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  VerifyPinPasscodeScreenViewModel _viewModel = VerifyPinPasscodeScreenViewModel();

  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    _viewModel.fromSessionTimeout = widget.param.fromSessionTimeout;
    // _authenBiometrics();
    super.initState();
  }

  // Future<void> _authenBiometrics() async {
  //   await _viewModel.refreshBiometrics();
  //   if(!_viewModel.isEnableBiometrics) return;
  //
  //   await _viewModel.authenBiometrics();
  //   if(_viewModel.status == ActionStatus.success){
  //     if(_viewModel.fromSessionTimeout){
  //       ScreenNavigator.pop();
  //     }else{
  //       await _checkEula();
  //     }
  //   }else if(_viewModel.status == ActionStatus.error){
  //     _handleError();
  //   }
  // }

  Future<void> _select(String number) async{
    await _viewModel.select(number);

    if(_viewModel.status == ActionStatus.success){
      ScreenNavigator.pop(true);
    }else if(_viewModel.status == ActionStatus.error){
      _viewModel.number1 = "";
      _viewModel.number2 = "";
      _viewModel.number3 = "";
      _viewModel.number4 = "";
      _viewModel.number5 = "";
      _viewModel.number6 = "";
      _handleError();
    }
  }

  void _delete(){
    _viewModel.delete();
  }

  Future<bool> _onBack() async{
    return !_viewModel.fromSessionTimeout;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
      key: _scaffoldKey,
      body: Observer(
          builder: (_) => StatusAwareContainer(
            _viewModel.status,
            showError: _viewModel.showError,
            idle: _buildLayout(context),
            error: Stack(children: [
              _buildError(),
            ]),
            onRetry: () => {},
          ))));

  Widget _buildLayout(BuildContext context) => Container(
    decoration: getBg(),
    padding: EdgeInsets.fromLTRB(8.w, 32.h, 8.w, 53.h),
    child: Column(
      children: <Widget>[
        Row(

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
              child: Container(),
            ),
          ],
        ),
        SizedBox(height: 130.h),
        Text(
          'กรอกรหัส PIN',
          textAlign: TextAlign.center,
          style: TextStyles.xTitleBold.copyWith(color: Colors.white),
        ),
        SizedBox(height: 6.h),
        Text(
          'เพื่อขอรหัสผ่าน CRIMES Online',
          textAlign: TextAlign.center,
          style: TextStyles.body.copyWith(color: Colors.white),
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinItem(number: _viewModel.number1),
            PinItem(number: _viewModel.number2),
            PinItem(number: _viewModel.number3),
            PinItem(number: _viewModel.number4),
            PinItem(number: _viewModel.number5),
            PinItem(number: _viewModel.number6),
          ],
        ),
        Expanded(child: Container()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: "1",
              onPressed: () => _select("1"),
            ),
            NumberButton(
              number: "2",
              onPressed: () => _select("2"),
            ),
            NumberButton(
              number: "3",
              onPressed: () => _select("3"),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: "4",
              onPressed: () => _select("4"),
            ),
            NumberButton(
              number: "5",
              onPressed: () => _select("5"),
            ),
            NumberButton(
              number: "6",
              onPressed: () => _select("6"),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: "7",
              onPressed: () => _select("7"),
            ),
            NumberButton(
              number: "8",
              onPressed: () => _select("8"),
            ),
            NumberButton(
              number: "9",
              onPressed: () => _select("9"),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if(_viewModel.isEnableBiometrics)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: (){
                    // _authenBiometrics();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/3 - 24.w,
                    height: 50.h,
                    margin: EdgeInsets.all(4.w),
                    child: Center(
                      child: Image.asset(AppImage.ic_fingerprint, width: 35.w,),
                    ),
                  ),
                ),
              ),
            if(!_viewModel.isEnableBiometrics)
              Container(
                width: MediaQuery.of(context).size.width/3 - 24.w,
                height: 50.h,
                margin: EdgeInsets.all(4.w),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyles.xxTitleSemi.copyWith(
                        color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            NumberButton(
              number: "0",
              onPressed: () => _select("0"),
            ),
            NumberButton(
              isDelete: true,
              onPressed: () => _delete(),
            ),
          ],
        ),
        SizedBox(height: 30.h),
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

    // if(_viewModel.openLogin){
    //   ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       image: AppImage.ic_status_pending,
    //       title: AppMessage.titleChangePhone,
    //       message: _viewModel.errorMessage,
    //       confirmButtonText: AppMessage.ok,
    //       onConfirm: () => ScreenNavigator.navigateReplaceTo(Routes.login),
    //     ),
    //     fullscreenDialog: true,
    //   ));
    // }else if(_viewModel.openWaitSMS){
    //   ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       image: AppImage.ic_status_pending,
    //       title: AppMessage.titleWaitSMS,
    //       message: _viewModel.errorMessage,
    //       confirmButtonText: AppMessage.ok,
    //     ),
    //     fullscreenDialog: true,
    //   ));
    // }else if(_viewModel.openWaitAdmin){
    //   ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       image: AppImage.ic_status_pending,
    //       title: AppMessage.titleWaitAdmin,
    //       message: _viewModel.errorMessage,
    //       confirmButtonText: AppMessage.ok,
    //     ),
    //     fullscreenDialog: true,
    //   ));
    // }else if(_viewModel.openRegisterPin){
    //   ScreenNavigator.replaceEntireStackTo(Routes.createPin, param: CreatePinScreenParam(false));
    // }else if(_viewModel.openRegisterBiometrics){
    //   ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    // }/*else if(_viewModel.openVerifyPinPasscode){
    //
    // }*/
  }
}
