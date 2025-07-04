import 'dart:convert';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/eula_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
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
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/term/term_screen_view_model.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TermScreenParam extends NavigationParameter {
  TermScreenParam(this.userDto, this.eulaDto);

  final UserDto userDto;
  final EulaDto eulaDto;
}

class TermScreen extends StatefulWidget {
  TermScreen(this.param, {Key? key}) : super(key: key);

  final TermScreenParam param;

  @override
  _TermScreenState createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TermScreenViewModel _viewModel = TermScreenViewModel();
  WebViewController _controller = WebViewController();

  @override
  void initState() {
    _viewModel.userDto = widget.param.userDto;
    _viewModel.eulaDto = widget.param.eulaDto;
    _viewModel.url = _viewModel.eulaDto!.url!;
    _getHtmlContent();
    super.initState();
  }

  Future<void> _acceptTerm() async {
    await _viewModel.acceptTerm();

    if (_viewModel.status == ActionStatus.success) {
      ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto!));
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
  }

  Future<void> _getHtmlContent() async {
    await _viewModel.getHtmlContent();

    if (_viewModel.status == ActionStatus.success && _viewModel.content.isNotEmpty) {
      _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      // _controller.loadHtmlString( Uri.dataFromString(
      //     _viewModel.content,
      //     mimeType: 'text/html',
      //     encoding: Encoding.getByName('utf-8')
      // ).toString());
      _controller.loadHtmlString(_viewModel.content);
    }
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
    child: Column(
      children: <Widget>[
        SizedBox(height: 24.h,),
        _buildAppBar(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: WebViewWidget(
                      controller: _controller,
                      // initialUrl: 'about:blank',
                      // javascriptMode: JavaScriptMode.unrestricted,
                      // onWebViewCreated: (WebViewController webViewController) {
                      //   _controller = webViewController;
                      //   _getHtmlContent();
                      // },
                    ),
                  ), 
                ),
                Container(
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
                    padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColor.blue_text,
                              value: _viewModel.isCheck,
                              onChanged: (value) {
                                _viewModel.isCheck = !_viewModel.isCheck;
                              },
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  splashColor: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  onTap: (){
                                    _viewModel.isCheck = !_viewModel.isCheck;
                                  },
                                  child: Text(
                                    'ยอมรับเงื่อนไขทั้งหมด',
                                    style: TextStyles.bodyBold.copyWith(color: Colors.black),
                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        PrimaryCustomButton(
                          'ถัดไป', 
                          onPressed: () => _acceptTerm(),
                          isEnabled: _viewModel.isCheck,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildAppBar() => Container(
    padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
    child: Center(
      child: Text(
        'ข้อตกลงและเงื่อนไข',
        style: TextStyles.titleBold.copyWith(color: Colors.white),
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
      ScreenNavigator.replaceEntireStackTo(Routes.createPin);
    }else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    }
  }

  Future<bool> _onBack() async {
    bool goBack = false;
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
    if (goBack) await closeApp();
    return goBack;
  }
  
}
