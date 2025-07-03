import 'package:crimes/config/app_constant.dart';
import 'package:crimes/main.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/status/status_screen_view_model.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/material.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusScreen extends StatefulWidget {
  final String? title;
  final String? image;
  final String? message;
  final String? confirmButtonText;
  final VoidCallback? onConfirm;

  StatusScreen({
    this.image = AppImage.ic_status_success,
    this.title,
    this.message,
    this.confirmButtonText,
    this.onConfirm,
  });

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StatusScreenViewModel _viewModel = StatusScreenViewModel();

 @override
  void initState() {
    _viewModel.image = widget.image;
    _viewModel.title = widget.title;
    _viewModel.message = widget.message;
    _viewModel.confirmButtonText = widget.confirmButtonText;
    _viewModel.getVersionInfo();
    super.initState();
  }

  void _onClickOk(){
    if(_viewModel.openLogin){
      ScreenNavigator.navigateReplaceTo(Routes.login);
    }else{
      _refreshStatus();
    }
  }

  Future<void> _refreshStatus() async{
    await _viewModel.checkAuthenticate();

    /*if(_viewModel.status == ActionStatus.success) {

      final isLogin = await KeyUtils.isLogin();
      if(isLogin){
        ScreenNavigator.navigateReplaceTo(Routes.verifyPin);
      }else{
        ScreenNavigator.navigateReplaceTo(Routes.login);
      }
    }else*/ if(_viewModel.status == ActionStatus.error){
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
            idle: _buildLayout(context),
            error: Stack(children: [
              _buildError(),
            ]),
            onRetry: () => {},
          )));

  Widget _buildLayout(BuildContext context) => Container(
      decoration: getBg(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.w),
              child: _buildContent(context),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PrimaryCustomButton(
              'ตกลง',
              onPressed: widget.onConfirm != null
                ? widget.onConfirm!
                : _onClickOk
              ,
            )
          ),
          //SizedBox(height: 30.h,),
          Container(
              padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
              child: SizedBox(
                height: 16,
                child: FittedBox(
                  child: Text("CRIMES Online ver. "+_viewModel.version+"("+_viewModel.buildnumber+")",
                    style: TextStyles.xxSmall.copyWith(color: AppColor.blue_text_light),
                  ),
                ),
              )
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if(_viewModel.image!=null)
            Image.asset(_viewModel.image!),
          SizedBox(
            height: 24.h,
          ),
          Text(
            _viewModel.title ?? "",
            textAlign: TextAlign.center,
            style: TextStyles.xTitleBold.copyWith(color: AppColor.blue_text_light)
          ),
          SizedBox(
            height: 4.h,
          ),
          if(_viewModel.message != null && _viewModel.message != "")
            Text(
              _viewModel.message ?? "",
              textAlign: TextAlign.center,
              style: TextStyles.body.copyWith(color: Colors.white)
            ),
        ],
      ),
    );
  }

  Widget _buildError() => Container(
    color: Colors.black.withAlpha(AppConstant.alphaDialog),
    child: Center(
      child: StatusPopup(
        title: _viewModel.errorTitle != null ? _viewModel.errorTitle : '',
        description: _viewModel.errorMessage != null ? _viewModel.errorMessage : '',
        buttonText: AppMessage.ok,
        onPress: () => closeApp(),
      ),
    ),
  );

  void _handleError(){

    /*if(_viewModel.openLogin){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: "คุณได้ทำการเปลี่ยนเครื่อง\nหากต้องการกลับมาใช้เครื่องนี้\nกรุณาทำการยื่นเรื่องผ่านระบบ CRIMES อีกครั้ง",
          confirmButtonText: "ตกลง",
          onConfirm: () => ScreenNavigator.navigateReplaceTo(Routes.login),
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitSMS){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: "กรุณาทำการยืนยันเบอร์โทรศัพท์ บนหน้าเว็บ CRIMES",
          confirmButtonText: "ตกลง",
          onConfirm: () => _refreshStatus(),
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitAdmin){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: "กรุณารอระบบยืนยัน\nการขอสิทธิ์ของท่านผ่าน SMS",
          confirmButtonText: "ตกลง",
          onConfirm: () => _refreshStatus(),
        ),
        fullscreenDialog: true,
      ));
    }else*/ if(_viewModel.openRegisterPin){
      ScreenNavigator.replaceEntireStackTo(Routes.createPin, param: CreatePinScreenParam(false));
    }else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    }
  }
}
