import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:async/async.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/refresh_event.dart';
import 'package:crimes/main.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/favorite/criteria/favorite_criteria_screen.dart';
import 'package:crimes/screen/favorite/list/favorite_list_screen.dart';
import 'package:crimes/screen/notification/list/notification_list_screen.dart';
import 'package:crimes/screen/permission/permission_screen.dart';
import 'package:crimes/screen/scanqr/scanqr_login_screen.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/main/main_screen_view_model.dart';
import 'package:crimes/screen/search/criteria/search_criteria_screen.dart';
import 'package:crimes/screen/search/scanner/camera_page.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/screen/verify_pin_passcode/verify_pin_passcode_screen.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/custom_notification.dart';
import 'package:crimes/widget/news_info_widget.dart';
import 'package:crimes/widget/profile/profile_image_show_widget.dart';
import 'package:crimes/widget/profile/profile_image_widget.dart';
import 'package:crimes/widget/profile/profile_utils.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_home_enumkey.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_home_widget.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';
import 'package:crimes/screen/term/term_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../scanqr/scanqr_screen.dart';

final GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

class MainScreenParam extends NavigationParameter {
  MainScreenParam(this.userDto, {this.fromCreateFav = false, this.fromEditFav = false});

  final UserDto userDto;
  final bool fromCreateFav;
  final bool fromEditFav;
}

class MainScreen extends StatefulWidget {
  MainScreen(this.param, {Key? key}) : super(key: key);

  final MainScreenParam param;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MainScreenViewModel _viewModel = MainScreenViewModel();

  bool _hasBiometrics = false;
  bool _isEnableBiometrics = false;


  String? _username = "";

  //for tutorial
  TutorHomeWidget? tutorHomeWidget;
  TutorHomeEnumKey tutorKeyHome = new TutorHomeEnumKey();

  //profile image
  StreamController <String> streamProfileImage = StreamController();

  AsyncMemoizer? _memoizer;

  @override
  void initState() {
    _memoizer = AsyncMemoizer();
    _viewModel.setUserDto(widget.param.userDto);

    //init tutorial
    _initTutorial();
    _viewModel.getVersionInfo();
    _viewModel.getEula();
    _viewModel.getNotify();

    if(!AppConstant.isMockUser){
      //_viewModel.getNews();
      _viewModel.refreshFavoriteList();
      _checkGPSEnabled();
      _refreshBiometrics();
      _handleFcm();
      _checkUserExpire();
      eventBus.on<ReceivePushNotiEvent>().listen((event) {
        if(!_isDispose) _parseRemoteMessage(event.message, event.state);
      });

      if(widget.param.fromCreateFav){
        if(!widget.param.fromEditFav) {
          _showToastNotification('เพิ่มรายการโปรดสำเร็จ');
          _viewModel.getPoliceStation();
        }else{
          _openListFavorite(true);
        }
      }else{
        _viewModel.getPoliceStation();
      }
    }else{
      _hasBiometrics = false;
      _isEnableBiometrics = false;

      // TODO: Fix MockUser
      _viewModel.refreshFavoriteList();
      _viewModel.getPoliceStation();
    }

    _initProfileImage();
    eventBus.on<PingSocErrorEvent>().listen((event) {
      if(!_isDispose) {
        _showDialogSSLVPNRequired();
      }
    });

    eventBus.on<OnThaiDLK2Event>().listen((event) {
      if (!_isDispose) _handleOnThaiDLK2Event(event);
    });

    super.initState();
  }

  bool _isDispose = false;
  @override
  void dispose() {
    _isDispose = true;
    streamProfileImage.close();
    // _viewModel.stopTime = true;
    super.dispose();
  }

  _initTutorial(){
    tutorHomeWidget = TutorHomeWidget(mKey: tutorKeyHome, mContext: context,);
  }
  _showTutorial(){
    Future.delayed(Duration(milliseconds: 500), () {
      if(tutorHomeWidget!=null) tutorHomeWidget!.showTutorial(context);
    });
  }

  _initProfileImage() async{
    String? image = await ProfileUtils.getImageProfileBase64();
    if(image!=null) streamProfileImage.sink.add(image);
  }

  Future<void> _onResumed() async {
    await _viewModel.refreshFavoriteList();
  }

  Future<void> _refreshBiometrics() async {
    await _viewModel.refreshBiometrics();
    setState(() {
      _hasBiometrics = _viewModel.hasBiometrics;
      _isEnableBiometrics = _viewModel.isEnableBiometrics;
    });
  }

  Future<void> _checkGPSEnabled() async {
    await _viewModel.checkGPS();
    if(_viewModel.openGPSDisabled){
      _showDialogGPSRequired();
    }
    else{
      _showTutorial();
    }
  }

  Future<void> _handleFcm() async{
    String? token = await FirebaseMessaging.instance.getToken();
    if(token!=null){
      StringUtils.log('token $token');
      _requestUpdatePushToken(token);
    }

    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      StringUtils.log('getInitialMessage !!');
      if(Platform.isIOS) FlutterAppBadger.removeBadge();
      // if(!checkDuplicateMessage(message)) {
        await _parseRemoteMessage(message, AppConstant.pushState_getInitialMessage);
      // }
    }

