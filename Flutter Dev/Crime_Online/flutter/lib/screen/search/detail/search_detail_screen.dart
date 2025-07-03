import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:clipboard/clipboard.dart';
import 'package:crimes/config/app_constant.dart';
// import 'package:crimes/data/dto/inner/warrant/warrant_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/form_detail.dart';
import 'package:crimes/data/entity/group_result.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/search/pdf/search_pdf_screen.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/search/detail/search_detail_screen_view_model.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
// import 'package:excel/excel.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';


class SearchDetailScreenParam extends NavigationParameter {
  SearchDetailScreenParam(
      this.type,
      this.category,
      this.result,
      this.userDto,
  );

  final String type;
  final String category;
  final Result result;
  final UserDto userDto;
}

class SearchDetailScreen extends StatefulWidget {
  SearchDetailScreen(this.param, {Key? key}) : super(key: key);

  final SearchDetailScreenParam param;


  @override
  _SearchDetailScreenState createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey scrollKey = GlobalKey();

  ScrollController _scrollController = ScrollController();
  SearchDetailScreenViewModel _viewModel = SearchDetailScreenViewModel();
  String _title = '';

  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    _viewModel.userDto = widget.param.userDto;
    _viewModel.setType(widget.param.type);
    _viewModel.category = widget.param.category;
    _viewModel.result = widget.param.result;
    _viewModel.checkData();
    _title = _viewModel.title;

    StringUtils.log("==> detail screen category: ${_viewModel.category}");

    // IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    // _port.listen((dynamic data) {
    //   String id = data[0];
    //   DownloadTaskStatus status = data[1];
    //   int progress = data[2];
    //   StringUtils.log('download progress: ${progress}');
    // });
    //
    // FlutterDownloader.registerCallback(downloadCallback);

    _scrollController.addListener(() {
      double scrollPosition = _scrollController.position.pixels;
      // print(".. scroll position: ${scrollPosition}");

      // TODO: Get height of scrollview to calculate bottom position
      double scrollHeight = 0;
      final keyContext = scrollKey.currentContext;
      if (keyContext != null) {
        // widget is visible
        final box = keyContext.findRenderObject() as RenderBox;
        scrollHeight = box.size.height;
        // print("====>  scroll height: ${scrollHeight}");
      }

      if(scrollHeight - scrollPosition < 400){
        _onScrollToBottom();
      }

      // if (_scrollController.position.atEdge) {
      //   if (_scrollController.position.pixels == 0) {
      //     // You're at the top.
      //   } else {
      //     // You're at the bottom.
      //     _onScrollToBottom();
      //   }
      // }
    });
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  // static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
  //   final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send.send([id, status, progress]);
  // }

  Permission _permission = Permission.storage;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  Future<void> _download() async{
    _permissionStatus = await _permission.status;
    if(!_permissionStatus.isGranted){
      _permissionStatus = await _permission.request();
    }
    //if(_permissionStatus.isGranted){
      await _viewModel.getPDFUrl();

      if(_viewModel.status == ActionStatus.success){
        _openPdf(_viewModel.pdfURL);
      }else if(_viewModel.status == ActionStatus.error){
        _handleError();
      }
    //}
  }

