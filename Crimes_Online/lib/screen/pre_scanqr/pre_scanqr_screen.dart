import 'package:crimes/config/app_constant.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/pre_scanqr/pre_scanqr_screen_view_model.dart';
import 'package:crimes/screen/scanqr/scanqr_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class PreScanQRScreenParam extends NavigationParameter {
  PreScanQRScreenParam(this.username);

  final String username;
}

class PreScanQRScreen extends StatefulWidget {
  PreScanQRScreen(this.param, {Key? key}) : super(key: key);

  final PreScanQRScreenParam param;

  @override
  _PreScanQRScreenState createState() => _PreScanQRScreenState();
}

class _PreScanQRScreenState extends State<PreScanQRScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PreScanQRScreenViewModel _viewModel = PreScanQRScreenViewModel();

  @override
  void initState() {
    _viewModel.username = widget.param.username;
    _viewModel.getVersionInfo();
    super.initState();
  }

  void _openScanQR() {
    FocusScope.of(context).unfocus();
    ScreenNavigator.navigateTo(Routes.scanQR, param: ScanQRScreenParam(_viewModel.username!, false));
  }

  Future<void> _checkPermission() async{
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;
    StringUtils.log('BEFORE - cameraStatus: ${cameraStatus}');
    StringUtils.log('BEFORE - microphoneStatus: ${microphoneStatus}');

    List<Permission> _permissions = [];
    if(!cameraStatus.isGranted){
      _permissions.add(Permission.camera);
    }
    if(!microphoneStatus.isGranted){
      _permissions.add(Permission.microphone);
    }

    if(_permissions.length > 0){
      if(cameraStatus.isPermanentlyDenied || microphoneStatus.isPermanentlyDenied) {
        _askOpenSetting();
      }else{
        _requestPermission(cameraStatus, microphoneStatus, _permissions);
      }
    }else if(_permissions.length == 0){
      _openScanQR();
    }
  }

  Future<void> _requestPermission(PermissionStatus cameraStatus, PermissionStatus microphoneStatus, List<Permission> _permissions) async{
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if(!cameraStatus.isGranted) {
      cameraStatus = statuses[Permission.camera] as PermissionStatus;
    }
    if(!microphoneStatus.isGranted) {
      microphoneStatus = statuses[Permission.microphone] as PermissionStatus;
    }
    StringUtils.log('_requestPermission - cameraStatus: ${cameraStatus}');
    StringUtils.log('_requestPermission - microphoneStatus: ${microphoneStatus}');

    if(cameraStatus.isPermanentlyDenied || microphoneStatus.isPermanentlyDenied){
      _askOpenSetting();
    }else{
      await _checkPermission();
    }
  }

  void _askOpenSetting() {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: AppMessage.askPermissionCamera,
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

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      body: Observer(
          builder: (_) => StatusAwareContainer(
            _viewModel.status,
            showError: _viewModel.showError,
            idle: _buildLayout(context),
            loading: Container(),
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
              'ถัดไป',
              onPressed: () => _checkPermission(),
            )
          ),
          SizedBox(height: 32.h,),
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

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "ขั้นตอนต่อไปเป็นการลงทะเบียนอุปกรณ์และยืนยันตัวตน",
            textAlign: TextAlign.center,
            style: TextStyles.xTitleBold.copyWith(color: AppColor.yellow_hard)
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "1. เข้าสู่ระบบ CRIMES ผ่าน VPN หรือ SSL VPN\n2. สร้างคำขอใช้งาน CRIMES Online ที่เมนูข้อมูล\nส่วนตัวและทำตามขั้นตอนในหน้าคำขอใช้งาน",
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
        title: _viewModel.errorTitle,
        description: _viewModel.errorMessage,
        buttonText: AppMessage.ok,
        onPress: () => _viewModel.resetStatus(),
      ),
    ),
  );
}