    FirebaseMessaging.instance.subscribeToTopic("all");
  }

  Future<void> _checkUserExpire() async{
    Future.delayed(Duration(milliseconds: 500), () {
      _showDialogUserExpire();
    });
  }

  Future<void> _parseRemoteMessage(RemoteMessage message, String state) async{
    StringUtils.log("_parseRemoteMessage");
    bool isLogin = await KeyUtils.isLogin();
    if(!isLogin) return;

    StringUtils.log('message.data: ${message.data}');
    String title = message.data['title'];
    String content = message.data['content'];
    String readDate = message.data['read_date'];
    String notifyId = message.data['notify_id'];
    String type =  message.data['type'];  //  "AUTH";   INFO, AUTH
    String url = message.data['url'];     //  "https://www.google.com";
    if(title!=null && title.isNotEmpty){
      NotifyDto notifyDto = NotifyDto(title: title, content: content, readDate: readDate, notifyId: notifyId, type: type, url: url);
      _showToastNotificationDto(notifyDto);
    }
  }

  Future<void> _requestUpdatePushToken(String pushToken) async {
    await _viewModel.requestUpdatePushToken(pushToken);
  }

  void _showToastNotificationDto(NotifyDto notifyDto){
    BotToast.showCustomNotification(
        animationDuration:
        Duration(milliseconds: 200),
        animationReverseDuration: Duration(milliseconds: 200),
        duration: Duration(minutes: 1),
        backButtonBehavior: BackButtonBehavior.none,
        toastBuilder: (cancel) {
          return CustomNotification(
            '${notifyDto.title}',
            cancelFunc: cancel,
            onPressed: () {
              cancel.call();
              _openNotification(notifyDto);
            },
          );
        },
        enableSlideOff: true,
        onlyOne: true,
        crossPage: true);
  }

  void _showToastNotification(String title){
    BotToast.showCustomNotification(
        animationDuration:
        Duration(milliseconds: 200),
        animationReverseDuration: Duration(milliseconds: 200),
        duration: Duration(seconds: 2),
        backButtonBehavior: BackButtonBehavior.none,
        toastBuilder: (cancel) {
          return CustomNotification(
            title,
            cancelFunc: cancel,
          );
        },
        enableSlideOff: true,
        onlyOne: true,
        crossPage: true);
  }

  Future<void> _openNotification(NotifyDto? notifyDto) async{
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    await ScreenNavigator.navigateTo(Routes.notificationList, param: NotificationListScreenParam(_viewModel.userDto!, _viewModel.notifications, notifyDto));
    _onResumed();
    // _viewModel.hasNewNotification = false;
    _viewModel.getNotify();
  }

  Future<void> _openListFavorite(bool fromEditFav) async{
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    if(fromEditFav){
      await _viewModel.getPoliceStation();
    }
    await ScreenNavigator.navigateTo(Routes.favoriteList, param: FavoriteListScreenParam(_viewModel.userDto!, _viewModel.listPoliceStationDto!, fromEditFav));
    _onResumed();
  }

  Future<void> _openFavorite(FavoriteDto favoriteDto) async {
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    await ScreenNavigator.navigateTo(Routes.searchCriteria, param: SearchCriteriaScreenParam(favoriteDto.category!, _viewModel.userDto!, _viewModel.listPoliceStationDto!, favoriteDto: favoriteDto));
    _onResumed();
  }

  Future<void> _createFavorite() async{
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    await _viewModel.refreshCanAddFavorite();

    if(_viewModel.isEnableFavButton){
      showDialog(
          context: context,
          builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            splashColor: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              color: Colors.transparent,
                              width: double.infinity,
                              height: double.infinity,
                            )
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.0),
                        ),
                      ),
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'ต้องการสร้างรายการโปรดจากระบบสืบค้นใด?',
                                style: TextStyles.small.copyWith(color: Colors.black),
                              ),
                              Expanded(child: Container()),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 45.w,
                                    height: 45.h,
                                    child: Center(
                                      child: Image.asset(AppImage.ic_close, fit: BoxFit.contain, width: 24.w, color: AppColor.grey_close),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h,),
                          _buildRowItem('บุคคล', 'ทะเบียนราษฎร หมายจับ คดี ประกันสังคม กรมราชทัณฑ์', AppConstant.kSearchPerson),
                          _buildRowItem('ยานพาหนะ', 'กรมการขนส่งทางบก รถแจ้งหาย รถในคดี', AppConstant.kSearchCar),
                          // _buildRowItem('อาวุธ', 'อาวุธที่เกี่ยวข้องในคดี', AppConstant.kSearchWeapon),
                          _buildRowItem('ข้อมูลคดี', 'คดีอาญา คดีจราจร', AppConstant.kSearchInfo),
                          // _buildRowItem('ทะเบียนบริษัท', 'กรมพัฒนาธุรกิจการค้า', AppConstant.kSearchFirm),
                          // _buildRowItem('ทรัพย์', 'ทรัพย์ที่เกี่ยวข้องในคดี', AppConstant.kSearchAsset),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          )
      );
    }else{
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    title: 'ไม่สามารถเพิ่มรายการโปรดได้',
                    description: 'รายการโปรดมีจำนวนสูงสุดได้ 10 รายการ กรุณาทำการลบรายการออก แล้วลองใหม่อีกครั้ง',
                    buttonText: AppMessage.ok,
                    onPress: () {
                      Navigator.of(context).pop();
                    }
                ),
              )
          )
      );
    }
  }

  Future<void> _openCreateFav(String type) async{
    ScreenNavigator.pop(context);
    final favoriteDto = FavoriteDto(title: '', category: type, choices: [], innerDbs: [], outerDbs: [], isDefault: 'false');
    await ScreenNavigator.navigateTo(Routes.favoriteCriteria, param: FavoriteCriteriaScreenParam(type, _viewModel.userDto!, favoriteDto, -1));
    _onResumed();
  }

  Widget _buildRowItem(String title, String description, String type) => Material(
    color: Colors.transparent,
    child: InkWell(
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      onTap: (){
        _openCreateFav(type);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              color: AppColor.grey_line2,
              height: 1,
              width: double.infinity,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${title}',
                      style: TextStyles.bodyBold.copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${description}',
                      style: TextStyles.xSmall.copyWith(color: AppColor.grey_noti_text),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                SizedBox(width: 16.w),
                Image.asset(AppImage.ic_chevron_right, fit: BoxFit.contain, width: 16.w,),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    ),
  );

  Future<void> _openSearch(int index) async{
    String type = '';
    switch(index) {
      case 1: {
        type = AppConstant.kSearchPerson;
        break;
      }
      case 2: {
        type = AppConstant.kSearchCar;
        break;
      }
      case 3: {
        type = AppConstant.kSearchWeapon;
        break;
      }
      case 4: {
        type = AppConstant.kSearchInfo;
        break;
      }
      case 5: {
        type = AppConstant.kSearchFirm;
        break;
      }
      case 6: {
        type = AppConstant.kSearchAsset;
        break;
      }
    }
    if(type == '') return;

    if(!AppConstant.isMockUser){
      await ScreenNavigator.navigateTo(Routes.searchCriteria, param: SearchCriteriaScreenParam(type, _viewModel.userDto!, _viewModel.listPoliceStationDto!));
      _onResumed();
    }else if(type == AppConstant.kSearchPerson) {
      await ScreenNavigator.navigateTo(Routes.searchCriteria, param: SearchCriteriaScreenParam(type, _viewModel.userDto!, _viewModel.listPoliceStationDto!));
    }else{
      _showDialogMockUser();
    }

  }

  Future<void> _openChangePin() async{
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    Navigator.pop(context);
    final result = await ScreenNavigator.navigateTo(Routes.createPin, param: CreatePinScreenParam(true));
    if(result == 'success'){
      _showToastNotification('ตั้งค่ารหัส PIN ใหม่สำเร็จ');
    }
    _onResumed();
  }

  Future<void> _openVerifyPinPasscode() async{
    //Navigator.pop(context);
    bool? isSuccess;
    isSuccess = await ScreenNavigator.navigateTo(Routes.verifyPinPasscode, param : VerifyPinPasscodeScreenParam(false));
    if(isSuccess != null && isSuccess) _requestGeneratePasscode(false);
    // else{
    //   ScreenNavigator.pop();
    // }
  }

  Future<void> _requestGeneratePasscode(bool fromDialog) async {
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    if(!fromDialog){
      Navigator.pop(context);
    }

    await _viewModel.generatePasscode();

    if(_viewModel.status == ActionStatus.success){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return PasscodeDialogContent(_viewModel, handleError);
          });
    }else if(_viewModel.status == ActionStatus.error){
      handleError();
    }
  }

  Future<void> _requestGetToken(bool fromDialog) async {
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    if(!fromDialog){
      Navigator.pop(context);
    }
    await _viewModel.getTokenAuthSoc();
    if(_viewModel.status == ActionStatus.success){
      _pingUrl();
    }else if(_viewModel.status == ActionStatus.error){
      handleError();
    }
  }

  Future<void> _pingUrl() async {
    await _viewModel.pingUrl();
    StringUtils.log("_pingUrl ==> baseUrl: ${_viewModel.baseUrl}");
    StringUtils.log("_pingUrl ==> url: ${_viewModel.url}");
    StringUtils.log("_pingUrl ==> ActionStatus: ${_viewModel.status}");
    if(_viewModel.status == ActionStatus.success){
      // TODO: Open Browser with _viewModel.url
      _showDialogOpenUrl();
    }else if(_viewModel.status == ActionStatus.error){
      // TODO: Show Dialog inform user to open VPN
      _showDialogSSLVPNRequired();
    }
  }

  Future<void> _openExternalLink(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showDialogOpenUrl(){
    showDialog(
        context: context,
        builder: (context) => Scaffold(
          backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
          body: Center(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Consts.padding),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "ยืนยันตัวตนระบบ SOC",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleBold.copyWith(color: AppColor.blue_text_dialog)
                    ),
                    SizedBox(height: 4.h),
                    Text(
                        "กรุณากดปุ่มด้านล่าง\nเพื่อเข้าสู่ระบบเว็บไซต์ SOC",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyles.body.copyWith(color: AppColor.blue_text_dialog)
                    ),
                    // SizedBox(height: 24.h),
                    // Text(
                    //     "${_viewModel.url}",
                    //     textAlign: TextAlign.center,
                    //     style: TextStyles.xSmallSemi.copyWith(color: AppColor.blue_text_dialog)
                    // ),

                    // SizedBox(height: 24.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Material(
                    //       color: Colors.transparent,
                    //       child: InkWell(
                    //         splashColor: Colors.white,
                    //         borderRadius: BorderRadius.circular(8.0),
                    //         //onTap: _requestRefreshWebPasscode,
                    //         child: Image.asset(AppImage.ic_refresh, fit: BoxFit.contain, width: 24.w,),
                    //       ),
                    //     ),
                    //     SizedBox(width: 10.w,),
                    //     Text(
                    //         '', //'ใช้โค้ดภายใน /${_timeLeftString} นาที',
                    //         style: TextStyles.body.copyWith(color: AppColor.grey_btn_text)
                    //     ),
                    //   ],
                    // ),

                    SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Expanded(
                      child: PrimaryCustomButton(
                        'เปิดเว็บไซต์',
                        onPressed: () =>  _openAuthUrl(),
                      ),
                    ),
                      SizedBox(width: 10.w,),
                    Expanded(
                      child: PrimaryCustomButton(
                        'ยกเลิก',
                        onPressed: () =>  ScreenNavigator.pop(),
                      ),
                    ),
                    ],
                   ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  Future<void> _openAuthUrl() async {
    StringUtils.log("_viewModel.url ${_viewModel.url}");
    if(_viewModel.url == null && _viewModel.url!.isNotEmpty) return;

    Uri uri = Uri.parse(_viewModel.url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      ScreenNavigator.pop();
    }
  }

  void _showDialogSSLVPNRequired(){
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: 'ไม่พบการเชื่อมต่อ SSL VPN',
                  description: 'กรุณาเปิดการใช้งาน SSL VPN\n ก่อนเข้าใช้งานระบบ SOC',
                  // cancelText: AppMessage.cancel,
                  // onCancel: () {
                  //   Navigator.of(context).pop();
                  // },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    // _clearForm();
                    // _showTutorial();
                  }
              ),
            )
        )
    );
  }

  void _showDialogUserExpire(){
    int daysExpire = StringUtils.countDaysYYYYMMDD(widget.param.userDto.expireDate.toString());
    if(daysExpire <= 7){
      String daysExpireText ="ใกล้หมดอายุการใช้งาน";
      String daysExpireBtn = AppMessage.ok;
      if(daysExpire<0) daysExpireText="หมดอายุการใช้งาน";
      //if(daysExpire<=15) daysExpireBtn="ภายหลัง";
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    //title: 'ใกล้หมดอายุการใช้งาน',
                    title: daysExpireText,
                    body: Column(
                      children: [
                        SizedBox(height: 8.w),
                        Text(
                          'ใช้งานได้ถึงวันที่ ${StringUtils.convertDateYYYYMMDD(widget.param.userDto.expireDate.toString())} ${daysExpire > 0 ? '\n (อีก ${daysExpire} วัน)' : ''}',
                          textAlign: TextAlign.center,
                          style: TextStyles.bodySemi.copyWith(
                            color: AppColor.blue_text_dialog,
                          ),
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          //'กรุณาต่ออายุการใช้งาน ในหน้าขอสิทธิ์ใช้งาน CRIMES Online',
                          'เมื่อถึงวันหมดอายุแล้วท่านสามารถต่ออายุ \n โดยการลงทะเบียนด้วย ThaID ใหม่อีกครั้ง',
                          textAlign: TextAlign.center,
                          style: TextStyles.small.copyWith(
                            color: AppColor.grey_noti_text,
                          ),
                        ),

                        // SizedBox(height: 8.w),
                        // if(daysExpire<=15)
                        //   PrimaryCustomButton(
                        //     "ต่ออายุด้วย ThaID",
                        //     onPressed: () =>
                        //         _generateThaIDState(), //_openExternalLink(AppConstant.thaIDhost+"&state="+generateRandomString(8)),
                        //   ),
                      ],
                    ),
                    buttonText: daysExpireBtn,
                    onPress: () {
                      Navigator.of(context).pop();
                      // _clearForm();
                      // _showTutorial();
                      if(daysExpire<0) _logout();
                    }
                ),
              )
          ),
      );
    }
  }

  Future<void> _toggleBiometrics() async {
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    if(!_viewModel.hasBiometrics) return;
    Navigator.pop(context);

    if(_viewModel.isEnableBiometrics){
      // close
      await showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    title: 'ยืนยันปิดระบบสแกนนิ้ว/ใบหน้า',
                    cancelText: AppMessage.cancel,
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: AppMessage.ok,
                    onPress: () {
                      Navigator.of(context).pop();
                      _closeBiometrics();
                    }
                ),
              )
          )
      );
    }else{
      // open
      await showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    title: 'ยืนยันเปิดระบบสแกนนิ้ว/ใบหน้า',
                    cancelText: AppMessage.cancel,
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: AppMessage.ok,
                    onPress: () {
                      Navigator.of(context).pop();
                      _openBiometrics();
                    }
                ),
              )
          )
      );
    }
  }

  Future<void> _closeBiometrics() async{
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    await _viewModel.closeBiometrics();

    if (_viewModel.status == ActionStatus.success) {
      // toast
      await _refreshBiometrics();
      _showToastNotification('ปิดระบบสแกนนิ้ว/ใบหน้าสำเร็จ');
    }else if(_viewModel.status == ActionStatus.error){
      handleError();
    }
  }

  Future<void> _openBiometrics() async {
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    if (!mounted) return;

    FocusScope.of(context).unfocus();
    await _viewModel.authenticate();

    if (_viewModel.status == ActionStatus.success) {
      // toast
      await _refreshBiometrics();
      _showToastNotification('เปิดระบบสแกนนิ้ว/ใบหน้าสำเร็จ');
    }else if(_viewModel.status == ActionStatus.error){
      handleError();
    }
  }

  Future<void> _openPermission() async{
    if(AppConstant.isMockUser) { _showDialogMockUser(); return; }

    await ScreenNavigator.navigateTo(Routes.permission, param: PermissionScreenParam(_viewModel.userDto!));
    _onResumed();
  }

  Future<void> _openResetTutorial() async{
    await TutorUtils.clearAllRead();
    Navigator.pop(context);
    _showTutorial();
  }

  Future<void> _askLogout() async{
    Navigator.pop(context);
    await showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: AppMessage.titleLogout,
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    _logout();
                  }
              ),
            )
        )
    );
  }

  Future<void> _logout() async{
    await KeyUtils.saveLogin(false);

    bool isMockUser = await KeyUtils.isMockUser();
    if(isMockUser){
      await _clearKeysAndLogin();
    }else{
      ScreenNavigator.navigateReplaceTo(Routes.login);
    }

  }

  Future<void> _clearKeysAndLogin() async {
    //TODO: Alert user and Clear keys then redirect to Login
    await KeyUtils.clearAll();
    await Future.delayed(Duration(seconds: 1));
    ScreenNavigator.navigateReplaceTo(Routes.login);
  }

  Future<void> _openCamera() async {
    if(_viewModel.favoriteList.length==0) return;

    StringUtils.log("------- _openCamera ------");
    await ScreenNavigator.navigateTo(Routes.camera, param: CameraPageParam(cameras, true, _viewModel.userDto,_viewModel.listPoliceStationDto, _viewModel.favoriteList[0]));
    // /*final result = */await Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return CameraPage(cameras, true, _viewModel.userDto,_viewModel.listPoliceStationDto, _viewModel.defaultFavorite);
    // }));
    _onResumed();
    // await Future.delayed(Duration(milliseconds: 300));
    // _showResult(result);
  }

  Future<void> _checkPermission() async{
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;
    StringUtils.log('_checkPermission - cameraStatus: ${cameraStatus}');
    StringUtils.log('_checkPermission - microphoneStatus: ${microphoneStatus}');

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
      _openCamera();
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


  void _openScanQR(bool fromDialog) async{

    if(!fromDialog) {
      Navigator.pop(context);
    }

    String policeId = "";
    policeId = widget.param.userDto.policeId.toString();
    StringUtils.log("policeId:  ${policeId}");
    FocusScope.of(context).unfocus();
    ScreenNavigator.navigateTo(Routes.scanQRLogin, param: ScanQRLoginScreenParam(policeId, true));

  }

  // Future<void> _showResult(String foundText) async{
  //   if (foundText!=null && foundText.isNotEmpty) {
  //     Toast.show("พบหมายเลข: $foundText", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  //     foundText = foundText.replaceAll(new RegExp(r' '), '');
  //
  //     await ScreenNavigator.navigateTo(Routes.searchCriteria, param: SearchCriteriaScreenParam(AppConstant.kSearchPerson, _viewModel.userDto,_viewModel.listPoliceStationDto, pid: foundText, favoriteDto: _viewModel.defaultFavorite));
  //     _onResumed();
  //   } else {
  //     // Toast.show("ไม่พบหมายเลขบัตรประชาชน", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  //   }
  // }

/*  Future<void> _openExternalLink(String extURL) async {
    if (await canLaunch(extURL)) {
      await launch(extURL);
    }
  }*/

  Future<void> _checkEula() async{
    //TODO: Check Eula
    if(_viewModel.eulaDto != null){
      ScreenNavigator.navigateReplaceTo(Routes.term, param: TermScreenParam(_viewModel.userDto!, _viewModel.eulaDto!));
    }
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
                    _showTutorial();
                  }
              ),
            )
        )
    );
  }

  void _showDialogMockUser(){
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: 'Production mode only',
                  description: 'Sorry, This feature is not allowed for test user.',
                  buttonText: 'OK',
                  onPress: () {
                    Navigator.of(context).pop();
                  }
              ),
            )
        )
    );
  }

  // Future<void> _generateThaIDState() async {
  //   await _viewModel.generateThaIDState();
  //   if (_viewModel.status == ActionStatus.success) {
  //     KeyUtils.saveThaidState(_viewModel.thaidState!);
  //     _openExternalLink(
  //       //AppConstant.thaIDhost + "&state=" + _viewModel.thaidState!);
  //         _viewModel.thaidHost! + _viewModel.thaidState!);
  //   } else if (_viewModel.status == ActionStatus.error) {
  //     //_handleError();
  //   }
  // }

  // Start Authen Linkage II --------------------------------
  Future<void> _generateThaIDStateLK2() async {
    await _viewModel.generateThaIDStateLK2();
    if (_viewModel.status == ActionStatus.success) {
      KeyUtils.saveThaidState(_viewModel.thaidState!);
      _openExternalLink(
          _viewModel.thaidHost! + _viewModel.thaidState!);
    } else if (_viewModel.status == ActionStatus.error) {
      //_handleError();

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
                    }),
              )));

    }
  }

  void _handleOnThaiDLK2Event(OnThaiDLK2Event event) async {
    StringUtils.log("do _handleOnThaiDLK2Event");
    String state = event.state;
    String code = event.code;
    String authen = event.authen;
    StringUtils.log("do _handleOnThaiDLK2Event code = " + code);
    StringUtils.log("do _handleOnThaiDLK2Event state = " + state);
    StringUtils.log("do _handleOnThaiDEvent authen = " + authen);
    String sessionstate = await KeyUtils.getThaidState();
    StringUtils.log("do _handleOnThaiDLK2Event sessionstate = " + sessionstate);
    if (state == sessionstate) {
      StringUtils.log("do _handleOnThaiDLK2Event sessionstate = state");
    } else {
      StringUtils.log("do _handleOnThaiDLK2Event sessionstate is not match");
    }

    await _viewModel.loginConfirmLK2(code, state, authen);
    if (_viewModel.status == ActionStatus.success &&
        _viewModel.thaidStatus == "success") {
      StringUtils.log("Authen LK2 OK!!");
      //await KeyUtils.saveThaidResult("none");
      showDialog(
          context: context,
          builder: (context) =>
              Scaffold(
                  backgroundColor:
                  Colors.black.withAlpha(AppConstant.alphaDialog),
                  body: Center(
                      child: StatusPopup(
                          title: "ระบบแจ้งเตือน",
                          description: _viewModel.successMessage,
                          buttonText: AppMessage.ok,
                          onPress: () {
                            Navigator.of(context).pop();
                          }
                      )
                  )));

    } else {
      StringUtils.log("Authen LK2 Failed!!");
      //await KeyUtils.saveThaidResult("none");
      showDialog(
          context: context,
          builder: (context) =>
              Scaffold(
                  backgroundColor:
                  Colors.black.withAlpha(AppConstant.alphaDialog),
                  body: Center(
                      child: StatusPopup(
                          title: "ระบบแจ้งเตือน",
                          description: _viewModel.errorMessage,
                          buttonText: AppMessage.ok,
                          onPress: () {
                            Navigator.of(context).pop();
                          }
                      )
                  )));
    }
  }
  // End Authen Linkage II --------------------------------

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColor.primaryColor,
        endDrawer: _buildDrawer(),
        body: Observer(
          builder: (_) => StatusAwareContainer(
            _viewModel.status,
            showError: _viewModel.showError,
            idle: _buildLayout(),
            error: Stack(children: [
              _buildError(),
            ]),
            onRetry: () => {},
          ),
        ),
      ));

  Widget _buildDrawer() => Drawer(
    child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(32.w, 68.h, 32.w, 24.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColor.bg_top, AppColor.bg_bottom],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ProfileImageWidget(
                      mContext: context,
                      onAfterRead: (data){
                        if(data!=null) streamProfileImage.sink.add(data);
                      },
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อผู้ใช้งาน : ',
                        style: TextStyles.smallBold.copyWith(color: AppColor.blue_text_light),
                      ),
                      Expanded(
                        child: Text(
                          '${_viewModel.userDto!.policeId}',
                          style: TextStyles.smallBold.copyWith(color: AppColor.blue_text_light),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อ : ',
                        style: TextStyles.smallBold.copyWith(color: AppColor.blue_text_light),
                      ),
                      Expanded(
                        child: Text(
                          '${_viewModel.userDto!.rank} ${_viewModel.userDto!.firstname} ${_viewModel.userDto!.lastname}',
                          style: TextStyles.smallBold.copyWith(color: AppColor.blue_text_light),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ตำแหน่ง : ',
                        style: TextStyles.smallBold.copyWith(color: AppColor.blue_text_light),
                      ),
                      Expanded(
                        child: Text(
                          '${_viewModel.userDto!.posOrg}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.smallBold.copyWith(color: AppColor.blue_text_light),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ),
          SizedBox(height: 24.h),
          Expanded(
              child: SingleChildScrollView(
                child: _buildMenu(),
              )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              child: new SizedBox(
                height: 20,
                child: new FittedBox(
                  child: new Text('ศูนย์เทคโนโลยีสารสนเทศกลาง',
                      style: TextStyles.xxSmall.copyWith(color: AppColor.blue_text_dialog)
                  ),
                ),
              )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 0),
              child: new SizedBox(
                height: 16,
                child: new FittedBox(
                  child: new Text("สำนักงานเทคโนโลยีสารสนเทศและการสื่อสาร สำนักงานตำรวจแห่งชาติ",
                      style: TextStyles.xxSmall.copyWith(color: AppColor.blue_text_dialog)
                  ),
                ),
              )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 0),
              child: new SizedBox(
                height: 16,
                child: new FittedBox(
                  child: new Text("CRIMES Online ver. "+_viewModel.version+"("+_viewModel.buildnumber+")",
                      style: TextStyles.xSmall.copyWith(color: AppColor.blue_text_dialog)
                  ),
                ),
              )
          ),
          SizedBox(height: 15.h),
        ],
      ),
    ),
  );

  Widget _buildMenu() => Column(
    children: [
      _buildMenuItemWidget(
          title: 'ขอรหัสผ่าน CRIMES Online',
          icon: Image.asset(AppImage.ic_lock, fit: BoxFit.contain, width: 24.w,),
          onTab: ()=> _openVerifyPinPasscode() //_requestGeneratePasscode(false)
      ),
      // _buildMenuItemWidget(
      //     title: 'เข้าใช้งานระบบ SOC',
      //     icon: Image.asset(AppImage.ic_website, fit: BoxFit.contain, width: 20.w, color: AppColor.blue_menu),
      //     onTab: ()=> _requestGetToken(false)
      // ),
      _buildMenuItemWidget(
          //title: 'เข้าใช้งานระบบ CRIMES',
          title: 'สแกน QR Code เพื่อยืนยันตัวตน',
          icon: Image.asset(AppImage.ic_scanqr, fit: BoxFit.contain, width: 20.w, color: AppColor.blue_menu),
          onTab: ()=> _openScanQR(false)
      ),
      // Theme(
      //   data: ThemeData().copyWith(dividerColor: Colors.transparent),
      //   child: ListTileTheme(
      //     contentPadding: EdgeInsets.all(0),
      //     dense: true,
      //     child: ExpansionTile(
      //       tilePadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      //       childrenPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      //       title: Column(
      //         children: [
      //           _buildMenuItemWidget(
      //               title: 'การยืนยันตัวตน',
      //               icon: Image.asset(AppImage.ic_setting, fit: BoxFit.contain, width: 24.w,),
      //               isEndLine: false,
      //               isStartLine: false,
      //               paddingVertical: 4.w
      //           ),
      //         ],
      //       ),
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left : 16.0),
      //           child: Column(
      //             children: [
      //               _buildMenuItemWidget(
      //                   title: 'เข้าใช้งานระบบ SOC',
      //                   icon: Image.asset(AppImage.ic_website, fit: BoxFit.contain, width: 20.w, color: AppColor.blue_menu),
      //                   onTab: ()=> _requestGetToken(false)
      //               ),
      //               _buildMenuItemWidget(
      //                   title: 'เข้าใช้งานระบบ CRIMES',
      //                   icon: Image.asset(AppImage.ic_scanqr, fit: BoxFit.contain, width: 20.w, color: AppColor.blue_menu),
      //                   onTab: ()=> _openScanQR(false)
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      _buildMenuItemWidget(
          title: 'ยืนยันสิทธิ์ Linkage II ด้วย ThaID',
          icon: Image.asset(AppImage.ic_website, fit: BoxFit.contain, width: 20.w, color: AppColor.blue_menu),
        onTab:() => _generateThaIDStateLK2()
      ),
      Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          contentPadding: EdgeInsets.all(0),
          dense: true,
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            childrenPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            title: Column(
              children: [
                _buildMenuItemWidget(
                    title: 'ตั้งค่า',
                    icon: Image.asset(AppImage.ic_setting, fit: BoxFit.contain, width: 24.w,),
                    isEndLine: false,
                    isStartLine: false,
                    paddingVertical: 4.w
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left : 16.0),
                child: Column(
                  children: [
                    _buildMenuItemWidget(
                        title: 'เปลี่ยน PIN',
                        isStartLine: true,
                        isEndLine: _hasBiometrics ? true : false,
                        icon: Padding(
                          padding: const EdgeInsets.only(left : 4.0),
                          child: Icon(FontAwesomeIcons.unlockAlt, size: 16.0,color: AppColor.blue_text_dialog),
                        ),
                        onTab: ()=> _openChangePin()
                    ),
                    if(_hasBiometrics)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 22.w,),
                        child: Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                onTap: (){
                                  _toggleBiometrics();
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 14.h,),
                                    child: Row(
                                      children: [
                                        Image.asset(AppImage.ic_scan, fit: BoxFit.contain, width: 24.w,),
                                        SizedBox(width: 12.w,),
                                        Expanded(
                                          child: Text(
                                            'ระบบสแกนนิ้ว/ใบหน้า',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyles.bodySemi.copyWith(color: AppColor.blue_text_dialog),
                                          ),
                                        ),
                                        if(_isEnableBiometrics)
                                          Image.asset(AppImage.btn_switch_on, fit: BoxFit.contain, width: 40.w,),
                                        if(!_isEnableBiometrics)
                                          Image.asset(AppImage.btn_switch_off, fit: BoxFit.contain, width: 40.w,),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      _buildMenuItemWidget(
          title: 'รายละเอียดสิทธิ์การใช้งาน',
          isStartLine: true,
          icon: Image.asset(AppImage.ic_doc, fit: BoxFit.contain, width: 24.w,),
          onTab: ()=> _openPermission()
      ),
      _buildMenuItemWidget(
          title: 'แสดงคำแนะนำการใช้งาน',
          icon: Padding(
            padding: const EdgeInsets.only(left :4.0),
            child: Icon(FontAwesomeIcons.playCircle, size: 16.0,color: AppColor.blue_text_dialog),
          ),
          onTab: ()=> _openResetTutorial()
      ),
      _buildMenuItemWidget(
          title: 'ข้อกำหนดและเงื่อนไข',
          icon: Padding(
            padding: const EdgeInsets.only(left :4.0),
            child: Icon(FontAwesomeIcons.clipboard, size: 16.0,color: AppColor.blue_text_dialog),
          ),
          onTab: ()=> _checkEula()
      ),

      _buildMenuItemWidget(
          title: 'ช่องทางการติดต่อ',
          icon: Padding(
            padding: const EdgeInsets.only(left : 5.0),
            child: Image.asset(AppImage.ic_headset, fit: BoxFit.contain, width: 16.w, color: AppColor.blue_menu),
          ),
          onTab: ()=> _openExternalLink("https://www.crimespolice.com/portal/crimes-online-support/")
      ),

      _buildMenuItemWidget(
        title: 'สถานีตำรวจใกล้ฉัน',
        icon: Padding(
          padding: const EdgeInsets.only(left : 5.0),
          child: Image.asset(AppImage.ic_map_nearest, fit: BoxFit.contain, width: 16.w, color: AppColor.blue_menu),
        ),
        onTab: ()=> _checkPermissionLocation()
      ),
      _buildMenuItemWidget(
        // title: 'สถานีตำรวจในพื้นที่ความรับผิดชอบ ณ ตำแหน่งปัจจุบันของฉัน',
          title: 'สถานีตำรวจในพื้นที่ความรับผิดชอบ',
        icon: Padding(
          padding: const EdgeInsets.only(left : 5.0),
          child: Image.asset(AppImage.ic_map_responsible, fit: BoxFit.contain, width: 16.w, color: AppColor.blue_menu),
        ),
        onTab: ()=> _checkPermissionLocationResponsible(),
          fontSize:14.0
      ),

      // Theme(
      //   data: ThemeData().copyWith(dividerColor: Colors.transparent),
      //   child: ListTileTheme(
      //     contentPadding: EdgeInsets.all(0),
      //     dense: true,
      //     child: ExpansionTile(
      //       tilePadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      //       childrenPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      //       title: Column(
      //         children: [
      //           _buildMenuItemWidget(
      //               title: 'งานบริการข้อมูล',
      //               icon: Image.asset(AppImage.ic_setting, fit: BoxFit.contain, width: 24.w,),
      //               isEndLine: false,
      //               isStartLine: false,
      //               paddingVertical: 4.w
      //           ),
      //         ],
      //       ),
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left : 16.0),
      //           child: Column(
      //             children: [
      //               _buildMenuItemWidget(
      //                   title: 'ข้อกำหนดและเงื่อนไข',
      //                   icon: Padding(
      //                     padding: const EdgeInsets.only(left :4.0),
      //                     child: Icon(FontAwesomeIcons.clipboard, size: 16.0,color: AppColor.blue_text_dialog),
      //                   ),
      //                   onTab: ()=> _checkEula()
      //               ),
      //               _buildMenuItemWidget(
      //                     title: 'ช่องทางการติดต่อ',
      //                     icon: Padding(
      //                       padding: const EdgeInsets.only(left : 5.0),
      //                       child: Image.asset(AppImage.ic_headset, fit: BoxFit.contain, width: 16.w, color: AppColor.blue_menu),
      //                     ),
      //                     onTab: ()=> _openExternalLink("https://www.crimespolice.com/portal/crimes-online-support/")
      //               ),
      //               _buildMenuItemWidget(
      //                   title: 'สถานีตำรวจใกล้ฉัน',
      //                   icon: Padding(
      //                     padding: const EdgeInsets.only(left : 5.0),
      //                     child: Image.asset(AppImage.ic_map_nearest, fit: BoxFit.contain, width: 16.w, color: AppColor.blue_menu),
      //                   ),
      //                   // onTab: ()=> _checkPermissionLocation
      //               ),
      //               _buildMenuItemWidget(
      //                   title: 'สถานีตำรวจในพื้นที่ความรับผิดชอบ ณ ตำแหน่งปัจจุบันของฉัน',
      //                   icon: Padding(
      //                     padding: const EdgeInsets.only(left : 5.0),
      //                     child: Image.asset(AppImage.ic_map_responsible, fit: BoxFit.contain, width: 16.w, color: AppColor.blue_menu),
      //                   ),
      //                   // onTab: ()=> _checkPermissionLocationResponsible
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),

      // _buildMenuItemWidget(
      //     title: 'ทดสอบ ThaID',
      //     icon: Padding(
      //       padding: const EdgeInsets.only(left : 5.0),
      //       child: Image.asset(AppImage.ic_headset, fit: BoxFit.contain, width: 16.w, color: AppColor.blue_menu),
      //     ),
      //     onTab: ()=> _openExternalLink("https://imauth.bora.dopa.go.th/api/v2/oauth2/auth/?response_type=code&client_id=ZHdkVkwwbGR1bk5MT2diWUlmaE1UR2ltUGwxcFRGaU4=&redirect_uri=https%3A%2F%2Fbdamobile.crimespolice.com%2Fcrimesservicedopa%2Fapi%2Fcallback&scope=pid%20given_name%20family_name%20birthdate&state=bbdA9vOE5")
      // ),
      _buildMenuItemWidget(
          title: 'ออกจากระบบ',
          icon: Padding(
            padding: const EdgeInsets.only(left : 2.0),
            child: Image.asset(AppImage.ic_logout, fit: BoxFit.contain, width: 22.w,),
          ),
          onTab: ()=> _askLogout()
      )
    ],
  );

  Widget _buildMenuItemWidget({String? title, Widget? icon, Function? onTab, bool isEndLine = true, bool isStartLine = false, double? paddingVertical,double? fontSize}){
    if(paddingVertical == null){
      paddingVertical = 14.h;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w,),
      child: Column(
        children: [
          if(isStartLine)
            Container(
              width: double.infinity,
              height: 0.5,
              color: AppColor.grey_line,
            ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: (){
                onTab?.call();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: paddingVertical,),
                  child: Row(
                    children: [
                      icon != null ? icon : Container(),
                      SizedBox(width: 12.w,),
                      Expanded(
                        child: Text(
                          '${title}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.bodySemi.copyWith(color: AppColor.blue_text_dialog
                            , fontSize: fontSize ?? TextStyles.bodySemi.fontSize,),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
          if(isEndLine)
            Container(
              width: double.infinity,
              height: 0.5,
              color: AppColor.grey_line,
            ),
        ],
      ),
    );
  }

  Widget _buildLayout() {
    return Container(
      decoration: getBg(),
      child: Column(
        children: <Widget>[
          _buildAppBar(),
          _buildScrollContent(),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildAppBar() => Container(
    padding: EdgeInsets.only(top : 35.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //SizedBox(width: 90.w),
        Container(
          //color: const Color(0xffe67e22),
          child: Padding(
              padding: const EdgeInsets.only(left : 20.0),
              child: StreamBuilder<String>(
                stream: streamProfileImage.stream,
                builder: (context,AsyncSnapshot<String> snapshot){
                  if(!snapshot.hasData){
                    return Container();//ProfileImageShowWidget();
                  }
                  else{
                    return ProfileImageShowWidget(image: snapshot.data!,);
                  }
                },
              )
          ),
        ),
        Expanded(
          child:Container(
            alignment: Alignment.center,
            child:Container(
              //color: const Color(0xffe67e22),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(AppImage.logo_header, fit: BoxFit.contain,)
              ),
            ),
          ),
        ),

        // if(_viewModel.countNew==0)
        Material(
          key: tutorKeyHome.keyNoti,
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            onTap: (){
              _openNotification(null);
            },
            child: Container(
              width: 45.w,
              height: 45.h,
              child: Stack(
                children: [
                  Container(
                    // margin: EdgeInsets.all(10.w),
                      margin: EdgeInsets.only(top: 15.w, left: 10.w),
                      child: Image.asset(AppImage.ic_noti,fit: BoxFit.contain,width: 24.w)
                  ),
                  if(_viewModel.countNew>0)
                    Positioned(
                      top:0 ,
                      right:0,
                      child: Container(
                        // padding: EdgeInsets.all(2.w),
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   shape: BoxShape.circle,
                        // ),
                        child: Container(
                          width: 22.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child:

                          Text(
                            _viewModel.countNew<9 ? '${_viewModel.countNew}' : '9+',
                            style: TextStyles.smallBold.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )

                ],
              ),
            ),
          ),
        ),


        // if(_viewModel.hasNewNotification)
        //   Material(
        //     key: tutorKeyHome.keyNoti,
        //     color: Colors.transparent,
        //     child: InkWell(
        //       splashColor: Colors.white,
        //       borderRadius: BorderRadius.circular(8.0),
        //       onTap: (){
        //         _openNotification();
        //       },
        //       child: Container(
        //         width: 45.w,
        //         height: 45.h,
        //         child: Center(
        //           child: Image.asset(AppImage.ic_noti_new, fit: BoxFit.contain, width: 24.w),
        //         ),
        //       ),
        //     ),
        //   ),
        // if(!_viewModel.hasNewNotification)
        //   Material(
        //     key: tutorKeyHome.keyNoti,
        //     color: Colors.transparent,
        //     child: InkWell(
        //       splashColor: Colors.white,
        //       borderRadius: BorderRadius.circular(8.0),
        //       onTap: (){
        //         _openNotification();
        //       },
        //       child: Container(
        //         width: 45.w,
        //         height: 45.h,
        //         child: Center(
        //           child: Image.asset(AppImage.ic_noti, fit: BoxFit.contain, width: 24.w),
        //         ),
        //       ),
        //     ),
        //   ),

        Material(
          key: tutorKeyHome.keyMenu,
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            onTap: (){
              _scaffoldKey.currentState!.openEndDrawer();
            },
            child: Container(
              width: 45.w,
              height: 45.h,
              child: Center(
                child: Image.asset(AppImage.ic_hamburger, fit: BoxFit.contain, width: 24.w),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildScrollContent() => Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildFavorite(),
          _buildNews(),
          _buildMainMenu(),
        ],
      ),
    ),
  );

  Widget _buildFavorite() => Container(
    padding: EdgeInsets.only(left: 24.w, top: 12.h),
    child: Column(
      key: tutorKeyHome.keyFavourite,
      children: [
        Row(
          children: [
            new SizedBox(
              height: 22,
              child: new FittedBox(
                child: new Text("โปรแกรมของฉัน",
                    style: TextStyles.body.copyWith(color: AppColor.blue_text_light)
                ),
              ),
            ),
            Expanded(child: Container()),
            Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: (){
                    _openListFavorite(false);
                  },
                  child: new SizedBox(
                    height: 18,
                    child: new FittedBox(
                      child: Text(
                        "ดูทั้งหมด >",
                        style: TextStyles.small.copyWith(color: AppColor.blue_text_light),
                      ),
                    ),
                  )
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          height: 100.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // Material(
              //   color: Colors.transparent,
              //   child: InkWell(
              //     splashColor: Colors.white,
              //     borderRadius: BorderRadius.circular(8.0),
              //     onTap: (){ _openFavorite(_viewModel.favoriteList[0]); },
              //     child: Container(
              //       width: 65.w,
              //       margin: EdgeInsets.only(right: 12.w),
              //       child: Column(
              //         children: [
              //           Image.asset(AppImage.btn_fav_person, fit: BoxFit.contain),
              //           SizedBox(height: 4.h,),
              //           Text(
              //             'ค้นหาหมายจับ ด้วยบัตรปชช',
              //             textAlign: TextAlign.center,
              //             maxLines: 2,
              //             softWrap: true,
              //             overflow: TextOverflow.ellipsis,
              //             style: TextStyles.xxSmall.copyWith(color: Colors.white),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              for(int i=0; i<_viewModel.favoriteList.length; i++)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: (){
                      _openFavorite(_viewModel.favoriteList[i]);
                    },
                    child: Container(
                      width: 65.w,
                      margin: EdgeInsets.only(right: 12.w),
                      child: Column(
                        children: [
                          if(i==0)
                            Image.asset(AppImage.btn_fav_card, fit: BoxFit.contain),
                          if(_viewModel.favoriteList[i].category == AppConstant.kSearchPerson && i!=0)
                            Image.asset(AppImage.btn_fav_person, fit: BoxFit.contain),
                          if(_viewModel.favoriteList[i].category == AppConstant.kSearchCar && i!=0)
                            Image.asset(AppImage.btn_fav_car, fit: BoxFit.contain),
                          if(_viewModel.favoriteList[i].category == AppConstant.kSearchWeapon && i!=0)
                            Image.asset(AppImage.btn_fav_weapon, fit: BoxFit.contain),
                          if(_viewModel.favoriteList[i].category == AppConstant.kSearchInfo && i!=0)
                            Image.asset(AppImage.btn_fav_info, fit: BoxFit.contain),
                          if(_viewModel.favoriteList[i].category == AppConstant.kSearchFirm && i!=0)
                            Image.asset(AppImage.btn_fav_firm, fit: BoxFit.contain),
                          if(_viewModel.favoriteList[i].category == AppConstant.kSearchAsset && i!=0)
                            Image.asset(AppImage.btn_fav_asset, fit: BoxFit.contain),
                          SizedBox(height: 4.h,),
                          Expanded(
                            child: Text(
                              '${_viewModel.favoriteList[i].title}',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.xxSmall.copyWith(color: Colors.white),
                            ),
                          )
                        ],
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
                    _createFavorite();
                  },
                  child: Container(
                    width: 65.w,
                    margin: EdgeInsets.only(right: 12.w),
                    child: Column(
                      children: [
                        Image.asset(AppImage.btn_fav_add, fit: BoxFit.contain),
                        SizedBox(height: 4.h,),
                        Expanded(
                          child: Text(
                            'เพิ่มรายการโปรด',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.xxSmall.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildNews() => Container(
    padding: EdgeInsets.only(left: 24.w, top: 15.h),
    child: Column(
      key: tutorKeyHome.keyInfomation,
      children: [
        Row(
          children: [
            new SizedBox(
              height: 22,
              child: new FittedBox(
                child: new Text("ข่าวประชาสัมพันธ์",
                    style: TextStyles.body.copyWith(color: AppColor.blue_text_light)
                ),
              ),
            ),
            Expanded(child: Container()),
            // GestureDetector(
            //   onTap: (){ _openListFavorite(); },
            //   child: Text(
            //     "ดูทั้งหมด >",
            //     style: TextStyles.small.copyWith(color: AppColor.blue_text_light),
            //   )
            // ),
            // SizedBox(width: 10.w),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
            width: double.infinity,
            height: 117.h,
            child: FutureBuilder(
                future: _fetchDataNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    var l = DefaultNewsInfo().get(context);
                    return CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          viewportFraction: 0.6
                      ),
                      items: l.toList(),
                    );
                  }
                  return CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        viewportFraction: 0.6
                    ),
                    items: snapshot.data.map<Widget>((item) => NewsInfoWidget(
                      mContext: context,
                      data: item,
                    )
                    ).toList(),
                  );
                }
            )
        ),
      ],
    ),
  );
  _fetchDataNews() async {
    return this._memoizer!.runOnce(() async {
      return _viewModel.getNews();
    });
  }

  Widget _buildMainMenu() => Container(
    padding: EdgeInsets.only(left: 24.w, top: 15.h, right: 24.w),
    child: Column(
      key: tutorKeyHome.keyDataSource,
      children: [
        Row(
          children: [
            new SizedBox(
              height: 22,
              child: new FittedBox(
                child: new Text("ระบบสืบค้น",
                    style: TextStyles.body.copyWith(color: AppColor.blue_text_light)
                ),
              ),
            ),
            Expanded(child: Container()),
            // GestureDetector(
            //   onTap: (){ _openListFavorite(); },
            //   child: Text(
            //     "ดูทั้งหมด >",
            //     style: TextStyles.small.copyWith(color: AppColor.blue_text_light),
            //   )
            // ),
            // SizedBox(width: 10.w),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 148.h,
                decoration: BoxDecoration(
                  color: AppColor.blue_menu,
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black,
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0.0, 3.0),
                    ),
                  ],
                ),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: (){
                        _openSearch(1);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                        child: Column(
                          children: [
                            SizedBox(height: 8.h),
                            Image.asset(AppImage.ic_menu_person, fit: BoxFit.contain, height: 60.h,),
                            SizedBox(height: 8.h),
                            new SizedBox(
                              height: 20,
                              child: new FittedBox(
                                child: Text(
                                  "บุคคล",
                                  style: TextStyles.small.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'ทะเบียนราษฎร หมายจับ คดี ประกันสังคม กรมราชทัณฑ์',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.xxxSmall.copyWith(color: AppColor.blue_text_light),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Container(
                height: 148.h,
                decoration: BoxDecoration(
                  color: AppColor.blue_menu,
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black,
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0.0, 3.0),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: (){
                      _openSearch(2);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                      child: Column(
                        children: [
                          SizedBox(height: 8.h),
                          Image.asset(AppImage.ic_menu_car, fit: BoxFit.contain, height: 60.h,),
                          SizedBox(height: 8.h),
                          new SizedBox(
                            height: 20,
                            child: new FittedBox(
                              child: Text(
                                'ยานพาหนะ',
                                style: TextStyles.small.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'กรมการขนส่งทางบก รถแจ้งหาย รถในคดี',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.xxxSmall.copyWith(color: AppColor.blue_text_light),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Container(
                height: 148.h,
                decoration: BoxDecoration(
                  color: AppColor.blue_menu,
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black,
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0.0, 3.0),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: (){
                      _openSearch(4);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                      child: Column(
                        children: [
                          SizedBox(height: 8.h),
                          Image.asset(AppImage.ic_menu_info, fit: BoxFit.contain, height: 60.h,),
                          SizedBox(height: 8.h),
                          new SizedBox(
                            height: 20,
                            child: new FittedBox(
                              child: Text(
                                'ข้อมูลคดี',
                                style: TextStyles.small.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'คดีอาญา คดีจราจร',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.xxxSmall.copyWith(color: AppColor.blue_text_light),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
/*Text(
                "ศูนย์เทคโนโลยีสารสนเทศกลาง",
                style: TextStyles.body.copyWith(color: AppColor.blue_text_light),
              ),*/
  Widget _buildBottom() => Container(
      padding: EdgeInsets.fromLTRB(0, 6.h, 0, 15.h),
      child: Column(
        children: [
          Center(
            child: Container(
              key: tutorKeyHome.keyScanCardId,
              decoration: BoxDecoration(
                color: AppColor.blue_hightlight,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: AppColor.blue_text_light,
                  width: 2,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.blue_hightlight,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: (){
                      _checkPermission();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppImage.ic_camera, fit: BoxFit.contain, color: Colors.black,),
                          SizedBox(width: 8.w),
                          new SizedBox(
                            height: 22,
                            child: new FittedBox(
                              child: new Text('สแกนบัตร',
                                  style: TextStyles.bodyBold.copyWith(color: Colors.black)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child:Container(
              padding: EdgeInsets.fromLTRB(30.w, 15.h, 0, 2.h),
              child:Row(
                  children: [
                    Image.asset(AppImage.logo_ict15, fit: BoxFit.contain,height: 30.w,),
                    SizedBox(width: 2.w),
                    Image.asset(AppImage.logo_citc15, fit: BoxFit.contain,height: 30.w,),
                    SizedBox(width: 2.w),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            "ศูนย์เทคโนโลยีสารสนเทศกลาง",
                            style: TextStyles.body.copyWith(color: AppColor.blue_text_light,fontSize:12 ),
                          ),
                          new SizedBox(
                            height: 14,
                            child: new FittedBox(
                              child: new Text("สำนักงานเทคโนโลยีสารสนเทศและการสื่อสาร สำนักงานตำรวจแห่งชาติ",
                                  style: TextStyles.xSmall.copyWith(color: AppColor.blue_text_light)
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ]
                    )
                  ]
              ),
            ),
          ),

        ],
      )
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

  Future<bool> _onBack() async {
    bool goBack = false;
    if(tutorHomeWidget!=null) tutorHomeWidget!.close();
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

  Future<void> _checkPermissionLocation() async {
    PermissionStatus locationStatus = await Permission.location.status;
    StringUtils.log(
        '_checkPermissionLocation - locationStatus: ${locationStatus}');

    List<Permission> _permissions = [];
    if (!locationStatus.isGranted) {
      _permissions.add(Permission.location);
    }

    if (_permissions.length > 0) {
      if (locationStatus.isPermanentlyDenied) {
        _askOpenSettingLocation(false);
      } else {
        _requestPermissionLocation(locationStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
        _getNearestPoliceStation();
      } else {
        _askOpenSettingLocation(true);
      }
    }
  }

  Future<void> _checkPermissionLocationResponsible() async {
    PermissionStatus locationStatus = await Permission.location.status;
    StringUtils.log(
        '_checkPermissionLocation - locationStatus: ${locationStatus}');

    List<Permission> _permissions = [];
    if (!locationStatus.isGranted) {
      _permissions.add(Permission.location);
    }

    if (_permissions.length > 0) {
      if (locationStatus.isPermanentlyDenied) {
        _askOpenSettingLocation(false);
      } else {
        _requestPermissionLocation(locationStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
        _getResponsiblePoliceStation();
      } else {
        _askOpenSettingLocation(true);
      }
    }
  }

  Future<void> _requestPermissionLocation(
      PermissionStatus locationStatus, List<Permission> _permissions) async {
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if (!locationStatus.isGranted) {
      locationStatus = statuses[Permission.location] as PermissionStatus;
    }
    StringUtils.log(
        '_requestPermissionLocation - locationStatus: ${locationStatus}');

    if (locationStatus.isPermanentlyDenied) {
      _askOpenSettingLocation(false);
    } else {
      await _checkPermissionLocation();
    }
  }

  Future<void> _getNearestPoliceStation() async {
    await _viewModel.getNearestPoliceStation();
    if (_viewModel.status == ActionStatus.success &&
        _viewModel.lastedLat != null &&
        _viewModel.lastedLon != null) {
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    showImg: true,
                    title: '${_viewModel.stationName}',
                    description:
                    'ที่อยู่: ${_viewModel.stationAddr}\n\nสถานีตำรวจใกล้ฉัน',
                    cancelText: AppMessage.cancel,
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: AppMessage.map,
                    onPress: () async {
                      Navigator.of(context).pop();
                      await MapLauncher.showMarker(
                        mapType:
                        Platform.isIOS ? MapType.apple : MapType.google,
                        coords: Coords(
                            _viewModel.lastedLat!, _viewModel.lastedLon!),
                        title: _viewModel.stationName ?? "",
                      );
                    }),
              )));
    } else if (_viewModel.status == ActionStatus.error) {
      //_handleError();
    }
  }

  Future<void> _getResponsiblePoliceStation() async {
    await _viewModel.getResponsiblePoliceStation();
    if (_viewModel.status == ActionStatus.success &&
        _viewModel.lastedLat != null &&
        _viewModel.lastedLon != null) {
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    showImg: true,
                    title: '${_viewModel.stationName}',
                    description:
                    'ที่อยู่: ${_viewModel.stationAddr}\n\nสถานีตำรวจในพื้นที่ความรับผิดชอบ ณ ตำแหน่งปัจจุบันของฉัน',
                    cancelText: AppMessage.cancel,
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: AppMessage.map,
                    onPress: () async {
                      Navigator.of(context).pop();
                      await MapLauncher.showMarker(
                        mapType:
                        Platform.isIOS ? MapType.apple : MapType.google,
                        coords: Coords(
                            _viewModel.lastedLat!, _viewModel.lastedLon!),
                        title: _viewModel.stationName ?? "",
                      );
                    }),
              )));
    } else if (_viewModel.status == ActionStatus.error) {
      //_handleError();
    }
  }

  void _askOpenSettingLocation(bool isLocationSetting) {
    showDialog(
        context: context,
        builder: (context) =>
            Scaffold(
                backgroundColor: Colors.black.withAlpha(
                    AppConstant.alphaDialog),
                body: Center(
                  child: StatusPopup(
                      title: AppMessage.askPermissionLocation,
                      cancelText: AppMessage.cancel,
                      onCancel: () {
                        Navigator.of(context).pop();
                      },
                      buttonText: AppMessage.ok,
                      onPress: () {
                        Navigator.of(context).pop();
                        if (isLocationSetting) {
                          // Geolocator.openLocationSettings();
                          AppSettings.openAppSettings(
                              type: AppSettingsType.location);
                        } else {
                          openAppSettings();
                        }
                      }),
                )
            )
        );
  }

}


class PasscodeDialogContent extends StatefulWidget {
  PasscodeDialogContent(this.viewModel, this.handleError, {Key? key}): super(key: key);

  final MainScreenViewModel viewModel;
  final Function handleError;

  @override
  _PasscodeDialogContentState createState() => new _PasscodeDialogContentState();
}

class _PasscodeDialogContentState extends State<PasscodeDialogContent> {

  final int MAX_TIME_SECOND = 180;
  int _timeLeftSecond = 0;
  String _timeLeftString = '';
  String _passcode = '';
  String _reference = '';
  String? _username = '';

  @override
  void initState(){
    _startTimer();
    super.initState();
  }

  Future<void> _startTimer() async{
    setState(() {
      _passcode = widget.viewModel.passcode!;
      _timeLeftSecond = MAX_TIME_SECOND;
      _timeLeftString = _convertToTimeString(_timeLeftSecond);
      _username = widget.viewModel.userDto!.policeId;
    });
    _reference = KeyUtils.createCryptoRandomString();
    await _updateTime(_reference);
  }

  Future<void> _updateTime(String ref) async {
    if(ref != _reference) return;

    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _timeLeftSecond--;
      _timeLeftString = _convertToTimeString(_timeLeftSecond);
    });

    if(_timeLeftSecond > 0){
      await _updateTime(ref);
    }else{
      // await _requestRefreshWebPasscode();
    }
  }

  Future<void> _requestRefreshWebPasscode() async {
    if(_timeLeftSecond > 0) return;

    await widget.viewModel.generatePasscode();
    if(widget.viewModel.status == ActionStatus.success){
      _startTimer();
    }else if(widget.viewModel.status == ActionStatus.error){
      ScreenNavigator.pop(context);
      widget.handleError();
    }
  }
  
  String _convertToTimeString(int second) {
    int minute = second ~/ 60;
    int secondLeft = second - (minute * 60);
    String secondString = '${secondLeft}';
    if(secondLeft<10){
      secondString = '0${secondString}';
    }
    return '${minute}:${secondString}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
      body: Center(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Consts.padding),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "รหัสผ่าน CRIMES Online",
                    textAlign: TextAlign.center,
                    style: TextStyles.titleBold.copyWith(color: AppColor.blue_text_dialog)
                ),
                SizedBox(height: 4.h),
                Text(
                    "รหัสผ่านนี้ใช้ในการเข้าสู่ระบบ\nเว็บไซต์ CRIMES Online \nหรือลงทะเบียน SSL VPN",
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: TextStyles.body.copyWith(color: AppColor.blue_text_dialog)
                ),
                SizedBox(height: 24.h),
                Text(
                    "ชื่อผู้ใช้งาน : ${_username} \n   รหัสผ่าน : ${_passcode}",
                    textAlign: TextAlign.center,
                    style: TextStyles.titleBold.copyWith(color: AppColor.blue_text_dialog)
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: _requestRefreshWebPasscode,
                        child: Image.asset(AppImage.ic_refresh, color: _timeLeftSecond>0 ? AppColor.grey_btn_text:null, fit: BoxFit.contain, width: 24.w,),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                        'ใช้โค้ดภายใน ${_timeLeftString} นาที',
                        style: TextStyles.body.copyWith(color: AppColor.grey_btn_text)
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                PrimaryCustomButton(
                  AppMessage.ok,
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                  }),
            )));
    if (goBack) await closeApp();
    return goBack;
  }

}

