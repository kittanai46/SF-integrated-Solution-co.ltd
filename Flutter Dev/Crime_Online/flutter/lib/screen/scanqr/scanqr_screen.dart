import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/search/scanner/scanner_utils.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/scanqr/scanqr_screen_view_model.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan/scan.dart';
// import 'package:crimes/main.dart';
// import 'package:crimes/screen/verify_pin/verify_pin_passcode_screen.dart';
// import 'package:crimes/screen/create_pin/create_pin_screen.dart';

import '../../navigator/routes.dart';

class ScanQRScreenParam extends NavigationParameter {
  ScanQRScreenParam(this.username, this.isLogin);

  final String username;
  final bool isLogin;
}

class ScanQRScreen extends StatefulWidget {
  ScanQRScreen(this.param, {Key? key}) : super(key: key);

  final ScanQRScreenParam param;

  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScanQRScreenViewModel _viewModel = ScanQRScreenViewModel();

  // bool _isDetecting = false;
  // bool _isFoundText = false;
  //
  // CameraLensDirection _direction = CameraLensDirection.back;
  // CameraController? _camera;
  // BarcodeScanner barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  ScanController scanController = ScanController();

  @override
  void initState() {
    _viewModel.username = widget.param.username;
    _handleFcm();
    // _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    // _clearResource();
    super.dispose();
  }

  // Future<void> _clearResource() async {
  //   if(_camera==null) return;
  //   await _camera!.dispose();
  // }

  // Future<void> _initializeCamera() async {
  //   final CameraDescription description = await ScannerUtils.getCamera(
  //       _direction);
  //
  //   if (Platform.isIOS) {
  //     _camera = CameraController(
  //       description,
  //       ResolutionPreset.medium,
  //     );
  //   }else {
  //     _camera = CameraController(
  //       description,
  //       ResolutionPreset.high,
  //     );
  //   }
  //   if(_camera==null) return;
  //
  //   await _camera!.initialize();
  //
  //   _camera!.startImageStream((CameraImage image) async{
  //     if (_isDetecting) return;
  //
  //     setState(() {
  //       _isDetecting = true;
  //     });
  //
  //     if (Platform.isIOS) {
  //       await Future.delayed(Duration(milliseconds: 100));
  //     }
  //
  //     final WriteBuffer allBytes = WriteBuffer();
  //     for (Plane plane in image.planes) {
  //       allBytes.putUint8List(plane.bytes);
  //     }
  //     final bytes = allBytes.done().buffer.asUint8List();
  //
  //     final Size imageSize =
  //     Size(image.width.toDouble(), image.height.toDouble());
  //
  //     final imageRotation =
  //         InputImageRotationMethods.fromRawValue(description.sensorOrientation) ??
  //             InputImageRotation.Rotation_0deg;
  //
  //     final inputImageFormat =
  //         InputImageFormatMethods.fromRawValue(image.format.raw) ??
  //             InputImageFormat.NV21;
  //
  //     final planeData = image.planes.map(
  //           (Plane plane) {
  //         return InputImagePlaneMetadata(
  //           bytesPerRow: plane.bytesPerRow,
  //           height: plane.height,
  //           width: plane.width,
  //         );
  //       },
  //     ).toList();
  //
  //     final inputImageData = InputImageData(
  //       size: imageSize,
  //       imageRotation: imageRotation,
  //       inputImageFormat: inputImageFormat,
  //       planeData: planeData,
  //     );
  //
  //     final inputImage = InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
  //
  //     String results = '';
  //     final barcodes = await barcodeScanner.processImage(inputImage);
  //     for (final Barcode barcode in barcodes) {
  //       String text = '${barcode.value.displayValue}';
  //       // results = '${results} ${text}';
  //       if(results.isEmpty) results = text;  // Find first value only
  //     }
  //
  //     String foundText = results;
  //     if(foundText.isNotEmpty && foundText.startsWith("CRIMES_")) {
  //       if(_isFoundText) return;
  //       _isFoundText = true;
  //       _requestLoginScanQR(foundText);
  //     }else{
  //       setState(() {
  //         _isDetecting = false;
  //       });
  //     }
  //   });
  // }

  Future<void> _handleFcm() async{
    String? token = await FirebaseMessaging.instance.getToken();
    if(token!=null) _viewModel.pushToken = token;
  }

