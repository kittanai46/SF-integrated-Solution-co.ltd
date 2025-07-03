import 'dart:io';

import 'package:camera/camera.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/policestation_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/search/db/search_db_screen.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/screen/search/scanner/scanner_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';


class CameraPageParam extends NavigationParameter {
  CameraPageParam(this.cameras, this.fromMain, this.userDto, this.listPoliceStationDto, this.favorite);

  final List<CameraDescription> cameras;
  final bool fromMain;
  final UserDto? userDto;
  final ListPoliceStationDto? listPoliceStationDto;
  final FavoriteDto? favorite;
}


class CameraPage extends StatefulWidget {
  CameraPage(this.param, {Key? key}) : super(key: key);

  final CameraPageParam param;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  bool _isDetecting = false;
  bool _isFoundText = false;

  // Uint8List? _testImageByte;
  CameraLensDirection _direction = CameraLensDirection.back;
  CameraController? _camera;
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  // final _orientations = {
  //   DeviceOrientation.portraitUp: 0,
  //   DeviceOrientation.landscapeLeft: 90,
  //   DeviceOrientation.portraitDown: 180,
  //   DeviceOrientation.landscapeRight: 270,
  // };

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _clearResource();
    super.dispose();
  }

  void _next(String foundText) {
    foundText = StringUtils.getTextContainIDCardNo(foundText);
    if(widget.param.fromMain){
      // ScreenNavigator.navigateReplaceTo(Routes.searchCriteria, param: SearchCriteriaScreenParam(AppConstant.kSearchPerson, widget.param.userDto, widget.param.listPoliceStationDto, pid: foundText, favoriteDto: widget.param.favorite));

      ParamScope scope = ParamScope();
      scope.setTypeAndUserDto(AppConstant.kSearchPerson, widget.param.userDto!);
      scope.pid = foundText;
      scope.refreshHasInput(AppConstant.kSearchPerson);
      ScreenNavigator.navigateReplaceTo(Routes.searchDB, param: SearchDBScreenParam(AppConstant.kSearchPerson, widget.param.userDto!, scope, favoriteDto:  widget.param.favorite));
    }else{
      ScreenNavigator.pop(foundText);
    }
  }

  Future<void> _clearResource() async {
    if(_camera==null) return;
    await _camera!.dispose();
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
      final recognizedText = await textRecognizer.processImage(inputImage);
      // StringUtils.log("recognizedText: ${recognizedText.text}");
      results = recognizedText.text;
      // if (inputImage.inputImageData?.size != null &&
      //     inputImage.inputImageData?.imageRotation != null) {
      //   for (final textBlock in recognizedText.blocks) {
      //     String text = textBlock.text;
      //     results = '${results} ${text}';
      //   }
      // }


      if(_checkWords(results)){
        String foundText = results;
        if(StringUtils.isContainIDCardNo(foundText)) {
          if(_isFoundText) return;
          _isFoundText = true;
          _next(foundText);
        }else{
          setState(() {
            _isDetecting = false;
          });
        }
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: getBg(),
        child: Column(
          children: [
            _buildAppBar('สแกนเลขบัตรประชาชน'),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  _camera == null
                    ? Container(
                        color: Colors.black,
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height - 150,
                        child: CameraPreview(_camera!)
                      ),
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
      ),
    );
  }

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

//   Widget _buildResults(VisionText scanResults) {
//     // CustomPainter painter;
//     if (scanResults != null) {
//       // final Size imageSize = Size(
//       //   _camera.value.previewSize.height - 100,
//       //   _camera.value.previewSize.width,
//       // );
//       if(_checkWords(scanResults.text)){
// //        painter = TextDetectorPainter(imageSize, scanResults);
// //        return CustomPaint(painter: painter);
//         String foundText = scanResults.text;
//         if(StringUtils.isContainIDCardNo(foundText)){
//           foundText = StringUtils.getTextContainIDCardNo(foundText);
//           Navigator.pop(context, foundText);
//         }
//
//       }
//       return Container();
//
//     } else {
//       return Container();
//     }
//   }

  bool _checkWords(String word) {
    RegExp regExp = new RegExp(r"(\d{1}) (\d{4}) (\d{5}) (\d{2}) (\d{1})", multiLine: false);
    bool hasMatch = false;
    if(regExp.hasMatch(word)){
      hasMatch = true;
    }
    else{
      regExp = new RegExp(r"(\d{1})(\d{4})(\d{5})(\d{2})(\d{1})", multiLine: false);
      if(regExp.hasMatch(word)){
        hasMatch = true;
      }
    }
    StringUtils.log("word: $word , hasMatch: $hasMatch");
    return hasMatch;
  }
}
