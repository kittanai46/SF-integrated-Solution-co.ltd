import 'package:crimes/config/app_constant.dart';
import 'package:crimes/main.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen_view_model.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/term/term_screen.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreatePinScreenParam extends NavigationParameter {
  CreatePinScreenParam(this.isChangePin);

  final bool isChangePin;
}

class CreatePinScreen extends StatefulWidget {
  CreatePinScreen(this.param, {Key? key}) : super(key: key);

  final CreatePinScreenParam param;

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CreatePinScreenViewModel _viewModel = CreatePinScreenViewModel();

  @override
  void initState() {
    _viewModel.isChangePin = widget.param.isChangePin;
    _viewModel.resetTitle();
    _viewModel.getVersionInfo();
    super.initState();
  }

  Future<void> _select(String number) async{
    await _viewModel.select(number);

    if(_viewModel.status == ActionStatus.success){

      if(!_viewModel.isChangePin){
        // TODO: Check device has biometric or not?
        final hasBiometrics = await _viewModel.checkBiometricsAvailable();
        if(hasBiometrics) {
          ScreenNavigator.navigateReplaceTo(Routes.registerBiometrics);
        }else {
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
        }
      }else{
        ScreenNavigator.pop('success');
      }
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
  }

  _delete(){
    _viewModel.delete();
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
              content: _viewModel.isChangePin ? Stack(children: [
                _buildSuccess(),
              ]) : Container(),
              error: Stack(children: [
                _buildError(),
              ]),
              onRetry: () => {},
            )))
  );

  Widget _buildLayout(BuildContext context) => Container(
    decoration: getBg(),
    child: Column(
      children: <Widget>[
        if(!_viewModel.isChangePin)
          SizedBox(height: 130.h),
        if(_viewModel.isChangePin)
          Container(
            padding: EdgeInsets.fromLTRB(8.w, 32.h, 8.w, 53.h),
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
                  child: Container(),
                ),
              ],
            ),
          ),
        Text(
          _viewModel.title,
          textAlign: TextAlign.center,
          style: TextStyles.xTitleBold.copyWith(color: Colors.white),
        ),
        SizedBox(height: 6.h),
        Text(
          'เพื่อเข้าใช้งาน',
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
        Container(
            padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
            child: new SizedBox(
              height: 16,
              child: new FittedBox(
                child: new Text("CRIMES Online ver. "+_viewModel.version+"("+_viewModel.buildnumber+")",
                  style: TextStyles.xxSmall.copyWith(color: AppColor.blue_text_light),
                ),
              ),
            )
        ),
        SizedBox(height: 15.h),
      ],
    ),
  );

  Widget _buildSuccess() => Container(
    color: Colors.black.withAlpha(AppConstant.alphaDialog),
    child: StatusPopup(
      title: AppMessage.success,
      description: 'เปลี่ยน PIN สำเร็จ',
      buttonText: AppMessage.ok,
      onPress: () => ScreenNavigator.pop(),
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
    }/*else if(_viewModel.openRegisterPin){
      ScreenNavigator.replaceEntireStackTo(Routes.createPin);
    }*/else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    }
  }

  Future<bool> _onBack() async {
    bool goBack = false;
    if(_viewModel.isChangePin){
      goBack = true;
    }else{
      await showDialog(
        context: context,
        builder: (context) => Scaffold(
          backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
          body: Center(
            child: StatusPopup(
              title: AppMessage.titleExitApp,
              cancelText: AppMessage.cancel,
              onCancel: () {
                Navigator.of(context).pop();
                goBack = false;
              },
              buttonText: AppMessage.ok,
              onPress: () {
                Navigator.of(context).pop();
                goBack = true;
              }
            ),
          )
        )
      );
    }
    
    if (goBack) await closeApp();
    return goBack;
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    this.number = "",
    required this.onPressed,
    this.isDelete = false
  });

  final String number;
  final VoidCallback onPressed;
  final bool isDelete;

  @override
  Widget build(BuildContext context) {
    if(!isDelete){
      return Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            onTap: onPressed,
            child: Container(
              width: MediaQuery.of(context).size.width/3 - 24.w,
              height: 50.h,
              margin: EdgeInsets.all(4.w),
              child: Center(
                child: Text(
                  number,
                  style: TextStyles.xxTitleSemi.copyWith(
                      color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        );
    }else {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          onTap: onPressed,
          child: Container(
            width: MediaQuery.of(context).size.width/3 - 24.w,
            height: 50.h,
            margin: EdgeInsets.all(4.w),
            child: Center(
              child: Image.asset(AppImage.ic_delete_pin, width: 35.w,),
            ),
          ),
        )
      );
    }
  }
}

class PinItem extends StatelessWidget {
  const PinItem({
    this.number = "",
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    double size = 14.w;

    if (number.isNotEmpty) {
      return Container(
        padding: EdgeInsets.all(8.w),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColor.yellow_hard,
            shape: BoxShape.circle,
          ),
        ),
      );
    }else {
      return Container(
        padding: EdgeInsets.all(8.w),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColor.grey_line,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

  }
}