  Future<void> _requestLoginScanQR(String? barcode) async{
    StringUtils.log('barcode: ${barcode}');
    if(barcode==null || barcode.isEmpty || barcode=='-1') {
      scanController.resume();
      return;
    }
    StringUtils.log('isLogin: ${widget.param.isLogin}');
    if(widget.param.isLogin){
      //TODO: call service mx4.authen
      await _viewModel.requestLoginScanQRCRIMES(barcode);
      StringUtils.log('LoginQR status: ${_viewModel.status}');
      StringUtils.log('LoginQR successMessage: ${_viewModel.successMessage}');
      StringUtils.log('LoginQR errorMessage: ${_viewModel.errorMessage}');
      String titleMsg = "แจ้งเตือนระบบ";
      if (_viewModel.status == ActionStatus.success) {
        showDialog(
            context: context,
            builder: (context) => Scaffold(
                backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
                body: Center(
                  child: StatusPopup(
                      title: titleMsg,
                      description: _viewModel.successMessage,
                      // cancelText: AppMessage.cancel,
                      // onCancel: () {
                      //   Navigator.of(context).pop();
                      // },
                      buttonText: AppMessage.ok,
                      onPress: () {
                        Navigator.of(context).pop();
                        ScreenNavigator.pop();
                      }
                  ),
                )
            )
        );
      }else if(_viewModel.status == ActionStatus.error) {
        showDialog(
            context: context,
            builder: (context) => Scaffold(
                backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
                body: Center(
                  child: StatusPopup(
                      title: titleMsg,
                      description: _viewModel.errorMessage,
                      // cancelText: AppMessage.cancel,
                      // onCancel: () {
                      //   Navigator.of(context).pop();
                      // },
                      buttonText: AppMessage.ok,
                      onPress: () {
                        Navigator.of(context).pop();
                        ScreenNavigator.pop();
                      }
                  ),
                )
            )
        );
      }

    }else{
      await _viewModel.requestLoginScanQR(barcode);
      if (_viewModel.status == ActionStatus.success) {
        ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
          builder: (context) => StatusScreen(
            image: AppImage.ic_status_success,
            title: _viewModel.successMessage,
            confirmButtonText: AppMessage.ok,
          ),
          fullscreenDialog: true,
        ));
      }else if(_viewModel.status == ActionStatus.error){
        showDialog(
            context: context,
            builder: (context) => Scaffold(
                backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
                body: Center(
                  child: StatusPopup(
                      title: _viewModel.errorTitle,
                      description: _viewModel.errorMessage,
                      buttonText: AppMessage.ok,
                      onPress: () {
                        if(_viewModel.openLogin){
                          Navigator.of(context).pop();
                          ScreenNavigator.pop();
                        }else{
                          scanController.resume();
                        }
                      }
                  ),
                )
            )
        );
      }
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
    decoration: getBg(),
    child: Column(
      children: [
        _buildAppBar('Scan QR Code'),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              // _camera == null
              //     ? Container(
              //         color: Colors.black,
              //       )
              //     :
              Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: ScanView(
                    controller: scanController,
                    scanAreaScale: 1,
                    scanLineColor: Colors.green.shade400,
                    onCapture: (data) {
                      _requestLoginScanQR(data);
                    },
                  ),
                  // child: CameraPreview(_camera!)
              ),
            ],
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
            onTap: (){},//_testFinish(), //_backToHomeScreen(),
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

  // void handleError(){
  //
  //   if(_viewModel.openLogin){
  //     ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
  //       builder: (context) => StatusScreen(
  //         image: AppImage.ic_status_pending,
  //         title: "คุณได้ทำการเปลี่ยนเครื่อง\nหากต้องการกลับมาใช้เครื่องนี้\nกรุณาทำการยื่นเรื่องผ่านระบบ CRIMES อีกครั้ง",
  //         confirmButtonText: AppMessage.ok,
  //         onConfirm: () => ScreenNavigator.navigateReplaceTo(Routes.login),
  //       ),
  //       fullscreenDialog: true,
  //     ));
  //   }else if(_viewModel.openWaitSMS){
  //     ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
  //       builder: (context) => StatusScreen(
  //         image: AppImage.ic_status_pending,
  //         title: "กรุณาทำการยืนยันเบอร์โทรศัพท์ บนหน้าเว็บ CRIMES",
  //         confirmButtonText: AppMessage.ok,
  //         onConfirm: () => closeApp(),
  //       ),
  //       fullscreenDialog: true,
  //     ));
  //   }else if(_viewModel.openWaitAdmin){
  //     ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
  //       builder: (context) => StatusScreen(
  //         image: AppImage.ic_status_pending,
  //         title: "กรุณารอระบบยืนยัน\nการขอสิทธิ์ของท่านผ่าน SMS",
  //         confirmButtonText: AppMessage.ok,
  //         onConfirm: () => closeApp(),
  //       ),
  //       fullscreenDialog: true,
  //     ));
  //   }else if(_viewModel.openRegisterPin){
  //     ScreenNavigator.navigateReplaceTo(Routes.createPin, param: CreatePinScreenParam(false));
  //   }else if(_viewModel.openRegisterBiometrics){
  //     ScreenNavigator.navigateReplaceTo(Routes.registerBiometrics);
  //   // }else if(_viewModel.openGPSDisabled){
  //   //    _showDialogGPSRequired();
  //   }else if(_viewModel.openVerifyPin){
  //     showDialog(
  //         context: context,
  //         builder: (context) => Scaffold(
  //             backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
  //             body: Center(
  //               child: StatusPopup(
  //                   title: AppMessage.error,
  //                   description: _viewModel.errorMessage,
  //                   buttonText: AppMessage.ok,
  //                   onPress: () {
  //                     Navigator.of(context).pop();
  //                     ScreenNavigator.navigateTo(Routes.verifyPin, param: VerifyPinScreenParam(true));
  //                   }
  //               ),
  //             )
  //         )
  //     );
  //   }
  // }
}