  Future<void> _downloadWarrant() async {
    if(_viewModel.warrantDto == null || _viewModel.warrantDto!.wrFileId == null || _viewModel.warrantDto!.wrFileId!.isEmpty) return;

    String warrantFileId = _viewModel.warrantDto!.wrFileId!;
    String downloadUrl = "${AppConstant.apiUrl}${AppConstant.downloadWarrantPath}${warrantFileId}";
    _openPdf(downloadUrl);

    // fortest
    // downloadUrl = 'https://firebasestorage.googleapis.com/v0/b/hello-firebase-518b3.appspot.com/o/SS4.pdf?alt=media&token=0352f264-bdcd-49b0-829a-66a524a4d923';

    // Directory downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    // final taskId = await FlutterDownloader.enqueue(
    //   url: downloadUrl,
    //   savedDir: downloadsDirectory.path,
    //   fileName: "หมายจับ.pdf",
    //   showNotification: true, // show download progress in status bar (for Android)
    //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    // );
    //
    // final tasks = await FlutterDownloader.loadTasks();

    Fluttertoast.showToast(msg: "ดาวน์โหลดไฟล์หมายจับเรียบร้อยแล้ว", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
  }

  void _openPdf(String url){
    if(url == null || url.isEmpty || url == 'ERROR') return;
    ScreenNavigator.navigateTo(Routes.searchPdf, param: SearchPdfScreenParam(_viewModel.userDto!, url));
  }

  Future<void> _downloadBase64(Uint8List pdfBytes) async {
    _permissionStatus = await _permission.status;
    if(!_permissionStatus.isGranted){
      _permissionStatus = await _permission.request();
    }

    try {
      // ดึงตำแหน่ง directory ชั่วคราว
      final directory = await getTemporaryDirectory();
      final filePath = "${directory.path}/warrant.pdf";

      // สร้างไฟล์ PDF
      final file = File(filePath);
      await file.writeAsBytes(pdfBytes);

      // แจ้งเตือนความสำเร็จ
      Fluttertoast.showToast(
        msg: "ดาวน์โหลดไฟล์หมายจับเรียบร้อยแล้ว: $filePath",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      // เปิดไฟล์
      await OpenFile.open(filePath);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "เกิดข้อผิดพลาดในการดาวน์โหลดไฟล์: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Future<void> _downloadWarrantCRDBase64() async {
    if (_viewModel.warrantCRDDto == null || _viewModel.warrantCRDDto!.warrant_doc == null || _viewModel.warrantCRDDto!.warrant_doc!.isEmpty) return;

    String warrantBase64 = _viewModel.warrantCRDDto!.warrant_doc!;

    // ตรวจสอบว่า Base64 ถูกต้อง
    if (RegExp(r'^[A-Za-z0-9+/]+={0,2}$').hasMatch(warrantBase64)) {
      try {
        // แปลง Base64 เป็น Uint8List
        Uint8List pdfBytes = base64Decode(warrantBase64);

        // เรียก _openPdf ด้วย Uint8List
         _openPdfBase64(pdfBytes);

      } catch (e) {
        Fluttertoast.showToast(
          msg: "เกิดข้อผิดพลาดในการแปลง Base64: ${e.toString()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "ข้อมูล Base64 ไม่ถูกต้อง",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Future<void> _downloadWarrantCourtCRDBase64() async {
    if (_viewModel.warrantCourtCRDDto == null || _viewModel.warrantCourtCRDDto!.warrant_doc == null || _viewModel.warrantCourtCRDDto!.warrant_doc!.isEmpty) return;

    String warrantBase64 = _viewModel.warrantCourtCRDDto!.warrant_doc!;

    // ตรวจสอบว่า Base64 ถูกต้อง
    if (RegExp(r'^[A-Za-z0-9+/]+={0,2}$').hasMatch(warrantBase64)) {
      try {
        // แปลง Base64 เป็น Uint8List
        Uint8List pdfBytes = base64Decode(warrantBase64);

        // เรียก _openPdf ด้วย Uint8List
        _openPdfBase64(pdfBytes);

      } catch (e) {
        Fluttertoast.showToast(
          msg: "เกิดข้อผิดพลาดในการแปลง Base64: ${e.toString()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "ข้อมูล Base64 ไม่ถูกต้อง",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  // Future<void> _createExcel() async {
  //   StringUtils.log("====> _createExcel()");
  //
  //   var excel = Excel.createExcel();
  //   Sheet sheetObject = excel['Sheet1'];
  //   String title = _getFormTitle();
  //
  //   sheetObject.appendRow(["ข้อมูลจาก ${title}"]);
  //   sheetObject.appendRow([""]);
  //   for(int i=0; i<_viewModel.result.formArray.length; i++) {
  //     final form = _viewModel.result.formArray[i];
  //     sheetObject.appendRow(["${form.title}", '${form.desc}']);
  //   }
  //
  //   Directory downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
  //   String path = '${downloadsDirectory.path}/${_getFileName(title)}.xlsx';
  //   StringUtils.log('path: ${path}');
  //
  //   excel.encode().then((onValue) {
  //     File(path)
  //       ..createSync(recursive: true)
  //       ..writeAsBytesSync(onValue);
  //   });
  //
  //   Fluttertoast.showToast(msg: "ดาวน์โหลดไฟล์ .xlxs เก็บไว้ที่: ${path}", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
  // }

  // Future<void> _createPdf() async{
  //   final pdf = pw.Document();
  //   String title = _getFormTitle();
  //
  //   pdf.addPage(pw.Page(
  //       theme: pw.ThemeData.withFont(
  //         base: pw.Font.ttf(await rootBundle.load("assets/fonts/SukhumvitSet-Text.ttf")),
  //       ),
  //       pageFormat: PdfPageFormat.a4,
  //       build: (pw.Context context) {
  //         return pw.Column(
  //           children: [
  //             pw.Text("ข้อมูลจาก ${title}"),
  //             pw.Text(" "),
  //             for(int i=0; i<_viewModel.result.formArray.length; i++)
  //               pw.Row(
  //                   children: [
  //                     pw.Container(
  //                       padding: pw.EdgeInsets.only(right: 20),
  //                       child: pw.Text("${_viewModel.result.formArray[i].title}"),
  //                     ),
  //                     pw.Text('${_viewModel.result.formArray[i].desc}'),
  //                   ]
  //               ),
  //           ],
  //         ); // Center
  //       }));
  //
  //   Directory downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
  //   String path = '${downloadsDirectory.path}/${_getFileName(title)}.pdf';
  //   StringUtils.log('path: ${path}');
  //
  //   final file = File(path);
  //   file.writeAsBytesSync(pdf.save());
  //
  //   Fluttertoast.showToast(msg: "ดาวน์โหลดไฟล์ .pdf เก็บไว้ที่: ${path}", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
  // }

  String _getFileName(String title){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd_HH:mm').format(now);
    return "รายงานการสืบค้นข้อมูล${_title}_ฐานข้อมูล${title}_${formattedDate}";
  }

  String _getFormTitle() {
    String title = "";
    switch(_viewModel.category) {

      // Person Inner
      case AppConstant.dbInnerPersonHasAya: title = AppConstant.msInnerPersonHasAya; break;
      case AppConstant.dbInnerPersonDoAya: title = AppConstant.msInnerPersonDoAya; break;
      // case AppConstant.dbInnerPersonHasTraffic: title = AppConstant.msInnerPersonHasTraffic; break;
      case AppConstant.dbInnerPersonDoTraffic: title = AppConstant.msInnerPersonDoTraffic; break;
      case AppConstant.dbInnerPersonWarrantCRD: title = AppConstant.msInnerPersonWarrantCRD; break;
      case AppConstant.dbInnerPersonWarrantCourtCRD: title = AppConstant.msInnerPersonWarrantCourtCRD; break;
      case AppConstant.dbInnerPersonRedNotice: title = AppConstant.msInnerPersonRedNotice; break;
      case AppConstant.dbInnerPersonFaceRec: title = AppConstant.msInnerPersonFaceRec; break;

      // Person Outer
      case AppConstant.dbOuterPersonLinkage: title = AppConstant.msOuterPersonLinkage; break;
      case AppConstant.dbOuterPersonCivil: title = AppConstant.msOuterPersonCivil; break;
      case AppConstant.dbOuterPersonForeign: title = AppConstant.msOuterPersonForeign; break;
      case AppConstant.dbOuterPersonCarLicense: title = AppConstant.msOuterPersonCarLicense; break;
      case AppConstant.dbOuterPersonBusLicense: title = AppConstant.msOuterPersonBusLicense; break;
      case AppConstant.dbOuterPersonCar: title = AppConstant.msOuterPersonCar; break;
      case AppConstant.dbOuterPersonSocialEmployee: title = AppConstant.msOuterPersonSocialEmployee; break;
      case AppConstant.dbOuterPersonSocialHospital: title = AppConstant.msOuterPersonSocialHospital; break;
      case AppConstant.dbOuterPersonSocialEmployer: title = AppConstant.msOuterPersonSocialEmployer; break;
      case AppConstant.dbOuterPersonHealth: title = AppConstant.msOuterPersonHealth; break;
      case AppConstant.dbOuterPersonImmigration: title = AppConstant.msOuterPersonImmigration; break;
      case AppConstant.dbOuterPersonExtension: title = AppConstant.msOuterPersonExtension; break;
      case AppConstant.dbOuterPersonForeignHouse: title = AppConstant.msOuterPersonForeignHouse; break;
      case AppConstant.dbOuterPersonTraffic: title = AppConstant.msOuterPersonTraffic; break;
      case AppConstant.dbOuterPersonP4: title = AppConstant.msOuterPersonP4; break;
      case AppConstant.dbOuterPersonPrisoner: title = AppConstant.msOuterPersonPrisoner; break;
      case AppConstant.dbOuterPersonWarrantCourt: title = AppConstant.msOuterPersonWarrantCourt; break;
      // case AppConstant.dbOuterPersonRescueVolunteer: title = AppConstant.msOuterPersonRescueVolunteer; break;
      // case AppConstant.dbOuterPersonRescueTraining: title = AppConstant.msOuterPersonRescueTraining; break;

      case AppConstant.dbOuterPersonAlien: title = AppConstant.msOuterPersonAlien; break;
      case AppConstant.dbOuterPersonWorker: title = AppConstant.msOuterPersonWorker; break;
      case AppConstant.dbOuterPersonNonThai: title = AppConstant.msOuterPersonNonThai; break;
      case AppConstant.dbOuterPersonNoRegis: title = AppConstant.msOuterPersonNoRegis; break;

      // Car Inner
      case AppConstant.dbInnerCarAya: title = AppConstant.msInnerCarAya; break;
      case AppConstant.dbInnerCarTraffic: title = AppConstant.msInnerCarTraffic; break;
      case AppConstant.dbInnerCarLost: title = AppConstant.msInnerCarLost; break;
      // case AppConstant.dbInnerCarWanted: title = AppConstant.msInnerCarWanted; break;
      case AppConstant.dbInnerCarEmergency: title = AppConstant.msInnerCarEmergency; break;
      // Car Outer
      case AppConstant.dbOuterCarCar: title = AppConstant.msOuterCarCar; break;
      case AppConstant.dbOuterCarTraffic: title = AppConstant.msOuterCarTraffic; break;
      // case AppConstant.dbOuterCarAmbulanceLicense: title = AppConstant.msOuterCarAmbulanceLicense; break;
      // case AppConstant.dbOuterCarFlashingLightLicense: title = AppConstant.msOuterCarFlashingLightLicense; break;

      // Info Inner
      case AppConstant.dbInnerInfoAya: title = AppConstant.msInnerInfoAya; break;
      case AppConstant.dbInnerInfoPersonSS: title = AppConstant.msInnerInfoPersonSS; break;
      case AppConstant.dbInnerInfoTraffic: title = AppConstant.msInnerInfoTraffic; break;
      case AppConstant.dbInnerInfoPersonTC: title = AppConstant.msInnerInfoPersonTC; break;
      case AppConstant.dbInnerInfoVehicleCc: title = AppConstant.msInnerInfoVehicleCc; break;
      case AppConstant.dbInnerInfoVehicleTc: title = AppConstant.msInnerInfoVehicleTc; break;

    }
    return title;
  }

  void _backToHomeScreen() {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: 'ยืนยันกลับไปหน้าหลัก',
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto!));
                  }
              ),
            )
        )
    );
  }

  void _showDialogGPSRequired(){
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: 'เปิดการใช้งานตำแหน่ง\n(Location)',
                  description: 'โปรดเปิดการใช้งานตำแหน่ง GPS ของอุปกรณ์ ก่อนการสืบค้น',
                  // cancelText: AppMessage.cancel,
                  // onCancel: () {
                  //   Navigator.of(context).pop();
                  // },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    // _clearForm();
                  }
              ),
            )
        )
    );
  }

  void _openDialogDetail(String? title, String? description) {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: title,
                  description: description,
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                  }
              ),
            )
        )
    );
  }

  bool _nowRequestWarrantCrimeCaseDetail = false;
  bool _nowRequestWarrantTrafficCaseDetail = false;
  bool _nowRequestIdc = false;
  bool _nowRequestHouse = false;
  bool _nowRequestWorkerImage = false;
  bool _nowRequestPersonLkImage = false;
  bool _nowRequestMakeCardLk = false;
  bool _nowRequestHouseLk = false;
  bool _nowRequestHospital = false;
  bool _nowRequestEmployer = false;
  bool _nowRequestTravelVisa = false;
  bool _nowRequestPrisonerImage = false;

  Future<void> _onScrollToBottom() async{
    if(AppConstant.isMockUser) return;
    StringUtils.log(".. onScrollToBottom");

    if(_viewModel.category == AppConstant.dbInnerPersonHasAya && _viewModel.warrantDto != null && _viewModel.warrantDto!.orgCode != null ){
      // _buildWarrantCase()
      if(!AppConstant.isMockUser && (_viewModel.warrantDto != null && _viewModel.warrantDto!.orgCode != null && _viewModel.warrantDto!.orgCode!.isNotEmpty)){
        if(_viewModel.warrantDto!.caseType=='อาญา'||_viewModel.warrantDto!.caseType=='คดีอาญา'){
          if(_nowRequestWarrantCrimeCaseDetail) return;
          _nowRequestWarrantCrimeCaseDetail = true;
          await _viewModel.requestWarrantCrimeCaseDetail();
          if(_viewModel.crimeCaseDto!=null) {
            Fluttertoast.showToast(msg: "โหลดข้อมูล 'คดี' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
          }
        }else{
          if(_nowRequestWarrantTrafficCaseDetail) return;
          _nowRequestWarrantTrafficCaseDetail = true;
          await _viewModel.requestWarrantTrafficCaseDetail();
          if(_viewModel.trafficCaseDto!=null) {
            Fluttertoast.showToast(msg: "โหลดข้อมูล 'คดี' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
          }
        }
      }

    }
    // else if(!AppConstant.isMockUser && _viewModel.category == AppConstant.dbInnerPersonHasAya && _viewModel.warrantDto != null && _viewModel.warrantDto.wrFileId != null
    //     && _viewModel.warrantDto.wrFileId.isNotEmpty && _viewModel.warrantDto.wrFileId != '' && _viewModel.warrantDto.wrFileId != '-'){
    //  // _buildDownloadWarrantButton()
    //
    // }
    else if(_viewModel.category == AppConstant.dbOuterPersonCivil && _viewModel.personDto != null && _viewModel.personDto!.pID != null && _viewModel.personDto!.pID!.isNotEmpty){
      // _buildPersonDetail()

      // if(!AppConstant.isMockUser && (_viewModel.idcDto == null || _viewModel.idcDto.pID == null || _viewModel.idcDto.pID.isEmpty)){
      //   if(_nowRequestIdc) return;
      //   _nowRequestIdc = true;
      //   await _viewModel.requestIdc();
      //   Fluttertoast.showToast(msg: "โหลดข้อมูล 'รายละเอียดบัตร' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
      // }

      if(!AppConstant.isMockUser && (_viewModel.houseDto == null || _viewModel.houseDto!.houseID == null || _viewModel.houseDto!.houseID!.isEmpty)){
        if(_nowRequestHouse) return;
        _nowRequestHouse = true;
        await _viewModel.requestHouse();
        if(_viewModel.houseDto!=null) {
          Fluttertoast.showToast(msg: "โหลดข้อมูล 'ที่อยู่' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
        }
      }

    }
    // else if(_viewModel.category == AppConstant.dbOuterPersonForeign && _viewModel.workerDto != null && _viewModel.workerDto.workerID != null && _viewModel.workerDto.workerID.isNotEmpty){
    //   // _buildWorkerDetail()
    //   if(!AppConstant.isMockUser && (_viewModel.workerImageDto == null || _viewModel.workerImageDto.image == null || _viewModel.workerImageDto.image.isEmpty)){
    //     if(_nowRequestWorkerImage) return;
    //     _nowRequestWorkerImage = true;
    //     _viewModel.requestWorkerImage();
    //   }
    //
    // }
    else if(_viewModel.category == AppConstant.dbOuterPersonLinkage && _viewModel.personLkDto != null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty) {
      // _buildPersonLkDetail()
      // if(!AppConstant.isMockUser && (_viewModel.personLkImageDto == null || _viewModel.personLkImageDto.image == null || _viewModel.personLkImageDto.image.isEmpty)){
      //   if(_nowRequestPersonLkImage) return;
      //   _nowRequestPersonLkImage = true;
      //   _viewModel.requestPersonLkImage();
      // }
      if(!AppConstant.isMockUser && (_viewModel.makeCardLkDto == null || _viewModel.makeCardLkDto!.documentNumber == null || _viewModel.makeCardLkDto!.documentNumber!.isEmpty)){
        if(_nowRequestMakeCardLk) return;
        _nowRequestMakeCardLk = true;
        await _viewModel.requestMakeCardLk();
        if(_viewModel.makeCardLkDto!=null) {
          Fluttertoast.showToast(msg: "โหลดข้อมูล 'การทำบัตร' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
        }
      }
      if(!AppConstant.isMockUser && (_viewModel.houseLkDto == null || _viewModel.houseLkDto!.houseID == null || _viewModel.houseLkDto!.houseID!.isEmpty)){
        if(_nowRequestHouseLk) return;
        _nowRequestHouseLk = true;
        await _viewModel.requestHouseLk();
        if(_viewModel.houseLkDto!=null) {
          Fluttertoast.showToast(msg: "โหลดข้อมูล 'ที่อยู่' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
        }
      }

    }
    else if(_viewModel.category == AppConstant.dbOuterPersonAlien && _viewModel.alienPersonDto != null && _viewModel.alienPersonDto!.personalID != null && _viewModel.alienPersonDto!.personalID!.isNotEmpty) {
      if(!AppConstant.isMockUser && (_viewModel.houseLkDto == null || _viewModel.houseLkDto!.houseID == null || _viewModel.houseLkDto!.houseID!.isEmpty)){
        if(_nowRequestHouseLk) return;
        _nowRequestHouseLk = true;
        await _viewModel.requestAlienHouseLk();
        if(_viewModel.houseLkDto!=null) {
          Fluttertoast.showToast(msg: "โหลดข้อมูล 'ที่อยู่' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
        }
      }

    }
    else if(_viewModel.category == AppConstant.dbOuterPersonSocialEmployee && _viewModel.employmentDto != null && _viewModel.employmentDto!.ssoNum != null && _viewModel.employmentDto!.ssoNum!.isNotEmpty){
      // _buildEmploymentDetail()
      if(_viewModel.hospitalDto == null || _viewModel.hospitalDto!.hospitalCode == null || _viewModel.hospitalDto!.hospitalCode!.isEmpty){
        if(_nowRequestHospital) return;
        _nowRequestHospital = true;
        await _viewModel.requestHospital();
        if(_viewModel.hospitalDto!=null) {
          Fluttertoast.showToast(msg: "โหลดข้อมูล 'สถานพยาบาล' เพิ่มเติมเรียบร้อย", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
        }

      }
      // if(!AppConstant.isMockUser && (_viewModel.employerDto == null || _viewModel.employerDto.accNo == null || _viewModel.employerDto.accNo.isEmpty)){
      //   if(_nowRequestEmployer) return;
      //   _nowRequestEmployer = true;
      //   _viewModel.requestEmployer();
      // }

    }
    // else if(_viewModel.category == AppConstant.dbOuterPersonImmigration && _viewModel.travelDto != null && _viewModel.travelDto.tMRunNo != null && _viewModel.travelDto.tMRunNo.isNotEmpty) {
    //   // _buildTravelDetail()
    //   if(!AppConstant.isMockUser && (_viewModel.travelVisaDto == null || _viewModel.travelVisaDto.convregno == null || _viewModel.travelVisaDto.convregno.isEmpty)){
    //     if(_nowRequestTravelVisa) return;
    //     _nowRequestTravelVisa = true;
    //     _viewModel.requestTravelVisa();
    //   }
    //
    // }
    // else if(_viewModel.category == AppConstant.dbOuterPersonPrisoner && _viewModel.prisonerDto != null && _viewModel.prisonerDto.image != null && _viewModel.prisonerDto.image.isNotEmpty && _viewModel.prisonerDto.prisonerId != null && _viewModel.prisonerDto.prisonerId.isNotEmpty){
    //   // _buildPrisonerDetail()
    //   if(!AppConstant.isMockUser && (_viewModel.prisonerImageDto == null || _viewModel.prisonerImageDto.image == null || _viewModel.prisonerImageDto.image.isEmpty)){
    //     if(_nowRequestPrisonerImage) return;
    //     _nowRequestPrisonerImage = true;
    //     _viewModel.requestPrisonerImage();
    //   }
    //
    // }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.primaryColor,
      body: Observer(
        builder: (_) => StatusAwareContainer(
          _viewModel.status,
          showError: _viewModel.showError,
          idle: _buildLayout(),
          error: Stack(children: [
            _buildError(),
          ]),
          // onRetry: _refreshDB,
        ),
      ),
    );
  }

  Widget _buildLayout() => Container(
    decoration: getBg(),
    child: Column(
      children: <Widget>[
        _buildAppBar('ผลการสืบค้น'),
        Expanded(
          child: Container(
            color: AppColor.white_bg,
            child: Column(
              children: [
                _buildMainContent(),
                if(!AppConstant.isMockUser)
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
            onTap: (){
              _backToHomeScreen();
            },
            child: Container(
              width: 45.w,
              child: Center(
                child: Image.asset(AppImage.ic_home, fit: BoxFit.contain, width: 24.w, height: 45.h),
              ),
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
        key: scrollKey,
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16.h,),
            Text(
              '${_getFormTitle()}',
              style: TextStyles.titleBold.copyWith(color: Colors.black),
            ),
            // if(_viewModel.category == AppConstant.dbOuterPersonImmigration && _viewModel.travelDto != null && _viewModel.travelDto!.tMRunNo != null && _viewModel.travelDto!.tMRunNo!.isNotEmpty)
            //   _buildTravelVisaImage(),
            if(_viewModel.category == AppConstant.dbOuterPersonCivil && _viewModel.personDto != null && _viewModel.personDto!.pID != null && _viewModel.personDto!.pID!.isNotEmpty)
              _buildIdcImage(),
            if(_viewModel.category == AppConstant.dbOuterPersonPrisoner && _viewModel.prisonerDto != null && _viewModel.prisonerDto!.image != null && _viewModel.prisonerDto!.image!.isNotEmpty && _viewModel.prisonerDto!.prisonerId != null && _viewModel.prisonerDto!.prisonerId!.isNotEmpty)
              _buildPrisonerDetail(),
            if(_viewModel.category == AppConstant.dbOuterPersonLinkage && _viewModel.personLkDto != null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
              _buildPersonLkImage(),
            if(_viewModel.category == AppConstant.dbInnerPersonFaceRec && _viewModel.personLkDto != null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
              _buildPersonLkImage(),
            if(_viewModel.category == AppConstant.dbOuterPersonForeign && _viewModel.workerDto != null && _viewModel.workerDto!.workerID != null && _viewModel.workerDto!.workerID!.isNotEmpty)
              _buildWorkerDetail(),
            if(_viewModel.category == AppConstant.dbOuterPersonAlien && _viewModel.alienPersonDto != null && _viewModel.alienPersonDto!.personalID != null && _viewModel.alienPersonDto!.personalID!.isNotEmpty)
              _buildAlienPersonImage(),
            if(_viewModel.category == AppConstant.dbOuterPersonWorker && _viewModel.alienWorkerDto != null && _viewModel.alienWorkerDto!.personalID != null && _viewModel.alienWorkerDto!.personalID!.isNotEmpty)
              _buildAlienWorkerImage(),
            if(_viewModel.category == AppConstant.dbOuterPersonNonThai && _viewModel.personNonThaiDto != null && _viewModel.personNonThaiDto!.personalID != null && _viewModel.personNonThaiDto!.personalID!.isNotEmpty)
              _buildPersonNonThaiImage(),
            if(_viewModel.category == AppConstant.dbOuterPersonNoRegis && _viewModel.personNoRegisDto != null && _viewModel.personNoRegisDto!.personalID != null && _viewModel.personNoRegisDto!.personalID!.isNotEmpty)
              _buildPersonNoRegisImage(),
            if(_viewModel.category == AppConstant.dbOuterPersonExtension && _viewModel.extensionDto != null && _viewModel.extensionDto!.livephoto != null && _viewModel.extensionDto!.livephoto!.isNotEmpty)
              _buildExtensionImage(),

            for(int i=0; i<_viewModel.result.formArray!.length; i++)
              _buildFormDetail(_viewModel.result.formArray![i]),

            if(_viewModel.category == AppConstant.dbInnerPersonHasAya && _viewModel.warrantDto != null && _viewModel.warrantDto!.orgCode != null )
              _buildWarrantCase(),
            if(_viewModel.category == AppConstant.dbInnerPersonWarrantCRD && _viewModel.warrantCRDDto != null && _viewModel.warrantCRDDto!.warrant_doc != null && _viewModel.warrantCRDDto!.warrant_doc!.isNotEmpty )
              _buildWarrantCRD(),
            if(_viewModel.category == AppConstant.dbInnerPersonWarrantCourtCRD && _viewModel.warrantCourtCRDDto != null && _viewModel.warrantCourtCRDDto!.warrant_doc != null && _viewModel.warrantCourtCRDDto!.warrant_doc!.isNotEmpty)
              _buildWarrantCourtCRD(),
            if(_viewModel.category == AppConstant.dbOuterPersonCivil && _viewModel.personDto != null && _viewModel.personDto!.pID != null && _viewModel.personDto!.pID!.isNotEmpty)
              _buildPersonDetail(),
            if(_viewModel.category == AppConstant.dbOuterPersonLinkage && _viewModel.personLkDto != null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
              _buildPersonLkDetail(),
            // if(_viewModel.category == AppConstant.dbInnerPersonFaceRec && _viewModel.personLkDto != null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
            if(_viewModel.category == AppConstant.dbInnerPersonFaceRec && _viewModel.personLkDto != null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
            //_buildPersonLkDetail(),
              _buildFaceRecPersonLkDetail(),
            if(_viewModel.category == AppConstant.dbOuterPersonAlien && _viewModel.alienPersonDto != null && _viewModel.alienPersonDto!.personalID != null && _viewModel.alienPersonDto!.personalID!.isNotEmpty)
              _buildAlienPersonDetail(),
            if(_viewModel.category == AppConstant.dbOuterPersonSocialEmployee && _viewModel.employmentDto != null && _viewModel.employmentDto!.ssoNum != null && _viewModel.employmentDto!.ssoNum!.isNotEmpty)
              _buildEmploymentDetail(),
            // if(_viewModel.category == AppConstant.dbOuterPersonImmigration && _viewModel.travelDto != null && _viewModel.travelDto!.tMRunNo != null && _viewModel.travelDto!.tMRunNo!.isNotEmpty)
            //   _buildTravelDetail(),
            if(_viewModel.category == AppConstant.dbInnerCarAya && _viewModel.crimeCaseVehicleDto != null && _viewModel.crimeCaseVehicleDto!.orgCode != null )
              _buildVehicleCrimeCase(),
            if(_viewModel.category == AppConstant.dbInnerCarTraffic && _viewModel.trafficCaseVehicleDto != null && _viewModel.trafficCaseVehicleDto!.orgCode != null )
              _buildVehicleTrafficCase(),

            SizedBox(height: 32.h,),
          ],
        ),
      ),
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
            offset: Offset(0.0, -2.0)// changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.all(24.w),
      child: PrimaryCustomButton(
        'แสดงรายงาน',
        onPressed: () =>  _download(),
        icon: AppImage.ic_report,
      ),
    ),
  );


  Widget _buildTitle(String title) => Container(
    padding: EdgeInsets.symmetric(vertical: 16.h),
    child: Text(
      '${title}',
      style: TextStyles.bodyBold.copyWith(color: Colors.black),
    ),
  );

  Widget _buildActionTitle(String title,Function action,Function isExpanded) => Container(
    padding: EdgeInsets.symmetric(vertical: 16.h),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        onTap: (){
          action();
        },
        child:Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
                children : [
                  Text(
                    title,
                    style: TextStyles.bodyBold.copyWith(color: Colors.black,decoration: TextDecoration.underline),
                  ),
                  Expanded(
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Text(
                            (isExpanded())? "" : "ดูรายละเอียด",
                            style: TextStyles.bodyBold.copyWith(color: Colors.grey,fontSize: 12),
                          ),
                          (isExpanded())?
                          Image.asset(AppImage.ic_chevron_right, fit: BoxFit.contain)
                              :
                          Image.asset(AppImage.ic_chevron_down, fit: BoxFit.contain)
                          ,
                        ]
                    ),
                  ),
                ]
            )
        ),
      ),
    ),
  );

  // --- START Civil ------
  Widget _buildPersonDetail() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          _buildIdcDetail(),
        //   SizedBox(height: 10.h,),
        // if(_viewModel.personDto!=null && _viewModel.personDto.houseID != null && _viewModel.personDto.houseID.isNotEmpty)
        //   //_buildTitle("ข้อมูลที่อยู่"),
        //   _buildActionTitle("ข้อมูลที่อยู่", _viewModel.requestHouse, isExpandHouseDetail),
        // if(_viewModel.houseDto != null && _viewModel.houseDto.houseID != null && _viewModel.houseDto.houseID.isNotEmpty)
        //   for(int i=0; i<_viewModel.houseDetails.length; i++)
        //     _buildFormDetail(_viewModel.houseDetails[i]),

        // if(!AppConstant.isMockUser && (_viewModel.houseDto == null || _viewModel.houseDto.houseID == null || _viewModel.houseDto.houseID.isEmpty))
        //   PrimaryCustomButton(
        //     "แสดงข้อมูลที่อยู่",
        //     onPressed: () => _viewModel.requestHouse(),
        //   ),
      ],
    ),
  );

  Widget _buildIdcDetail() => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.personDto!=null && _viewModel.personDto!.pID != null && _viewModel.personDto!.pID!.isNotEmpty)
          //_buildTitle("ข้อมูลบัตร"),
          _buildActionTitle("ข้อมูลบัตรล่าสุด", _viewModel.requestIdc, isExpandIdcDetail),
        if(_viewModel.idcDetails!=null)
          for(int i=0; i<_viewModel.idcDetails!.length; i++)
            _buildFormDetail(_viewModel.idcDetails![i]),
        // if(!AppConstant.isMockUser && (_viewModel.idcDto == null || _viewModel.idcDto.pID == null || _viewModel.idcDto.pID.isEmpty))
        //   PrimaryCustomButton(
        //     "แสดงข้อมูลบัตร",
        //     onPressed: () => _viewModel.requestIdc(),
        //   ),
      ],
    ),
  );

  Widget _buildIdcImage() => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if(_viewModel.personImageDto != null && _viewModel.personImageDto!.image != null && _viewModel.personImageDto!.image!.isNotEmpty && _viewModel.personImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.personImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.personImageDto == null || _viewModel.personImageDto!.image == null || _viewModel.personImageDto!.image!.isEmpty || _viewModel.personImageBytes == null || _viewModel.personImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestImageIdc(),
          ),
      ],
    ),
  );

  bool isExpandIdcDetail(){
    return (_viewModel.idcDto != null && _viewModel.idcDto!.pID != null && _viewModel.idcDto!.pID!.isNotEmpty);
  }
  bool isExpandHouseDetail(){
    return (_viewModel.houseDto != null && _viewModel.houseDto!.houseID != null && _viewModel.houseDto!.houseID!.isNotEmpty);
  }
  // --- END Civil ------

  // --- START Foreign ------
  Widget _buildWorkerDetail() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.workerImageDto != null && _viewModel.workerImageDto!.image != null && _viewModel.workerImageDto!.image!.isNotEmpty && _viewModel.workerImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.workerImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.workerImageDto == null || _viewModel.workerImageDto!.image == null || _viewModel.workerImageDto!.image!.isEmpty || _viewModel.workerImageBytes == null || _viewModel.workerImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestWorkerImage(),
          ),
      ],
    ),
  );
  // --- END Foreign ------

  // --- START Foreign ------
  Widget _buildPrisonerDetail() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.prisonerImageDto != null && _viewModel.prisonerImageDto!.image != null && _viewModel.prisonerImageDto!.image!.isNotEmpty && _viewModel.prisonerImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.prisonerImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.prisonerImageDto == null || _viewModel.prisonerImageDto!.image == null || _viewModel.prisonerImageDto!.image!.isEmpty || _viewModel.prisonerImageBytes == null || _viewModel.prisonerImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestPrisonerImage(),
          ),
      ],
    ),
  );
  // --- END Foreign ------

  // --- START Linkage ------
  Widget _buildPersonLkDetail() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if(_viewModel.personLkDto!=null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
          _buildActionTitle("ข้อมูลที่อยู่",_viewModel.requestHouseLk,isExpandHouseLk),
        if(_viewModel.houseLkDto != null && _viewModel.houseLkDto!.houseID != null && _viewModel.houseLkDto!.houseID!.isNotEmpty)
          for(int i=0; i<_viewModel.houseLkDetails!.length; i++)
            _buildFormDetail(_viewModel.houseLkDetails![i]),
        // if(!AppConstant.isMockUser && (_viewModel.houseLkDto == null || _viewModel.houseLkDto.houseID == null || _viewModel.houseLkDto.houseID.isEmpty))
        //   PrimaryCustomButton(
        //     "แสดงข้อมูลที่อยู่",
        //     onPressed: () => _viewModel.requestHouseLk(),
        //   ),

        SizedBox(height: 10.h,),

        if(_viewModel.personLkDto!=null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
          _buildActionTitle("ข้อมูลบัตรล่าสุด", _viewModel.requestMakeCardLk, isExpandMakeCardLk),
        if(_viewModel.makeCardLkDto != null && _viewModel.makeCardLkDto!.documentNumber != null && _viewModel.makeCardLkDto!.documentNumber!.isNotEmpty)
          for(int i=0; i<_viewModel.makeCardLkDetails!.length; i++)
            _buildFormDetail(_viewModel.makeCardLkDetails![i]),
        // if(!AppConstant.isMockUser && (_viewModel.makeCardLkDto == null || _viewModel.makeCardLkDto.documentNumber == null || _viewModel.makeCardLkDto.documentNumber.isEmpty))
        //   PrimaryCustomButton(
        //     "แสดงข้อมูลบัตร",
        //     onPressed: () => _viewModel.requestMakeCardLk(),
        //   ),


      ],
    ),
  );

  // Face Rec
  Widget _buildFaceRecPersonLkDetail() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.personLkDto!=null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
          _buildActionTitle("ข้อมูลทะเบียนราษฎร", _viewModel.requestPersonLk, isExpandPersonLk),
          for(int i=0; i<_viewModel.personLkDetails!.length; i++)
            _buildFormDetail(_viewModel.personLkDetails![i]),
          _buildActionTitle("ข้อมูลที่อยู่", _viewModel.requestHouseLk, isExpandHouseLk),
        if(_viewModel.houseLkDto != null && _viewModel.houseLkDto!.houseID != null && _viewModel.houseLkDto!.houseID!.isNotEmpty)
          for(int i=0; i<_viewModel.houseLkDetails!.length; i++)
            _buildFormDetail(_viewModel.houseLkDetails![i]),

        // SizedBox(height: 10.h,),

        if(_viewModel.personLkDto!=null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty)
          _buildActionTitle("ข้อมูลบัตรล่าสุด", _viewModel.requestMakeCardLk, isExpandMakeCardLk),
        if(_viewModel.makeCardLkDto != null && _viewModel.makeCardLkDto!.documentNumber != null && _viewModel.makeCardLkDto!.documentNumber!.isNotEmpty)
          for(int i=0; i<_viewModel.makeCardLkDetails!.length; i++)
            _buildFormDetail(_viewModel.makeCardLkDetails![i]),

      ],
    ),
  );

  Widget _buildPersonLkImage() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.personLkImageDto != null && _viewModel.personLkImageDto!.image != null && _viewModel.personLkImageDto!.image!.isNotEmpty && _viewModel.personLkImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.personLkImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.personLkImageDto == null || _viewModel.personLkImageDto!.image == null || _viewModel.personLkImageDto!.image!.isEmpty || _viewModel.personLkImageBytes == null || _viewModel.personLkImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestPersonLkImage(),
          ),
        SizedBox(height: 10.h,),
      ],
    ),
  );

  bool isExpandMakeCardLk(){
    return (_viewModel.makeCardLkDto != null && _viewModel.makeCardLkDto!.documentNumber != null && _viewModel.makeCardLkDto!.documentNumber!.isNotEmpty);
  }
  bool isExpandHouseLk(){
    return (_viewModel.houseLkDto != null && _viewModel.houseLkDto!.houseID != null && _viewModel.houseLkDto!.houseID!.isNotEmpty);
  }
  bool isExpandPersonLk(){
    return (_viewModel.personLkDto != null && _viewModel.personLkDto!.pid != null && _viewModel.personLkDto!.pid!.isNotEmpty);
  }

  //AlienPerson
  Widget _buildAlienPersonDetail() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if(_viewModel.alienPersonDto!=null && _viewModel.alienPersonDto!.personalID != null && _viewModel.alienPersonDto!.personalID!.isNotEmpty)
          _buildActionTitle("ข้อมูลที่อยู่",_viewModel.requestHouseLk,isExpandHouseLk),
        if(_viewModel.houseLkDto != null && _viewModel.houseLkDto!.houseID != null && _viewModel.houseLkDto!.houseID!.isNotEmpty)
          for(int i=0; i<_viewModel.houseLkDetails!.length; i++)
            _buildFormDetail(_viewModel.houseLkDetails![i]),

        SizedBox(height: 10.h,),

      ],
    ),
  );

  Widget _buildAlienPersonImage() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.alienPersonImageDto != null && _viewModel.alienPersonImageDto!.image != null && _viewModel.alienPersonImageDto!.image!.isNotEmpty && _viewModel.alienPersonImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.alienPersonImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.alienPersonImageDto == null || _viewModel.alienPersonImageDto!.image == null || _viewModel.alienPersonImageDto!.image!.isEmpty || _viewModel.alienPersonImageBytes == null || _viewModel.alienPersonImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestAlienPersonImage(),
          ),
        SizedBox(height: 10.h,),

      ],
    ),
  );


  //AlienWorker
  Widget _buildAlienWorkerImage() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.alienWorkerImageDto != null && _viewModel.alienWorkerImageDto!.image != null && _viewModel.alienWorkerImageDto!.image!.isNotEmpty && _viewModel.alienWorkerImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.alienWorkerImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.alienWorkerImageDto == null || _viewModel.alienWorkerImageDto!.image == null || _viewModel.alienWorkerImageDto!.image!.isEmpty || _viewModel.alienWorkerImageBytes == null || _viewModel.alienWorkerImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestAlienWorkerImage(),
          ),
        SizedBox(height: 10.h,),
      ],
    ),
  );

  //PersonNonThai
  Widget _buildPersonNonThaiImage() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.personNonThaiImageDto != null && _viewModel.personNonThaiImageDto!.image != null && _viewModel.personNonThaiImageDto!.image!.isNotEmpty && _viewModel.personNonThaiImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.personNonThaiImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.personNonThaiImageDto == null || _viewModel.personNonThaiImageDto!.image == null || _viewModel.personNonThaiImageDto!.image!.isEmpty || _viewModel.personNonThaiImageBytes == null || _viewModel.personNonThaiImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestPersonNonThaiImage(),
          ),
        SizedBox(height: 10.h,),
      ],
    ),
  );

  //PersonNoRegis
  Widget _buildPersonNoRegisImage() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.personNoRegisImageDto != null && _viewModel.personNoRegisImageDto!.image != null && _viewModel.personNoRegisImageDto!.image!.isNotEmpty && _viewModel.personNoRegisImageBytes != null)
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Image.memory(
                _viewModel.personNoRegisImageBytes!,
                height: 200.h,
              ),
            ),
          ),
        if(!AppConstant.isMockUser && (_viewModel.personNoRegisImageDto == null || _viewModel.personNoRegisImageDto!.image == null || _viewModel.personNoRegisImageDto!.image!.isEmpty || _viewModel.personNoRegisImageBytes == null || _viewModel.personNoRegisImageBytes!.length == 0))
          PrimaryCustomButton(
            "แสดงรูปภาพ",
            onPressed: () => _viewModel.requestPersonNoRegisImage(),
          ),
        SizedBox(height: 10.h,),
      ],
    ),
  );


  // --- END Linkage ------

  // --- START Social ------
  Widget _buildEmploymentDetail() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.employmentDto!=null && _viewModel.employmentDto!.ssoNum != null && _viewModel.employmentDto!.ssoNum!.isNotEmpty)
          _buildActionTitle("ข้อมูลสถานพยาบาล", _viewModel.requestHospital, isExpandHospital),
        if(_viewModel.hospitalDto != null && _viewModel.hospitalDto!.hospitalCode != null && _viewModel.hospitalDto!.hospitalCode!.isNotEmpty)
          for(int i=0; i<_viewModel.hospitalDetails!.length; i++)
            _buildFormDetail(_viewModel.hospitalDetails![i]),
        // if(!AppConstant.isMockUser && (_viewModel.hospitalDto == null || _viewModel.hospitalDto.hospitalCode == null || _viewModel.hospitalDto.hospitalCode.isEmpty))
        //   PrimaryCustomButton(
        //     "แสดงข้อมูลสถานพยาบาล",
        //     onPressed: () => _viewModel.requestHospital(),
        //   ),
        SizedBox(height: 10.h,),

        if(_viewModel.employmentDto!=null && _viewModel.employmentDto!.accNo != null && _viewModel.employmentDto!.accNo!.isNotEmpty
            && _viewModel.employmentDto!.accBran != null && _viewModel.employmentDto!.accBran!.isNotEmpty)
          _buildActionTitle("ข้อมูลนายจ้าง", _viewModel.requestEmployer, isExpandEmployer),
        if(_viewModel.employerDto != null && _viewModel.employerDto!.accNo != null && _viewModel.employerDto!.accNo!.isNotEmpty)
          for(int i=0; i<_viewModel.employerDetails!.length; i++)
            _buildFormDetail(_viewModel.employerDetails![i]),
        // if(!AppConstant.isMockUser && (_viewModel.employerDto == null || _viewModel.employerDto.accNo == null || _viewModel.employerDto.accNo.isEmpty))
        //   PrimaryCustomButton(
        //     "แสดงข้อมูลนายจ้าง",
        //     onPressed: () => _viewModel.requestEmployer(),
        //   ),
      ],
    ),
  );

  bool isExpandHospital(){
    return (_viewModel.hospitalDto != null && _viewModel.hospitalDto!.hospitalCode != null && _viewModel.hospitalDto!.hospitalCode!.isNotEmpty);
  }
  bool isExpandEmployer(){
    return (_viewModel.employerDto != null && _viewModel.employerDto!.accNo != null && _viewModel.employerDto!.accNo!.isNotEmpty);
  }
  // --- END Social ------

  // --- START Travel ------
  // Widget _buildTravelDetail() => Container(
  //   padding: EdgeInsets.symmetric(vertical: 10.h,),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       if(_viewModel.travelDto != null && _viewModel.travelDto!.isInputPassport!=null && _viewModel.travelDto!.isInputPassport!)
  //         _buildActionTitle("ข้อมูลเพิ่มเติม", _viewModel.requestTravelVisa, isExpandTravelVisa),
  //       if(_viewModel.travelVisaDto != null && _viewModel.travelVisaDto!.convregno != null && _viewModel.travelVisaDto!.convregno!.isNotEmpty)
  //         _buildTravelVisaDetail(),
  //     ],
  //   ),
  // );
  //
  // Widget _buildTravelVisaDetail() => Container(
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       if(_viewModel.travelVisaDetails != null)
  //         for(int i=0; i<_viewModel.travelVisaDetails!.length; i++)
  //           _buildFormDetail(_viewModel.travelVisaDetails![i]),
  //     ],
  //   ),
  // );
  // Widget _buildTravelVisaImage() => Container(
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //
  //       if(_viewModel.travelVisaDto != null && _viewModel.travelVisaDto!.img != null && _viewModel.travelVisaDto!.img!.isNotEmpty && _viewModel.travelImageBytes != null)
  //         Container(
  //           padding: EdgeInsets.only(top: 10.h),
  //           child: Center(
  //             child: Image.memory(
  //               _viewModel.travelImageBytes!,
  //               height: 200.h,
  //             ),
  //           ),
  //         ),
  //       SizedBox(height: 10.h,),
  //     ],
  //   ),
  // );
  // // --- END Travel ------
  // bool isExpandTravelVisa(){//true expanded
  //   return _viewModel.travelVisaDetails != null;
  // }

  // --- START Extension ------ // TR9055818
  Widget _buildExtensionImage() => FutureBuilder<void>(
    future: _viewModel.decodeExtensionImage(),
    builder: (context, snapshot) {
      // if (snapshot.connectionState == ConnectionState.waiting) {
      //   return Center(child: CircularProgressIndicator());
      // }

      final imageBytes = _viewModel.extensionImageBytes;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_viewModel.extensionDto != null &&
              _viewModel.extensionDto!.livephoto != null &&
              _viewModel.extensionDto!.livephoto!.isNotEmpty &&
              imageBytes != null &&
              imageBytes.isNotEmpty)
            Container(
              padding: EdgeInsets.only(top: 10.h),
              child: Center(
                child: Image.memory(
                  imageBytes,
                  height: 200.h,
                ),
              ),
            )
          // else
          //   Center(
          //     child: Text(
          //       'ไม่พบข้อมูลรูปภาพ',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //   ),
          //
          // // ส่วนอื่น ๆ ที่คุณต้องการให้แสดง "ถัดจากรูป"
          // SizedBox(height: 20.h),
          // Text(
          //   'ข้อความที่ต้องการแสดงด้านล่างรูปภาพ',
          //   style: TextStyle(fontSize: 16.sp),
          // ),
        ],
      );
    },
  );


  // TR9055818
  // Widget _buildExtensionImage() {
  //   print('🔍 _buildExtensionImage called');
  //   return FutureBuilder<void>(
  //     future: _viewModel.decodeExtensionImage(),
  //     builder: (context, snapshot) {
  //       // print('🔄 snapshot: ${snapshot.connectionState}'); // ดู state ของ future
  //       // if (snapshot.connectionState == ConnectionState.waiting) {
  //       //   return Center(child: CircularProgressIndicator()); // หรือ loading widget อื่น
  //       // }
  //
  //       final imageBytes = _viewModel.extensionImageBytes;
  //
  //       return Container(
  //         padding: EdgeInsets.symmetric(vertical: 10.h),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             if (imageBytes != null && imageBytes.isNotEmpty)
  //               Padding(
  //                 padding: EdgeInsets.only(top: 10.h),
  //                 child: Center(
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Image.memory(
  //                         imageBytes,
  //                         height: 200.h,
  //                         fit: BoxFit.contain,
  //                       ),
  //                       // SizedBox(height: 10.h),
  //                       // Text(
  //                       //   'ข้อความที่คุณต้องการแสดง',
  //                       //   style: TextStyle(
  //                       //     color: Colors.black,
  //                       //     fontSize: 16.sp,
  //                       //   ),
  //                       // ),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             // else
  //             //   Center(
  //             //     child: Column(
  //             //       mainAxisSize: MainAxisSize.min,
  //             //       children: [
  //             //         Text(
  //             //           'ไม่พบข้อมูลรูปภาพ',
  //             //           style: TextStyle(color: Colors.grey),
  //             //         ),
  //             //         SizedBox(height: 10.h),
  //             //         Text(
  //             //           'กรุณาตรวจสอบข้อมูลอีกครั้ง',
  //             //           style: TextStyle(color: Colors.red),
  //             //         ),
  //             //       ],
  //             //     ),
  //             //   ),
  //             // SizedBox(height: 10.h),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  // --- END Extension ------

  // --- START WarrantCaseDetail ------
  Widget _buildWarrantCase() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.warrantDto != null && _viewModel.warrantDto!.orgCode != null && _viewModel.warrantDto!.orgCode!.isNotEmpty)
          _buildActionTitle("ข้อมูลรายละเอียดคดี${_viewModel.warrantDto!.caseType}", _viewModel.requestWarrantCaseDetail, isExpandedWarrantCaseDetail),
        if(_viewModel.warrantDto != null && _viewModel.warrantDto!.orgCode != null && _viewModel.warrantDto!.orgCode!.isNotEmpty)
          _buildWarrantCaseDetail(),
        if(!AppConstant.isMockUser && (_viewModel.warrantDto != null ))
          Container(
              padding: EdgeInsets.only(top:5.h),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  if(_viewModel.warrantDto!.wrFileId != null && _viewModel.warrantDto!.wrFileId!.isNotEmpty && _viewModel.warrantDto!.wrFileId != '' && _viewModel.warrantDto!.wrFileId != '-')
                    PrimaryCustomButton(
                      "ดาวน์โหลดหมายจับ",
                      onPressed: () => _downloadWarrant(),
                      icon: AppImage.ic_download,
                      isFullWidth:false,
                      padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      //isEnabled:
                    )
                  else
                    SecondaryCustomButton(
                      "ดาวน์โหลดหมายจับ",
                      onPressed: () => _openDialogDetail("ดาวน์โหลดหมายจับ", "ไม่พบข้อมูลไฟล์หมายจับในระบบ"),
                      icon: AppImage.ic_download,
                      isFullWidth:false,
                      padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      //isEnabled:
                    )
                  ,
                ],
              )
          )
      ],
    ),
  );

  void _openPdfBase64(Uint8List pdfBytes) {
    // เปิด PDF โดยใช้ SfPdfViewer.memory
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          //appBar: AppBar(title: Text("หมายจับ")),
          //body: SfPdfViewer.memory(pdfBytes),
          body: Container(
            decoration: getBg(),
            child: Column(
              children: <Widget>[
                //_buildAppBar('ผลการสืบค้น'),
                Container(
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
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: (){},
                          child: Container(
                            width: 45.w,
                            // child: Center(
                            //   child: Image.asset(AppImage.ic_home, fit: BoxFit.contain, width: 24.w, height: 45.h),
                            // ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "หมายจับ",
                            style: TextStyles.titleBold.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: (){
                            _downloadBase64(pdfBytes); // new function
                            // _launchURL(createDownloadUrl(pdfBytes));
                          },
                          child: Container(
                            width: 45.w,
                            child: Center(
                              child: Image.asset(AppImage.ic_print, fit: BoxFit.contain, width: 30.w, height: 45.h),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: (){
                            _backToHomeScreen();
                          },
                          child: Container(
                            width: 45.w,
                            child: Center(
                              child: Image.asset(AppImage.ic_home, fit: BoxFit.contain, width: 24.w, height: 45.h),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      color: AppColor.white_bg,
                      child: SfPdfViewer.memory(pdfBytes)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- START _buildWarrantCRD ------
  Widget _buildWarrantCRD() => Container(

    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(!AppConstant.isMockUser && (_viewModel.warrantCRDDto != null ))
          Container(
              padding: EdgeInsets.only(top:5.h),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  if(_viewModel.warrantCRDDto!.warrant_doc != null && _viewModel.warrantCRDDto!.warrant_doc!.isNotEmpty)
                    PrimaryCustomButton(
                      "ดาวน์โหลดหมายจับ",
                      onPressed: () => _downloadWarrantCRDBase64(),
                      icon: AppImage.ic_download,
                      isFullWidth:false,
                      padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      //isEnabled:
                    )
                  // else
                  //   SecondaryCustomButton(
                  //     "ดาวน์โหลดหมายจับ",
                  //     onPressed: () => _openDialogDetail("ดาวน์โหลดหมายจับ", "ไม่พบข้อมูลไฟล์หมายจับในระบบ"),
                  //     icon: AppImage.ic_download,
                  //     isFullWidth:false,
                  //     padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                  //     //isEnabled:
                  //   )
                  // ,
                ],
              )
          )
      ],
    ),
  );

  // --- START _buildWarrantCourtCRD ------ //3530800488172
  Widget _buildWarrantCourtCRD() => Container(

    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(!AppConstant.isMockUser && (_viewModel.warrantCourtCRDDto != null ))
          Container(
              padding: EdgeInsets.only(top:5.h),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  if(_viewModel.warrantCourtCRDDto!.warrant_doc != null && _viewModel.warrantCourtCRDDto!.warrant_doc!.isNotEmpty)
                    PrimaryCustomButton(
                      "ดาวน์โหลดหมายจับ",
                      onPressed: () => _downloadWarrantCourtCRDBase64(),
                      icon: AppImage.ic_download,
                      isFullWidth:false,
                      padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                      //isEnabled:
                    )
                  // else
                  //   SecondaryCustomButton(
                  //     "ดาวน์โหลดหมายจับ",
                  //     onPressed: () => _openDialogDetail("ดาวน์โหลดหมายจับ", "ไม่พบข้อมูลไฟล์หมายจับในระบบ"),
                  //     icon: AppImage.ic_download,
                  //     isFullWidth:false,
                  //     padding: EdgeInsets.fromLTRB(10.w,10.h,10.w,10.h),
                  //     //isEnabled:
                  //   )
                  // ,
                ],
              )
          )
      ],
    ),
  );

  Widget _buildWarrantCaseDetail() => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.crimeCaseDetails != null)
          for(int i=0; i<_viewModel.crimeCaseDetails!.length; i++)
            _buildFormDetail(_viewModel.crimeCaseDetails![i]),
        if(_viewModel.trafficCaseDetails != null)
          for(int i=0; i<_viewModel.trafficCaseDetails!.length; i++)
            _buildFormDetail(_viewModel.trafficCaseDetails![i]),
      ],
    ),
  );
  // --- END Travel ------
  bool isExpandedWarrantCaseDetail() {
    return (_viewModel.crimeCaseDetails!=null || _viewModel.trafficCaseDetails!=null);
  }

  Widget _buildDownloadWarrantButton() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
    child: PrimaryCustomButton(
      "ดาวน์โหลดเอกสารหมายจับ",
      onPressed: () => _downloadWarrant(),
      icon: AppImage.ic_download,
    ),
  );



  // --- START VehicleCrimeCaseDetail ------
  Widget _buildVehicleCrimeCase() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.crimeCaseVehicleDto != null && _viewModel.crimeCaseVehicleDto!.orgCode != null && _viewModel.crimeCaseVehicleDto!.orgCode!.isNotEmpty)
          _buildActionTitle("ข้อมูลรายละเอียดคดี", _viewModel.requestVehicleCrimeCaseDetail, isExpandedVehicleCrimeCaseDetail),
        if(_viewModel.crimeCaseVehicleDto != null && _viewModel.crimeCaseVehicleDto!.orgCode != null && _viewModel.crimeCaseVehicleDto!.orgCode!.isNotEmpty)
           if(_viewModel.crimeCaseDetails!=null)
            for(int i=0; i<_viewModel.crimeCaseDetails!.length; i++)
              _buildFormDetail(_viewModel.crimeCaseDetails![i]),
      ],
    ),
  );

  bool isExpandedVehicleCrimeCaseDetail() {
    return (_viewModel.crimeCaseDetails!=null);
  }
  // --- END VehicleCaseDetail ------


  // --- START VehicleTrafficCaseDetail ------
  Widget _buildVehicleTrafficCase() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.h,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_viewModel.trafficCaseVehicleDto != null && _viewModel.trafficCaseVehicleDto!.orgCode != null && _viewModel.trafficCaseVehicleDto!.orgCode!.isNotEmpty)
          _buildActionTitle("ข้อมูลรายละเอียดคดี", _viewModel.requestVehicleTrafficCaseDetail, isExpandedVehicleTrafficCaseDetail),
        if(_viewModel.trafficCaseVehicleDto != null && _viewModel.trafficCaseVehicleDto!.orgCode != null && _viewModel.trafficCaseVehicleDto!.orgCode!.isNotEmpty)
          if(_viewModel.trafficCaseDetails!=null)
            for(int i=0; i<_viewModel.trafficCaseDetails!.length; i++)
              _buildFormDetail(_viewModel.trafficCaseDetails![i]),
      ],
    ),
  );

  bool isExpandedVehicleTrafficCaseDetail() {
    return (_viewModel.trafficCaseDetails!=null);
  }
  // --- END VehicleCaseDetail ------


  Widget _buildFormDetail(FormDetail formDetail) => Material(
    color: Colors.transparent,
    child: InkWell(
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      onLongPress: (){
        FlutterClipboard.copy('${formDetail.desc}').then(( value ) =>
            Fluttertoast.showToast(msg: "คัดลอก ${formDetail.desc}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM)
        );
      },
      onTap: (){
        if(formDetail.isShowDialog!=null && formDetail.isShowDialog==true) {
          _openDialogDetail(formDetail.title, formDetail.desc);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${formDetail.title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: formDetail.isHeader! ? TextStyles.bodySemi.copyWith(color: AppColor.grey_text,fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline) : TextStyles.bodySemi.copyWith(color: AppColor.grey_text),
                  ),
                ),
                if(!formDetail.isHeader!)
                  Expanded(
                    child: Text(
                      '${formDetail.desc}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyles.bodySemi.copyWith(color: (formDetail.isAlert!=null && formDetail.isAlert==true) ?Colors.red:Colors.black,
                          decoration: (formDetail.isShowDialog!=null && formDetail.isShowDialog==true)?TextDecoration.underline:TextDecoration.none),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            color: AppColor.grey_line,
            height: 0.5,
            width: double.infinity,
          ),
        ],
      )
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
    }else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    }else if(_viewModel.openGPSDisabled){
      _showDialogGPSRequired();
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
                      ScreenNavigator.navigateTo(Routes.verifyPin, param: VerifyPinScreenParam(true));
                    }
                ),
              )
          )
      );
    }
  }
}
