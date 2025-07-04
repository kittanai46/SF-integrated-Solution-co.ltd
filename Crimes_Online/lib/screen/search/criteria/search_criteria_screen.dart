import 'dart:convert';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/dto/profile/policestation_dto.dart';
import 'package:crimes/main.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/search/scanner/custom_text_recognizer.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/search/criteria/search_criteria_screen_view_model.dart';
import 'package:crimes/screen/search/db/search_db_screen.dart';
import 'package:crimes/screen/search/scanner/camera_page.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/custom_text_field.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_search_person_enumkey.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_search_person_widget.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

class SearchCriteriaScreenParam extends NavigationParameter {
  SearchCriteriaScreenParam(this.type, this.userDto, this.listPoliceStationDto,
      {this.pid, this.favoriteDto});

  final String type;
  final UserDto userDto;
  final String? pid;
  final ListPoliceStationDto listPoliceStationDto;
  final FavoriteDto? favoriteDto;
}

class SearchCriteriaScreen extends StatefulWidget {
  SearchCriteriaScreen(this.param, {Key? key}) : super(key: key);

  final SearchCriteriaScreenParam param;

  @override
  _SearchCriteriaScreenState createState() => _SearchCriteriaScreenState();
}

class _SearchCriteriaScreenState extends State<SearchCriteriaScreen>
    with AfterLayoutMixin<SearchCriteriaScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SearchCriteriaScreenViewModel _viewModel = SearchCriteriaScreenViewModel();

  //for tutorial
  TutorSPerosnEnumKey tutorKeySPerson = new TutorSPerosnEnumKey();
  TutorSPersonWidget? tutorSPersonWidget;
  ScrollController _scrollController = ScrollController();
  //bool showTutorialPerson = false;
  bool isNeedStoragePermission = false;

  @override
  void initState() {
    _viewModel.userDto = widget.param.userDto;
    _viewModel.setType(widget.param.type);

    if (!AppConstant.isMockUser) {
      _viewModel.setPoliceStationList(widget.param.listPoliceStationDto);
    } else {
      _tcIdCard.text = "1234567890123";
      _viewModel.setPid("1234567890123");
    }

    if (widget.param.favoriteDto != null) {
      _viewModel.favoriteDto = widget.param.favoriteDto!;
    } else {
      _viewModel.favoriteDto.choices = [];
      _viewModel.favoriteDto.innerDbs = [];
      _viewModel.favoriteDto.outerDbs = [];
    }

    final pid = widget.param.pid;
    if (pid != null && pid.isNotEmpty) {
      _tcIdCard.text = pid;
      _viewModel.setPid(pid);
    }

    _checkSetDefaultData();

    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    //init tutorial
    _initTutorial();
  }

  @override
  void deactivate() {
    tutorSPersonWidget?.close();
    super.deactivate();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getPositions(_key) {
    final RenderBox renderBoxRed = _key.currentContext.findRenderObject();
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    return positionRed;
  }

  Future<void> _initTutorial() async {
    if (widget.param.type == AppConstant.kSearchPerson &&
        widget.param.favoriteDto == null) {
      bool isRead = await TutorUtils.getTutorSPersonIsRead();
      if (!isRead) {
        tutorSPersonWidget = TutorSPersonWidget(
            mKey: tutorKeySPerson,
            mContext: context,
            onNextTarget: (target) {
              if (target.identify == 'Target 1') {
                final Offset position =
                    _getPositions(tutorKeySPerson.keyPersonParams2);
                _scrollController.animateTo(position.dy,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.linear);
              } else if (target.identify == 'Target 2') {
                _getPositions(tutorKeySPerson.keyPersonParams3);
              }
            },
            onFinish: () {
              _scrollController.animateTo(0,
                  duration: Duration(milliseconds: 100), curve: Curves.linear);
            },
            onSkip: () {
              _scrollController.animateTo(0,
                  duration: Duration(milliseconds: 100), curve: Curves.linear);
            });
        Future.delayed(Duration(milliseconds: 500), () {
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 100), curve: Curves.linear);
          if (tutorSPersonWidget != null)
            tutorSPersonWidget!.showTutorial(context);
        });
      }
    }
  }

  void _checkSetDefaultData() {
    if (AppConstant.isMockUser) return;

    // TODO: Handle set default police station
    if (_viewModel.listPoliceStationID.length == 1) {
      _tcOrgCode.text = _viewModel.listPoliceStationName[0];
      _viewModel.setOrgCode(_viewModel.listPoliceStationID[0]);
    }
  }

  // void _back() {
  //   if(WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
  //     FocusScope.of(context).unfocus();
  //   }else {
  //     ScreenNavigator.pop();
  //   }
  // }

  Future<void> _openCamera() async {
    FocusScope.of(context).unfocus();
    final result = await ScreenNavigator.navigateTo(Routes.camera,
        param: CameraPageParam(
            cameras, false, UserDto(), ListPoliceStationDto(), FavoriteDto()));
    // final result = await Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return CameraPage(cameras, false, null, null, null);
    // }));
    _showResult(result);
  }

  Future<void> _checkPermissionCamera() async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;
    StringUtils.log('_checkPermissionCamera - cameraStatus: ${cameraStatus}');
    StringUtils.log(
        '_checkPermissionCamera - microphoneStatus: ${microphoneStatus}');

    List<Permission> _permissions = [];
    if (!cameraStatus.isGranted) {
      _permissions.add(Permission.camera);
    }
    if (!microphoneStatus.isGranted) {
      _permissions.add(Permission.microphone);
    }

    if (_permissions.length > 0) {
      if (cameraStatus.isPermanentlyDenied ||
          microphoneStatus.isPermanentlyDenied) {
        _askOpenSettingCamera();
      } else {
        _requestPermissionCamera(cameraStatus, microphoneStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      _openCamera();
    }
  }

  Future<void> _requestPermissionCamera(PermissionStatus cameraStatus,
      PermissionStatus microphoneStatus, List<Permission> _permissions) async {
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if (!cameraStatus.isGranted) {
      cameraStatus = statuses[Permission.camera] as PermissionStatus;
    }
    if (!microphoneStatus.isGranted) {
      microphoneStatus = statuses[Permission.microphone] as PermissionStatus;
    }
    StringUtils.log('_requestPermissionCamera - cameraStatus: ${cameraStatus}');
    StringUtils.log(
        '_requestPermissionCamera - microphoneStatus: ${microphoneStatus}');

    if (cameraStatus.isPermanentlyDenied ||
        microphoneStatus.isPermanentlyDenied) {
      _askOpenSettingCamera();
    } else {
      await _checkPermissionCamera();
    }
  }

  void _askOpenSettingCamera() {
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
                  }),
            )));
  }

  Future<void> _openGallery() async {
    FocusScope.of(context).unfocus();
    //final PickedFile? awaitImage = await ImagePicker().getImage(source: ImageSource.gallery);
    final XFile? awaitImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (awaitImage == null) return;

    String path = awaitImage.path;
    StringUtils.log("path: ${path}");

    //File file;
    File file = await FlutterExifRotation.rotateImage(path: path);
    await _compressAndGetFile(file);
    // File newFile = await _compressAndGetFile(file);
    // FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(newFile);
    // CustomTextRecognizer customTextRecognizer = CustomFirebaseVision.instance.textRecognizer(false);
    // TextDetector textDetector = GoogleMlKit.vision.textDetector();
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path + "/temp.jpg";
    // Map<String, dynamic> maps = {
    //   'path': targetPath
    // };

    final inputImage = InputImage.fromFilePath(targetPath);

    String results = '';
    final recognizedText = await textRecognizer.processImage(inputImage);
    StringUtils.log("recognizedText: ${recognizedText.text}");
    results = recognizedText.text;
    // if (inputImage.inputImageData?.size != null &&
    //     inputImage.inputImageData?.imageRotation != null) {
    // for (final textBlock in recognizedText.blocks) {
    //   String text = textBlock.text;
    //   results = '${results} ${text}';
    // }
    // }
    StringUtils.log('results: ${results}');

    // String? resultText = await customTextRecognizer.processImage(maps);
    // StringUtils.log("resultText: ${resultText}");
    // customTextRecognizer.close();

    if (_checkWords(results)) {
      String foundText = StringUtils.getTextContainIDCardNo(results);
      _showResult(foundText);
    } else {
      Fluttertoast.showToast(
          msg: "ไม่พบหมายเลขบัตรประชาชน",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }
  }

  Future<void> checkAndroid() async {
    if (!Platform.isAndroid) return;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      /// use [Permissions.storage.status]
      isNeedStoragePermission = true;
    }
  }

  Future<void> _checkPermissionGallery() async {
    await checkAndroid();
    PermissionStatus photoStatus = await (isNeedStoragePermission
        ? Permission.storage.status
        : Permission.photos.status);
    StringUtils.log('_checkPermissionGallery - photoStatus: ${photoStatus}');

    List<Permission> _permissions = [];
    if (!photoStatus.isGranted) {
      _permissions.add(
          isNeedStoragePermission ? Permission.storage : Permission.photos);
    }

    if (_permissions.length > 0) {
      if (photoStatus.isPermanentlyDenied) {
        _askOpenSettingGallery();
      } else {
        _requestPermissionGallery(photoStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      _openGallery();
    }
  }

  Future<void> _requestPermissionGallery(
      PermissionStatus photoStatus, List<Permission> _permissions) async {
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if (!photoStatus.isGranted) {
      photoStatus = statuses[isNeedStoragePermission
          ? Permission.storage
          : Permission.photos] as PermissionStatus;
    }
    StringUtils.log('_requestPermissionGallery - photoStatus: ${photoStatus}');

    if (photoStatus.isPermanentlyDenied) {
      _askOpenSettingGallery();
    } else {
      await _checkPermissionGallery();
    }
  }

  void _askOpenSettingGallery() {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: AppMessage.askPermissionGallery,
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    openAppSettings();
                  }),
            )));
  }

  bool _checkWords(String word) {
    RegExp regExp = new RegExp(r"(\d{1}) (\d{4}) (\d{5}) (\d{2}) (\d{1})",
        multiLine: false);
    RegExp regExp2 =
        new RegExp(r"(\d{1}) (\d{4}) (\d{5}) (\d{3})", multiLine: false);
    bool hasMatch = false;
    if (regExp.hasMatch(word) || regExp2.hasMatch(word)) {
      hasMatch = true;
    } else {
      regExp =
          new RegExp(r"(\d{1})(\d{4})(\d{5})(\d{2})(\d{1})", multiLine: false);
      regExp2 = new RegExp(r"(\d{1})(\d{4})(\d{5})(\d{3})", multiLine: false);
      if (regExp.hasMatch(word) || regExp2.hasMatch(word)) {
        hasMatch = true;
      }
    }
    StringUtils.log("word: $word , hasMatch: $hasMatch");
    return hasMatch;
  }

  Future<XFile?> _compressAndGetFile(File file) async {
    // StringUtils.log("_compressAndGetFile");
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path + "/temp.jpg";
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 94,
    );
    // final resultLength = await result.length();
    // StringUtils.log("file.lengthSync(): ${file.lengthSync()}");
    // StringUtils.log("result.length: ${resultLength}");
    return result;
  }

  void _showResult(String foundText) {
    if (foundText.isEmpty) {
      return;
    }

    Fluttertoast.showToast(
        msg: "พบหมายเลข: $foundText",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
    foundText = foundText.replaceAll(new RegExp(r' '), '');
    _tcIdCard.text = foundText;
    _viewModel.setPid(foundText);
  }

  Future<void> _checkPermissionCamera2() async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;
    StringUtils.log('_checkPermissionCamera2 - cameraStatus: ${cameraStatus}');
    StringUtils.log(
        '_checkPermissionCamera2 - microphoneStatus: ${microphoneStatus}');

    List<Permission> _permissions = [];
    if (!cameraStatus.isGranted) {
      _permissions.add(Permission.camera);
    }
    if (!microphoneStatus.isGranted) {
      _permissions.add(Permission.microphone);
    }

    if (_permissions.length > 0) {
      if (cameraStatus.isPermanentlyDenied ||
          microphoneStatus.isPermanentlyDenied) {
        _askOpenSettingCamera();
      } else {
        _requestPermissionCamera(cameraStatus, microphoneStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      _captureImageAndProcess();
    }
  }

  // Future<void> _captureImageAndProcess() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedFile != null) {
  //     final bytes = await File(pickedFile.path).readAsBytes();
  //     final base64Image = base64Encode(bytes);
  //
  //     setState(() {
  //       _viewModel.setBase64Image(base64Image);
  //     });
  //
  //     Fluttertoast.showToast(msg: "ถ่ายภาพเรียบร้อย");
  //   }
  // }

  Future<void> _captureImageAndProcess() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      final base64Image = base64Encode(bytes);

      // คำนวณขนาดของไฟล์เป็น MB
      final fileSizeInMB = bytes.length / (1024 * 1024); // แปลงจาก bytes -> MB

      setState(() {
        _viewModel.setBase64Image(base64Image);
      });

      Fluttertoast.showToast(
        msg: "ถ่ายภาพเรียบร้อย (ขนาด: ${fileSizeInMB.toStringAsFixed(2)} MB)",
      );
    }
  }

  Future<void> _checkPermissionGallery2() async {
    await checkAndroid();
    PermissionStatus photoStatus = await (isNeedStoragePermission
        ? Permission.storage.status
        : Permission.photos.status);
    StringUtils.log('_checkPermissionGallery2 - photoStatus: ${photoStatus}');

    List<Permission> _permissions = [];
    if (!photoStatus.isGranted) {
      _permissions.add(
          isNeedStoragePermission ? Permission.storage : Permission.photos);
    }

    if (_permissions.length > 0) {
      if (photoStatus.isPermanentlyDenied) {
        _askOpenSettingGallery();
      } else {
        _requestPermissionGallery(photoStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      _pickImageFromGallery();
    }
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await File(pickedFile.path).readAsBytes();
      final base64Image = base64Encode(bytes);

      setState(() {
        _viewModel.setBase64Image(base64Image);
      });

      Fluttertoast.showToast(msg: "เลือกรูปภาพเรียบร้อย");
    }
  }

  void _showDialogClearForm() {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: 'ยืนยันละทิ้งข้อมูล?',
                  description: 'ข้อมูลที่คุณกรอกทั้งหมดจะถูกละทิ้ง',
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    _clearForm();
                  }),
            )));
  }

  void _clearForm() {
    _tcIdCard.text = '';
    _viewModel.setPid('');
    _tcFirstName.text = '';
    _viewModel.setFirstName('');
    _tcLastName.text = '';
    _viewModel.setLastName('');
    _tcOrgCode.text = '';
    _viewModel.setOrgCode('');
    _tcCrimeCaseYear.text = '';
    _viewModel.setCrimeCaseYear('');
    _tcCrimeCaseNo.text = '';
    _viewModel.setCrimeCaseNo('');
    _tcPasId.text = '';
    _viewModel.setPasId('');
    _tcNation.text = '';
    _viewModel.setNation('');
    _tcProviceTc.text = '';
    _viewModel.setProviceTc('');
    _tcIntitialNo.text = '';
    _viewModel.setIntitialNo('');
    _tcNumber.text = '';
    _viewModel.setNumber('');
    _tcStatus.text = '';
    _viewModel.setStatus('');
    _tcEngineNo.text = '';
    _viewModel.setEngineNo('');
    _licensenumber.text = '';
    _viewModel.setLicenseNumber('');
    _tcProviceWr.text = '';
    _viewModel.setProviceWr('');
    _tcTambonWr.text = '';
    _viewModel.setTambonWr('');
    _tcAmphurWr.text = '';
    _viewModel.setAmphurWr('');
    _tcCharge.text = '';
    _viewModel.setCharge('');
    _tcCourt.text = '';
    _viewModel.setCourt('');
    _tcWorkerId.text = '';
    _viewModel.setWorkerId('');
    _tcPltcode1.text = '';
    _viewModel.setPltcode1('');
    _tcPltcode2.text = '';
    _viewModel.setPltcode2('');
    _tcPlate1Vh.text = '';
    _viewModel.setPlate1Vh('');
    _tcPlate2Vh.text = '';
    _viewModel.setPlate2Vh('');
    _tcProvcode.text = '';
    _viewModel.setProvcode('');
    _tcVhtype.text = '';
    _viewModel.setVhtype('');
    _tcNumbody.text = '';
    _viewModel.setNumbody('');
    _tcBrncode.text = '';
    _viewModel.setBrncode('');
    _tcAccno.text = '';
    _viewModel.setAccno('');
    _tcAccbranch.text = '';
    _viewModel.setAccbranch('');
    _tcPassportNo.text = '';
    _viewModel.setPassportNoo('');
    _tcTmrunno.text = '';
    _viewModel.setTmrunno('');
    _tcPlate1Tf.text = '';
    _viewModel.setPlate1Tf('');
    _tcPlate2Tf.text = '';
    _viewModel.setPlate2Tf('');
    _tcPlate3Tf.text = '';
    _viewModel.setPlate3Tf('');
    _tcTicketId.text = '';
    _viewModel.setTicketId('');

    // 🧼 เคลียร์รูปภาพด้วย
    _viewModel.setBase64Image('');

    _gunReg.text = '';
    _viewModel.setGunReg('');

    _checkSetDefaultData();
  }

  void _openSelectDB() {
    ScreenNavigator.navigateTo(Routes.searchDB,
        param: SearchDBScreenParam(
            _viewModel.searchType, _viewModel.userDto!, _viewModel.scope,
            favoriteDto: _viewModel.favoriteDto));
  }

  void _backToHomeScreen() {
    ScreenNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.primaryColor,
      body: Observer(
        builder: (_) => StatusAwareContainer(
          _viewModel.screenStatus,
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
            if (widget.param.favoriteDto != null &&
                widget.param.favoriteDto!.choices != null &&
                widget.param.favoriteDto!.choices!.length > 0)
              _buildAppBar(widget.param.favoriteDto!.title!),
            if (widget.param.favoriteDto == null ||
                widget.param.favoriteDto!.choices == null)
              _buildAppBar('การสืบค้นข้อมูล'),
            Expanded(
              child: Container(
                color: AppColor.white_bg,
                child: Column(
                  children: [
                    _buildMainContent(),
                    _buildButtons(),
                  ],
                ),
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
                onTap: () {
                  ScreenNavigator.pop();
                },
                child: Container(
                  width: 45.w,
                  child: Center(
                    child: Image.asset(AppImage.ic_back,
                        fit: BoxFit.contain, width: 24.w, height: 45.h),
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
                onTap: () {}, //_backToHomeScreen(),
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

  Widget _buildMainContent() => Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_viewModel.scope.showInputPid ||
                      _viewModel.scope.showInputPidPlt1 ||
                      _viewModel.scope.showInputPidPlt2)
                    SizedBox(
                      height: 16.h,
                    ),
                  if (_viewModel.scope.showInputPid ||
                      _viewModel.scope.showInputPidPlt1 ||
                      _viewModel.scope.showInputPidPlt2)
                    _buildSectionImageChoose(),

                  _buildTitle(),

                  // Common
                  Column(
                      key: tutorKeySPerson.keyPersonParams1,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        if ((_viewModel.scope.showInputPid ||
                                _viewModel.scope.showInputNames) &&
                            ((_viewModel.favoriteDto.choices!.length == 0) ||
                                (_viewModel.favoriteDto.choices!.length > 0) &&
                                    (_viewModel.favoriteDto.choices!.contains(
                                            AppConstant.showFormIdCard) ||
                                        _viewModel.favoriteDto.choices!
                                            .contains(AppConstant
                                                .showFormFirstName) ||
                                        _viewModel.favoriteDto.choices!
                                            .contains(
                                                AppConstant.showFormLastName))))
                          _buildHeader("เงื่อนไขการค้นหาพื้นฐาน"),
                        if (_viewModel.scope.base64Image != null)
                          _buildImagePreview(_viewModel.scope.base64Image!),
                        if ((_viewModel.scope.showInputPid ||
                                _viewModel.scope.showInputPidPlt1 ||
                                _viewModel.scope.showInputPidPlt2) &&
                            ((_viewModel.favoriteDto.choices!.length == 0) ||
                                (_viewModel.favoriteDto.choices!.length > 0) &&
                                    _viewModel.favoriteDto.choices!
                                        .contains(AppConstant.showFormIdCard)))
                          _buildFormIdCard(),
                        if ((_viewModel.scope.showInputNames ||
                                _viewModel.scope.showInputNamesPlt1 ||
                                _viewModel.scope.showInputNamesPlt2) &&
                            ((_viewModel.favoriteDto.choices!.length == 0) ||
                                (_viewModel.favoriteDto.choices!.length > 0) &&
                                    _viewModel.favoriteDto.choices!.contains(
                                        AppConstant.showFormFirstName)))
                          _buildFormFirstName(),
                        if ((_viewModel.scope.showInputNames ||
                                _viewModel.scope.showInputNamesPlt1 ||
                                _viewModel.scope.showInputNamesPlt2) &&
                            ((_viewModel.favoriteDto.choices!.length == 0) ||
                                (_viewModel.favoriteDto.choices!.length > 0) &&
                                    _viewModel.favoriteDto.choices!.contains(
                                        AppConstant.showFormLastName)))
                          _buildFormLastName(),
                      ]),

                  // Foreign
                  Column(
                    key: tutorKeySPerson.keyPersonParams2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      if (_viewModel.scope.showInputWorkerId &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormWorkerId)))
                        _buildHeader(
                            "เงื่อนไข กลุ่ม: แรงงานต่างด้าว ตรวจคนเข้าเมือง"),
                      if (_viewModel.scope.showInputWorkerId &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormWorkerId)))
                        _buildFormWorkerId(),

                      // Civil & Immigration, ForeignHouse
                      // if(!_viewModel.scope.showInputPasId && _viewModel.scope.showInputPassportNo) _buildHeader("เงื่อนไข กลุ่ม: ตรวจคนเข้าเมือง ที่พักต่างด้าว"),
                      if (_viewModel.scope.showInputPasId &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormPasId)))
                        _buildFormPasId(),
                      if ((!_viewModel.scope.showInputPasId &&
                              _viewModel.scope.showInputPassportNo) &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormPasId)))
                        _buildFormPassportNo(),
                      // if(_viewModel.scope.showInputImmigration) _buildFormTmrunno(),
                      if (_viewModel.scope.showInputPasId &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormNation)))
                        _buildFormNation(),
                    ],
                  ),
                  // Social
                  // if(_viewModel.scope.showInputSocial) _buildHeader("เงื่อนไข กลุ่ม: ประกันสังคม ประกันสุขภาพ"),
                  // if(_viewModel.scope.showInputSocial) _buildFormAccno(),
                  // if(_viewModel.scope.showInputSocial) _buildFormAccbranch(),

                  // if(_viewModel.scope.showInputCrimes) _buildFormProviceWr(),
                  // if(_viewModel.scope.showInputCrimes) _buildFormTambonWr(),
                  // if(_viewModel.scope.showInputCrimes) _buildFormAmphurWr(),
                  // if(_viewModel.scope.showInputCrimes) _buildFormCharge(),
                  // if(_viewModel.scope.showInputCrimes) _buildFormCourt(),

                  // Car
                  Column(
                    key: tutorKeySPerson.keyPersonParams3,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      if ((_viewModel.scope.showInputPidPlt1 ||
                              _viewModel.scope.showInputNamesPlt1 ||
                              _viewModel.scope.showInputPidPlt2 ||
                              _viewModel.scope.showInputNamesPlt2 ||
                              _viewModel.scope.showInputPlateProv) &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  (_viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormPltcode1) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormPltcode2) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormPlate1Vh) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormPlate2Vh) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormProvcode) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormVhtype) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormNumbody) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormBrncode))))
                        _buildHeader("เงื่อนไข กลุ่ม: กรมขนส่ง"),
                      if ((_viewModel.scope.showInputPidPlt1 ||
                              _viewModel.scope.showInputNamesPlt1) &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormPltcode1)))
                        _buildFormPltcode1(),
                      if ((_viewModel.scope.showInputPidPlt2 ||
                              _viewModel.scope.showInputNamesPlt2) &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormPltcode2)))
                        _buildFormPltcode2(),

                      if (_viewModel.scope.showInputPlateProv &&
                              ((_viewModel.favoriteDto.choices!.length == 0) ||
                                  (_viewModel.favoriteDto.choices!.length >
                                          0) &&
                                      (_viewModel.favoriteDto.choices!.contains(
                                              AppConstant.showFormPlate1Vh) ||
                                          _viewModel.favoriteDto.choices!
                                              .contains(AppConstant
                                                  .showFormIntitialNo))) ||
                          _viewModel.scope.showInputFullNoPlate ||
                          _viewModel.scope.showInputPlateTicket)
                        _buildFormPlate1Vh(),
                      if (_viewModel.scope.showInputPlateProv &&
                              ((_viewModel.favoriteDto.choices!.length == 0) ||
                                  (_viewModel.favoriteDto.choices!.length >
                                          0) &&
                                      (_viewModel.favoriteDto.choices!.contains(
                                              AppConstant.showFormPlate2Vh) ||
                                          _viewModel.favoriteDto.choices!
                                              .contains(AppConstant
                                                  .showFormNumber))) ||
                          _viewModel.scope.showInputFullNoPlate ||
                          _viewModel.scope.showInputPlateTicket)
                        _buildFormPlate2Vh(),
                      if (_viewModel.scope.showInputPlateProv &&
                              ((_viewModel.favoriteDto.choices!.length == 0) ||
                                  (_viewModel.favoriteDto.choices!.length >
                                          0) &&
                                      (_viewModel.favoriteDto.choices!.contains(
                                              AppConstant.showFormProvcode) ||
                                          _viewModel.favoriteDto.choices!
                                              .contains(AppConstant
                                                  .showFormProviceTc))) ||
                          _viewModel.scope.showInputFullNoPlate ||
                          _viewModel.scope.showInputPlateTicket)
                        _buildFormProvcode(),
                      if (_viewModel.scope.showInputPlateProv &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormVhtype)))
                        _buildFormVhtype(),

                      if (_viewModel.scope.showInputNumBody &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormNumbody)))
                        _buildFormNumbody(),
                      if (_viewModel.scope.showInputNumBody &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormBrncode)))
                        _buildFormBrncode(),

                      if ((_viewModel.scope.showInputFullNoPlate ||
                              _viewModel.scope.showInputFullEngineNo ||
                              _viewModel.scope.showInputPlateProv ||
                              _viewModel.scope.showInputNumBody) &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  (_viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormProviceTc) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormIntitialNo) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormNumber) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormStatus) ||
                                      _viewModel.favoriteDto.choices!.contains(
                                          AppConstant.showFormEngineNo))))
                        _buildHeader("เงื่อนไข กลุ่ม: ยานพาหนะในคดี"),
                      // if(_viewModel.scope.showInputFullNoPlate
                      //     && ((_viewModel.favoriteDto.choices!.length==0) || (_viewModel.favoriteDto.choices!.length>0) && _viewModel.favoriteDto.choices!.contains(AppConstant.showFormProviceTc)) ) _buildFormProviceTc(),
                      // if(_viewModel.scope.showInputFullNoPlate
                      //     && ((_viewModel.favoriteDto.choices!.length==0) || (_viewModel.favoriteDto.choices!.length>0) && _viewModel.favoriteDto.choices!.contains(AppConstant.showFormIntitialNo)) ) _buildFormIntitialNo(),
                      // if(_viewModel.scope.showInputFullNoPlate
                      //     && ((_viewModel.favoriteDto.choices!.length==0) || (_viewModel.favoriteDto.choices!.length>0) && _viewModel.favoriteDto.choices!.contains(AppConstant.showFormNumber)) ) _buildFormNumber(),

                      // if((_viewModel.scope.showInputFullNoPlate || _viewModel.scope.showInputFullEngineNo)
                      //     && ((_viewModel.favoriteDto.choices!.length==0) || (_viewModel.favoriteDto.choices!.length>0) && _viewModel.favoriteDto.choices!.contains(AppConstant.showFormStatus)) ) _buildFormStatus(),
                      if (_viewModel.scope.showInputFullEngineNo &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormEngineNo)))
                        _buildFormEngineNo(),

                      // Immigration, ForeignHouse
                      if (_viewModel.scope.showInputPlateTicket &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormTicketId)))
                        _buildHeader("เงื่อนไข กลุ่ม: ใบสั่งจราจร"),
                      // if(_viewModel.scope.showInputPlateTicket) _buildFormPlate1Tf(),
                      // if(_viewModel.scope.showInputPlateTicket) _buildFormPlate2Tf(),
                      // if(_viewModel.scope.showInputPlateTicket) _buildFormPlate3Tf(),
                      if (_viewModel.scope.showInputPlateTicket &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormTicketId)))
                        _buildFormTicketId(),

                      if ((_viewModel.scope.showInputLicenseNumber) &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  (_viewModel.favoriteDto.choices!.contains(
                                      AppConstant.showFormLicenseNumber))))
                        _buildHeader("เงื่อนไข กลุ่ม: รถฉุกเฉิน"),
                      if (_viewModel.scope.showInputLicenseNumber &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!.contains(
                                      AppConstant.showFormLicenseNumber)))
                        _buildFormLicenseNumber(),
                    ],
                  ),

                  Column(
                    key: tutorKeySPerson.keyPersonParams4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      if ((_viewModel.scope.showInputAlienNo &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  (_viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormGunReg)))))
                        _buildHeader("เงื่อนไข กลุ่ม: ใบอนุญาต ป.4"),
                      if (_viewModel.scope.showInputGunReg &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormGunReg)))
                        _buildFormGunReg(),
                    ],
                  ),

                    //กลุ่มเงื่อนไข: แรงงาน 4 ต่างชาติ
                    Column(
                    key: tutorKeySPerson.keyPersonParams5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      if ((_viewModel.scope.showInputAlienNo) &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  (_viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormAlienNo  ))))
                        _buildHeader("เงื่อนไข กลุ่ม: แรงงาน 4 ต่างชาติ"),
                      if (_viewModel.scope.showInputAlienNo &&
                          ((_viewModel.favoriteDto.choices!.length == 0) ||
                              (_viewModel.favoriteDto.choices!.length > 0) &&
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormAlienNo )))
                        _buildFormAlienNo(),
                    ],
                  ),

                  // Crimecase, Trafficcase, Warrant
                  if (_viewModel.scope.showInputFullcaseNo &&
                      ((_viewModel.favoriteDto.choices!.length == 0) ||
                          (_viewModel.favoriteDto.choices!.length > 0) &&
                              (_viewModel.favoriteDto.choices!.contains(
                                      AppConstant.showFormCrimeCaseNo) ||
                                  _viewModel.favoriteDto.choices!.contains(
                                      AppConstant.showFormCrimeCaseYear) ||
                                  _viewModel.favoriteDto.choices!
                                      .contains(AppConstant.showFormOrgCode))))
                    _buildHeader("เงื่อนไข กลุ่ม: คดีอาญา คดีจราจร หมายจับ"),
                  if (_viewModel.scope.showInputFullcaseNo &&
                      ((_viewModel.favoriteDto.choices!.length == 0) ||
                          (_viewModel.favoriteDto.choices!.length > 0) &&
                              _viewModel.favoriteDto.choices!
                                  .contains(AppConstant.showFormCrimeCaseNo)))
                    _buildFormCrimeCaseNo(),
                  if (_viewModel.scope.showInputFullcaseNo &&
                      ((_viewModel.favoriteDto.choices!.length == 0) ||
                          (_viewModel.favoriteDto.choices!.length > 0) &&
                              _viewModel.favoriteDto.choices!
                                  .contains(AppConstant.showFormCrimeCaseYear)))
                    _buildFormCrimeCaseYear(),
                  if (_viewModel.scope.showInputFullcaseNo &&
                      ((_viewModel.favoriteDto.choices!.length == 0) ||
                          (_viewModel.favoriteDto.choices!.length > 0) &&
                              _viewModel.favoriteDto.choices!
                                  .contains(AppConstant.showFormOrgCode)))
                    _buildFormOrgCode(),

                  SizedBox(
                    height: 32.h,
                  ),
                ],
              )),
        ),
      );

  Widget _buildSectionImageChoose() => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: -8,
                blurRadius: 24,
                offset: Offset(0.0, 12.0) // changes position of shadow
                ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ทางลัดค้นหาเลขบัตรประชาชน',
              style: TextStyles.bodyBold.copyWith(color: Colors.black),
            ),
            Container(
              key: tutorKeySPerson.keyPersonScanCardId,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(children: [
                //Image.asset(AppImage.btn_camera, fit: BoxFit.contain, width: 40.w),

                // InkWell(
                //   onTap: () => _captureImageAndProcess(),
                //   child: Image.asset(
                //     AppImage.btn_camera,
                //     fit: BoxFit.contain,
                //     width: 40.w,
                //   ),
                // ),

                InkWell(
                  onTap: () =>
                      _checkPermissionCamera2(), //_captureImageAndProcess(),
                  borderRadius: BorderRadius.circular(50),
                  splashColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    width: 40, // ขนาดวงกลมเล็กลง
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2), // เว้นขอบรอบภาพเล็กน้อย
                      child: Image.asset(
                        AppImage.btn_camera,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 16.w),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        'กล้อง',
                        style:
                            TextStyles.bodyBold.copyWith(color: Colors.black),
                      ),
                      Text(
                        'ใช้กล้องในการสแกนเลขบัตร',
                        style: TextStyles.xSmall.copyWith(color: Colors.black),
                      ),
                    ])),
                SizedBox(width: 16.w),
                SecondaryCustomButton(
                  'ค้นหา',
                  onPressed: () => _checkPermissionCamera(),
                  isFullWidth: false,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 16.w),
                ),
              ]),

              //   child: Padding(
              //     padding: EdgeInsets.all(8.w),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         // 🔸 ไอคอนกล้อง
              //         Image.asset(
              //           AppImage.btn_camera,
              //           fit: BoxFit.contain,
              //           width: 40.w,
              //           height: 40.w,
              //         ),
              //
              //         SizedBox(width: 12.w),
              //
              //         // 🔸 ข้อความ (กล้อง + อธิบาย)
              //         Expanded(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'กล้อง',
              //                 style: TextStyles.bodyBold.copyWith(color: Colors.black),
              //               ),
              //               // SizedBox(height: 2.h),
              //               // Text(
              //               //   'ใช้กล้องในการสแกนเลขบัตร',
              //               //   style: TextStyles.xSmall.copyWith(color: Colors.black),
              //               // ),
              //             ],
              //           ),
              //         ),
              //
              //         SizedBox(width: 12.w),
              //
              //         // 🔸 ปุ่มค้นหา
              //         SecondaryCustomButton(
              //           'สแกนบัตร',
              //           onPressed: _checkPermissionCamera,
              //           isFullWidth: false,
              //           padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
              //         ),
              //
              //         SizedBox(width: 8.w),
              //
              //         // 🔸 ปุ่มถ่ายภาพ
              //         SecondaryCustomButton(
              //           'ถ่ายภาพ',
              //           onPressed: _captureImageAndProcess,
              //           isFullWidth: false,
              //           padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
              //         ),
              //       ],
              //     ),
              //   )
            ),
            Container(
              color: AppColor.grey_line,
              height: 0.5,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.only(top: 16.h),
              child: Row(children: [
                //Image.asset(AppImage.btn_gallery, fit: BoxFit.contain, width: 40.w),

                InkWell(
                  onTap: () =>
                      _checkPermissionGallery2(), //_pickImageFromGallery(),
                  borderRadius: BorderRadius.circular(50),
                  splashColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    width: 40, // ขนาดวงกลมเล็กลง
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2), // เว้นขอบรอบภาพเล็กน้อย
                      child: Image.asset(
                        AppImage.btn_gallery,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 16.w),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        'คลังภาพ',
                        style:
                            TextStyles.bodyBold.copyWith(color: Colors.black),
                      ),
                      Text(
                        'ค้นหาภาพเพื่อสแกนเลขบัตร',
                        style: TextStyles.xSmall.copyWith(color: Colors.black),
                      ),
                    ])),
                SizedBox(width: 16.w),
                SecondaryCustomButton(
                  'ค้นหา',
                  onPressed: () => _checkPermissionGallery(),
                  isFullWidth: false,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 16.w),
                ),
              ]),
            ),
          ],
        ),
      );

  Widget _buildTitle() => Container(
        padding: EdgeInsets.only(
          top: 24.h,
        ),
        child: Text('โปรดระบุข้อมูล เพื่อทำการสืบค้น',
            style: TextStyles.xBodyBold.copyWith(color: AppColor.blue_text)),
      );

  Widget _buildHeader(String text) => Container(
        padding: EdgeInsets.only(
          top: 24.h,
        ),
        child: Text(
          text,
          style: TextStyles.bodySemi.copyWith(color: Colors.black),
        ),
      );

  Widget _buildButtons() => Container(
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
                offset: Offset(0.0, -2.0) // changes position of shadow
                ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Row(
            children: [
              Expanded(
                key: tutorKeySPerson.keyPersonActionClear,
                child: SecondaryCustomButton(
                  'ละทิ้งข้อมูล',
                  onPressed: () => _showDialogClearForm(),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                key: tutorKeySPerson.keyPersonActionNext,
                child: PrimaryCustomButton(
                  'ถัดไป',
                  onPressed: () => _openSelectDB(),
                  isEnabled: _viewModel.isEnableButton,
                ),
              ),
            ],
          ),
        ),
      );

  void _showDialogSelect(
      String title,
      List<String> array,
      TextEditingController edtController,
      bool isSearch,
      String searchHint,
      Function function) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FilterDialogContent(
              title, array, edtController, function, isSearch, searchHint);
        });
  }

  // แปลง base64 เป็น Uint8List
  Uint8List _decodeBase64Image(String base64String) {
    return base64Decode(base64String);
  }

  // ภายใน widget ของคุณ
  Widget _buildImagePreview(String base64Image) {
    if (base64Image.isEmpty) {
      return Center(child: Text("")); //ยังไม่มีภาพ
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                _decodeBase64Image(base64Image),
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "ภาพตัวอย่าง",
            style: TextStyles.xxSmallSemi.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  // Common
  TextEditingController _tcIdCard = TextEditingController();
  Widget _buildFormIdCard() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.number,
            maxLength: 13,
            labelText: 'เลขบัตรประชาชน',
            controller: _tcIdCard,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setPid(text)},
          ),
        ),
      );
  TextEditingController _tcFirstName = TextEditingController();
  TextEditingController _tcLastName = TextEditingController();
  Widget _buildFormFirstName() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ชื่อ',
            controller: _tcFirstName,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setFirstName(text)},
          ),
        ),
      );
  Widget _buildFormLastName() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'นามสกุล',
            controller: _tcLastName,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setLastName(text)},
          ),
        ),
      );

  // Crimecase, Trafficcase, Warrant
  TextEditingController _tcOrgCode = TextEditingController();
  // Widget _buildFormOrgCode() => Container(
  //   child: Padding(
  //     padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
  //     child: CustomTextField(
  //       keyboardType: TextInputType.text,
  //       labelText: 'หน่วยงาน',
  //       controller: _tcOrgCode,
  //       bgColor: Colors.white,
  //       textColor: Colors.black,
  //       textInputAction: TextInputAction.next,
  //       onChanged: (text) => {
  //         _viewModel.setOrgCode(text)
  //       } ,
  //     ),
  //   ),
  // );
  Widget _buildFormOrgCode() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'หน่วยงาน',
                    _viewModel.listPoliceStationName,
                    _tcOrgCode,
                    true,
                    'กรุณาระบุชื่อ หน่วยงาน',
                    (index) => {
                          _viewModel
                              .setOrgCode(_viewModel.listPoliceStationID[index])
                        });
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'หน่วยงาน',
                controller: _tcOrgCode,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setProviceTc(text)
                // } ,
              ),
            ),
          ),
        ),
      );

  TextEditingController _tcCrimeCaseYear = TextEditingController();
  Widget _buildFormCrimeCaseYear() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.number,
            labelText: 'เลขท่ีปีคดี',
            controller: _tcCrimeCaseYear,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setCrimeCaseYear(text)},
          ),
        ),
      );
  TextEditingController _tcCrimeCaseNo = TextEditingController();
  Widget _buildFormCrimeCaseNo() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.number,
            labelText: 'เลขที่คดี',
            controller: _tcCrimeCaseNo,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setCrimeCaseNo(text)},
          ),
        ),
      );
  TextEditingController _tcPasId = TextEditingController();
  Widget _buildFormPasId() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'เลขพาสปอร์ต',
            controller: _tcPasId,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setPasId(text)},
          ),
        ),
      );
  TextEditingController _tcNation = TextEditingController();
  Widget _buildFormNation() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'สัญชาติ',
            controller: _tcNation,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setNation(text)},
          ),
        ),
      );
  TextEditingController _tcProviceTc = TextEditingController();
  Widget _buildFormProviceTc() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'จังหวัด - ทะเบียนรถ',
                    AppConstant.proviceTcKeys,
                    _tcProviceTc,
                    false,
                    '',
                    (index) => {_viewModel.setProvinceByIndex(index)});
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'จังหวัด - ทะเบียนรถ',
                controller: _tcProviceTc,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setProviceTc(text)
                // } ,
              ),
            ),
          ),
        ),
      );
  TextEditingController _tcIntitialNo = TextEditingController();
  Widget _buildFormIntitialNo() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ตัวอักษร - ทะเบียนรถ',
            controller: _tcIntitialNo,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setIntitialNo(text)},
          ),
        ),
      );
  TextEditingController _tcNumber = TextEditingController();
  Widget _buildFormNumber() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ตัวเลข - ทะเบียนรถ',
            controller: _tcNumber,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setNumber(text)},
          ),
        ),
      );
  TextEditingController _tcStatus = TextEditingController();
  Widget _buildFormStatus() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'สถานะยานพาหนะในคดี',
                    AppConstant.statusKeys,
                    _tcStatus,
                    false,
                    '',
                    (index) => {
                          _viewModel.setStatus(AppConstant.statusValues[index])
                        });
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'สถานะยานพาหนะในคดี',
                controller: _tcStatus,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setStatus(text)
                // } ,
              ),
            ),
          ),
        ),
      );
  TextEditingController _tcEngineNo = TextEditingController();
  Widget _buildFormEngineNo() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'เลขตัวเครื่อง',
            controller: _tcEngineNo,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setEngineNo(text)},
          ),
        ),
      );

  //Emergency
  TextEditingController _licensenumber = TextEditingController();
  Widget _buildFormLicenseNumber() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'เลขหนังสืออนุญาต',
            controller: _licensenumber,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setLicenseNumber(text)},
          ),
        ),
      );

  //Gun Lk2
  TextEditingController _gunReg = TextEditingController();
  Widget _buildFormGunReg() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'หมายเลขทะเบียนอาวุธปืน',
            hintText: 'กทxxxxxxx',
            hintTextColor: Colors.grey,
            controller: _gunReg,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setGunReg(text)},
          ),
        ),
      );

  //Migwis
  TextEditingController _alienNo = TextEditingController();
  Widget _buildFormAlienNo() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'หมายเลขทะเบียนแรงงาน',
            // hintText: 'กทxxxxxxx',
            // hintTextColor: Colors.black,
            controller: _alienNo,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setAlienNo(text)},
          ),
        ),
      );




  TextEditingController _tcProviceWr = TextEditingController();
  Widget _buildFormProviceWr() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'จังหวัด',
            controller: _tcProviceWr,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setProviceWr(text)},
          ),
        ),
      );
  TextEditingController _tcTambonWr = TextEditingController();
  Widget _buildFormTambonWr() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ตำบล',
            controller: _tcTambonWr,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setTambonWr(text)},
          ),
        ),
      );
  TextEditingController _tcAmphurWr = TextEditingController();
  Widget _buildFormAmphurWr() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'อำเภอ',
            controller: _tcAmphurWr,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setAmphurWr(text)},
          ),
        ),
      );
  TextEditingController _tcCharge = TextEditingController();
  Widget _buildFormCharge() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ข้อหา',
            controller: _tcCharge,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setCharge(text)},
          ),
        ),
      );
  TextEditingController _tcCourt = TextEditingController();
  Widget _buildFormCourt() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ศาล',
            controller: _tcCourt,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setCourt(text)},
          ),
        ),
      );

  // Foreign
  TextEditingController _tcWorkerId = TextEditingController();
  Widget _buildFormWorkerId() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.number,
            labelText: 'เลขบัตรคนต่างด้าว',
            controller: _tcWorkerId,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setWorkerId(text)},
          ),
        ),
      );

  // Car
  TextEditingController _tcPltcode1 = TextEditingController();
  Widget _buildFormPltcode1() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'ประเภทใบอนุญาตขับรถ',
                    AppConstant.pltcode1Keys,
                    _tcPltcode1,
                    false,
                    '',
                    (index) => {
                          _viewModel
                              .setPltcode1(AppConstant.pltcode1Values[index])
                        });
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'ประเภทใบอนุญาตขับรถ',
                controller: _tcPltcode1,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setPltcode1(text)
                // } ,
              ),
            ),
          ),
        ),
      );
  TextEditingController _tcPltcode2 = TextEditingController();
  Widget _buildFormPltcode2() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'ประเภทใบอนุญาตขับรถ-ขนส่ง',
                    AppConstant.pltcode2Keys,
                    _tcPltcode2,
                    false,
                    '',
                    (index) => {
                          _viewModel
                              .setPltcode2(AppConstant.pltcode2Values[index])
                        });
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'ประเภทใบอนุญาตขับขี่-ขนส่ง',
                controller: _tcPltcode2,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setPltcode2(text)
                // } ,
              ),
            ),
          ),
        ),
      );
  TextEditingController _tcPlate1Vh = TextEditingController();
  Widget _buildFormPlate1Vh() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ทะเบียนรถ (ตัวอักษร)',
            controller: _tcPlate1Vh,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setPlate1Vh(text)},
          ),
        ),
      );
  TextEditingController _tcPlate2Vh = TextEditingController();
  Widget _buildFormPlate2Vh() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.number,
            labelText: 'ทะเบียนรถ (ตัวเลข)',
            controller: _tcPlate2Vh,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setPlate2Vh(text)},
          ),
        ),
      );
  TextEditingController _tcProvcode = TextEditingController();
  Widget _buildFormProvcode() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'ทะเบียนรถ (จังหวัด)',
                    AppConstant.proviceTcKeys,
                    _tcProvcode,
                    false,
                    '',
                    (index) => {_viewModel.setProvinceByIndex(index)});
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'ทะเบียนรถ (จังหวัด)',
                controller: _tcProvcode,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setProvcode(text)
                // } ,
              ),
            ),
          ),
        ),
      );
  TextEditingController _tcVhtype = TextEditingController();
  Widget _buildFormVhtype() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'ประเภทยานพาหนะ (กรมขนส่ง)',
                    AppConstant.vhTypeKeys,
                    _tcVhtype,
                    false,
                    '',
                    (index) => {
                          _viewModel.setVhtype(AppConstant.vhTypeValues[index])
                        });
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'ประเภทยานพาหนะ (กรมขนส่ง)',
                controller: _tcVhtype,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setVhtype(text)
                // } ,
              ),
            ),
          ),
        ),
      );
  TextEditingController _tcNumbody = TextEditingController();
  Widget _buildFormNumbody() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'หมายเลขตัวถัง',
            controller: _tcNumbody,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setNumbody(text)},
          ),
        ),
      );
  TextEditingController _tcBrncode = TextEditingController();
  Widget _buildFormBrncode() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'ยี่ห้อ (กรมขนส่ง)',
                    AppConstant.brncodeKeys,
                    _tcBrncode,
                    false,
                    '',
                    (index) => {
                          _viewModel
                              .setBrncode(AppConstant.brncodeValues[index])
                        });
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'ยี่ห้อ (กรมขนส่ง)',
                controller: _tcBrncode,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setBrncode(text)
                // } ,
              ),
            ),
          ),
        ),
      );

  // Social
  TextEditingController _tcAccno = TextEditingController();
  Widget _buildFormAccno() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'สถานประกอบการ',
            controller: _tcAccno,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setAccno(text)},
          ),
        ),
      );
  TextEditingController _tcAccbranch = TextEditingController();
  Widget _buildFormAccbranch() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'สาขา',
            controller: _tcAccbranch,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setAccbranch(text)},
          ),
        ),
      );

  // Immigration, ForeignHouse
  TextEditingController _tcPassportNo = TextEditingController();
  Widget _buildFormPassportNo() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'เลขพาสปอร์ต',
            controller: _tcPassportNo,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setPassportNoo(text)},
          ),
        ),
      );
  TextEditingController _tcTmrunno = TextEditingController();
  Widget _buildFormTmrunno() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'หมายเลขอ้างอิง',
            controller: _tcTmrunno,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setTmrunno(text)},
          ),
        ),
      );

  // Traffic
  TextEditingController _tcPlate1Tf = TextEditingController();
  Widget _buildFormPlate1Tf() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ทะเบียนรถ (ตัวอักษร)',
            controller: _tcPlate1Tf,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setPlate1Tf(text)},
          ),
        ),
      );
  TextEditingController _tcPlate2Tf = TextEditingController();
  Widget _buildFormPlate2Tf() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'ทะเบียนรถ (ตัวเลข)',
            controller: _tcPlate2Tf,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setPlate2Tf(text)},
          ),
        ),
      );
  TextEditingController _tcPlate3Tf = TextEditingController();
  Widget _buildFormPlate3Tf() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                _showDialogSelect(
                    'ทะเบียนรถ (จังหวัด)',
                    AppConstant.plate3TfKeys,
                    _tcPlate3Tf,
                    false,
                    '',
                    (index) => {
                          _viewModel
                              .setPlate3Tf(AppConstant.plate3TfValues[index])
                        });
              },
              child: CustomTextField(
                keyboardType: TextInputType.text,
                labelText: 'ทะเบียนรถ (จังหวัด)',
                controller: _tcPlate3Tf,
                bgColor: Colors.white,
                textColor: Colors.black,
                textInputAction: TextInputAction.next,
                enable: false,
                // onChanged: (text) => {
                //   _viewModel.setPlate3Tf(text)
                // } ,
              ),
            ),
          ),
        ),
      );
  TextEditingController _tcTicketId = TextEditingController();
  Widget _buildFormTicketId() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
          child: CustomTextField(
            keyboardType: TextInputType.text,
            labelText: 'เลขที่ใบสั่ง',
            controller: _tcTicketId,
            bgColor: Colors.white,
            textColor: Colors.black,
            textInputAction: TextInputAction.next,
            onChanged: (text) => {_viewModel.setTicketId(text)},
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

  void _handleError() {
    if (_viewModel.openLogin) {
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
    } else if (_viewModel.openWaitSMS) {
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitSMS,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    } else if (_viewModel.openWaitAdmin) {
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitAdmin,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    } else if (_viewModel.openRegisterPin) {
      ScreenNavigator.replaceEntireStackTo(Routes.createPin,
          param: CreatePinScreenParam(false));
    } else if (_viewModel.openRegisterBiometrics) {
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    } else if (_viewModel.openVerifyPin) {
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
                      ScreenNavigator.navigateTo(Routes.verifyPin,
                          param: VerifyPinScreenParam(true));
                    }),
              )));
    }
  }
}

