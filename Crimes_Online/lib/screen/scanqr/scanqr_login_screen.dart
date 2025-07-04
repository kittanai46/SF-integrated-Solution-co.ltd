import 'dart:io';

import 'package:camera/camera.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/scanqr/scanqr_login_screen_view_model.dart';
import 'package:crimes/screen/search/scanner/scanner_utils.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:scan/scan.dart';
import 'package:crimes/main.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';

import '../../navigator/routes.dart';

class ScanQRLoginScreenParam extends NavigationParameter {
  ScanQRLoginScreenParam(this.username, this.isLogin);

  final String username;
  final bool isLogin;
}

class ScanQRLoginScreen extends StatefulWidget {
  ScanQRLoginScreen(this.param, {Key? key}) : super(key: key);

  final ScanQRLoginScreenParam param;

  @override
  _ScanQRLoginScreenState createState() => _ScanQRLoginScreenState();
}

class _ScanQRLoginScreenState extends State<ScanQRLoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScanQRLoginScreenViewModel _viewModel = ScanQRLoginScreenViewModel();

  bool _isDetecting = false;
  bool _isFoundText = false;

  CameraLensDirection _direction = CameraLensDirection.back;
  CameraController? _camera;
  final BarcodeScanner _barcodeScanner = BarcodeScanner();

  ScanController scanController = ScanController();

  @override
  void initState() {
    _viewModel.username = widget.param.username;
    _handleFcm();
    _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _clearResource();
    super.dispose();
  }

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
        StringUtils.log("=======>>_viewModel.showError ${_viewModel.showError}");
        if(_viewModel.showError) {
          showDialog(
              context: context,
              builder: (context) =>
                  Scaffold(
                      backgroundColor: Colors.black.withAlpha(
                          AppConstant.alphaDialog),
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
                              //scanController.resume();
                            }
                        ),
                      )
                  )
          );
        }else {
          handleError();
        }
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

  Future<void> _clearResource() async {
    if(_camera==null) return;
    await _camera!.dispose();
    _barcodeScanner.close();
  }

  Future<void> _initializeCamera() async {
    final CameraDescription description = await ScannerUtils.getCamera(
        _direction);

    // _camera = CameraController(
    //   description,
    //   Platform.isIOS ? ResolutionPreset.max:ResolutionPreset.high,
    //   enableAudio: false,
    //   imageFormatGroup: Platform.isAndroid
    //       ? ImageFormatGroup.nv21
    //       : ImageFormatGroup.bgra8888,
    // );

    _camera = CameraController(
      description,
      _getResolutionPreset(description),
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );

    if(_camera==null) return;

    await _camera!.initialize();

    _camera!.startImageStream((CameraImage image) async{
      if (_isDetecting) {
        // StringUtils.log("_isDetecting");
        return;
      }

      setState(() {
        _isDetecting = true;
      });

      if (Platform.isIOS) {
        await Future.delayed(Duration(milliseconds: 100));
      }

      // get image rotation
      // it is used in android to convert the InputImage from Dart to Java
      // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C
      // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas
      // final camera = _cameras[_cameraIndex];
      final sensorOrientation = _camera!.description.sensorOrientation;
      InputImageRotation? rotation;
      if (Platform.isIOS) {
        rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
      } else if (Platform.isAndroid) {
        var rotationCompensation = 0; //_orientations[_controller!.value.deviceOrientation];
        // if (rotationCompensation == null) return null;
        if (_camera!.description.lensDirection == CameraLensDirection.front) {
          // front-facing
          rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
        } else {
          // back-facing
          rotationCompensation = (sensorOrientation - rotationCompensation + 360) % 360;
        }
        rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
        // StringUtils.log('rotationCompensation: $rotationCompensation');
      }
      if (rotation == null) {
        // StringUtils.log("rotation == null");
        setState(() {
          _isDetecting = false;
        });
        return null;
      }
      // StringUtils.log('rotation: $rotation');

      // get image format
      final format = InputImageFormatValue.fromRawValue(image.format.raw);
      // StringUtils.log('format: $format');

      // validate format depending on platform
      // only supported formats:
      // * nv21 for Android
      // * bgra8888 for iOS
      if (format == null) {
        // StringUtils.log("format == null");
        setState(() {
          _isDetecting = false;
        });
        return null;
      }
      if (Platform.isAndroid && format != InputImageFormat.nv21) {
        // StringUtils.log("Platform.isAndroid && format != InputImageFormat.nv21");
        setState(() {
          _isDetecting = false;
        });
        return null;
      }
      if (Platform.isIOS && format != InputImageFormat.bgra8888) {
        // StringUtils.log("Platform.isIOS && format != InputImageFormat.bgra8888");
        setState(() {
          _isDetecting = false;
        });
        return null;
      }

      // since format is constraint to nv21 or bgra8888, both only have one plane
      if (image.planes.length != 1) {
        // StringUtils.log("image.planes.length != 1");
        setState(() {
          _isDetecting = false;
        });
        return null;
      }
      final plane = image.planes.first;

      final inputImage = InputImage.fromBytes(bytes: plane.bytes, metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),);

      String results = '';
      final barcodes = await _barcodeScanner.processImage(inputImage);
      for(int i=0;i<barcodes.length;i++){
        Barcode barcode = barcodes[i];
        results += barcode.rawValue ?? "";
      }
      StringUtils.log("results: ${results}");
      // results = recognizedText.text;
      // if (inputImage.inputImageData?.size != null &&
      //     inputImage.inputImageData?.imageRotation != null) {
      //   for (final textBlock in recognizedText.blocks) {
      //     String text = textBlock.text;
      //     results = '${results} ${text}';
      //   }
      // }

      if(results!=''){
        String foundText = results;
        if(_isFoundText) return;
        _isFoundText = true;
        _requestLoginScanQR(foundText);
      }else{
        setState(() {
          _isDetecting = false;
        });
      }
    });
  }

  ResolutionPreset _getResolutionPreset(CameraDescription description) {
    if (Platform.isIOS) {
      // ตรวจสอบชื่อกล้องและเลือก ResolutionPreset ที่เหมาะสม
      if (description.name.contains("iPhone 6s") ||
          description.name.contains("iPhone 7")) {
        return ResolutionPreset.high; // iPhone รุ่นเก่าใช้ High
      } else {
        return ResolutionPreset.ultraHigh; // รุ่นใหม่ใช้ ultraHigh
      }
    } else if (Platform.isAndroid) {
      return ResolutionPreset.max; // Android ใช้ Max
    }
    return ResolutionPreset.medium; // Default สำหรับแพลตฟอร์มอื่น
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
              if(_camera == null)
                Container(color: Colors.black),

              if(_camera != null)
                Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: CameraPreview(_camera!)
                ),
              if(_camera != null)
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    color: Colors.green.shade400,
                    width: double.infinity,
                    height: 2.h,
                  ),
                )
              // if(_testImageByte != null)
              //   Image.memory(
              //     _testImageByte!,
              //     height: 200.h,
              //   ),
              // _buildResults(_textScanResults),

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

  void handleError(){

    if(_viewModel.openLogin){
      ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: "คุณได้ทำการเปลี่ยนเครื่อง\nหากต้องการกลับมาใช้เครื่องนี้\nกรุณาทำการยื่นเรื่องผ่านระบบ CRIMES อีกครั้ง",
          confirmButtonText: AppMessage.ok,
          onConfirm: () => ScreenNavigator.navigateReplaceTo(Routes.login),
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitSMS){
      ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: "กรุณาทำการยืนยันเบอร์โทรศัพท์ บนหน้าเว็บ CRIMES",
          confirmButtonText: AppMessage.ok,
          onConfirm: () => closeApp(),
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitAdmin){
      ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: "กรุณารอระบบยืนยัน\nการขอสิทธิ์ของท่านผ่าน SMS",
          confirmButtonText: AppMessage.ok,
          onConfirm: () => closeApp(),
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openRegisterPin){
      ScreenNavigator.navigateReplaceTo(Routes.createPin, param: CreatePinScreenParam(false));
    }else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.navigateReplaceTo(Routes.registerBiometrics);
    // }else if(_viewModel.openGPSDisabled){
    //    _showDialogGPSRequired();
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
                      ScreenNavigator.pop();
                      ScreenNavigator.navigateTo(Routes.verifyPin, param: VerifyPinScreenParam(true));
                    }
                ),
              )
          )
      );
    }
  }
}