class FilterDialogContent extends StatefulWidget {
  FilterDialogContent(this.title, this.array, this.edtController, this.function,
      this.isSearch, this.searchHint,
      {Key? key})
      : super(key: key);

  final String title;
  final List<String> array;
  final TextEditingController edtController;
  final Function function;
  final bool isSearch;
  final String searchHint;

  @override
  _FilterDialogContentState createState() => new _FilterDialogContentState();
}

class _FilterDialogContentState extends State<FilterDialogContent> {
  List<String> _choiceAllArray = [];
  List<String> _choiceFilterArray = [];

  @override
  void initState() {
    _choiceAllArray = [...widget.array];
    if (widget.isSearch) {
      _choiceFilterArray = [];
    } else {
      _choiceFilterArray = [...widget.array];
    }

    StringUtils.log("_choiceAllArray: ${_choiceAllArray.length}");
    StringUtils.log("_choiceFilterArray: ${_choiceFilterArray.length}");

    super.initState();
  }

  void _filterChoice(String text) {
    if (widget.isSearch) {
      if (text.length < 2) {
        setState(() {
          _choiceFilterArray.clear();
        });
        return;
      }
    }

    if (_choiceAllArray == null) _choiceAllArray = [];
    if (_choiceFilterArray == null) _choiceFilterArray = [];
    text = text.toLowerCase();

    List<String> filterChoice = [];
    for (int i = 0; i < _choiceAllArray.length; i++) {
      String choice = _choiceAllArray[i];
      if (choice != null && choice.isNotEmpty) {
        String checkChoice = choice.toLowerCase();
        if (checkChoice.indexOf(text) > -1) {
          filterChoice.add(choice);
        }
      }
    }

    setState(() {
      _choiceFilterArray = filterChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200.h,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ค้นหา${widget.title}",
                  style: TextStyles.titleBold.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  hintText: widget.searchHint.isNotEmpty
                      ? widget.searchHint
                      : 'ระบุคำค้นหา',
                  hintTextColor: Colors.grey,
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  onChanged: (text) => _filterChoice(text),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _choiceFilterArray.length,
                    itemBuilder: (context, index) => _getListItem(
                        context,
                        index,
                        _choiceFilterArray,
                        widget.edtController,
                        widget.function),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                PrimaryCustomButton(
                  'ตกลง',
                  onPressed: () => {Navigator.pop(context)},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getListItem(BuildContext context, int index, List<String> array,
      TextEditingController edtController, Function function) {
    String selectValue = edtController.text;
    if (selectValue == null || selectValue == '')
      selectValue = AppConstant.blank;
    final selectIndex = array.indexOf(selectValue);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          _selectItem(
              context, array[index] /*, index*/, edtController, function);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (selectIndex == index)
                    Icon(
                      Icons.check,
                      // color: AppColor.bgColor1,
                      size: 18.0,
                    ),
                  if (selectIndex != index) SizedBox(width: 18.0),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                "${array[index]}",
                                style: TextStyles.body.copyWith(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.grey.shade200,
                height: 1,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectItem(BuildContext context, String value /*, int index*/,
      TextEditingController edtController, Function function) async {
    Navigator.pop(context);
    if (value == AppConstant.blank) {
      edtController.text = '';
    } else {
      edtController.text = value;
    }

    //TODO: Find real index in choiceAllArray by value
    int index = 0;
    for (int i = 0; i < _choiceAllArray.length; i++) {
      if (_choiceAllArray[i] == value) {
        index = i;
        break;
      }
    }

    function(index);
  }
}
