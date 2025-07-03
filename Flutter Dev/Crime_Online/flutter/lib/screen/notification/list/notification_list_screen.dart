import 'dart:math';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/noti.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/notification/detail/notification_detail_screen.dart';
import 'package:crimes/screen/notification/list/notification_list_screen_view_model.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NotificationListScreenParam extends NavigationParameter {
  NotificationListScreenParam(this.userDto, this.notifications, this.notifyDto);

  final UserDto userDto;
  final List<NotifyDto> notifications;
  NotifyDto? notifyDto;
}

class NotificationListScreen extends StatefulWidget {
  NotificationListScreen(this.param, {Key? key}) : super(key: key);

  final NotificationListScreenParam param;

  @override
  _NotificationListScreenState createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  NotificationListScreenViewModel _viewModel = NotificationListScreenViewModel();

  @override
  void initState() {
    _viewModel.userDto = widget.param.userDto;
    _viewModel.notifications = widget.param.notifications;
    
    if(_viewModel.notifications==null || _viewModel.notifications.length==0){
      _refreshData();
    }
    _checkOpenDetail();
    super.initState();
  }

  Future<void> _checkOpenDetail() async {
    if(widget.param.notifyDto==null) return;
    
    await ScreenNavigator.navigateTo(Routes.notificationDetail, animation: false, param: NotificationDetailScreenParam(widget.param.notifyDto!, _viewModel.userDto));
    _refreshData();
  }

  Future<void> _refreshData() async {
    await _viewModel.refreshData();
    if(_viewModel.status == ActionStatus.error){
      _handleError();
    }else if(_viewModel.status == ActionStatus.success && widget.param.notifyDto!=null){
      int foundIndex = -1;
      for(int i=0; i<_viewModel.notifications.length; i++){
        final notifyDto = _viewModel.notifications[i];
        if(notifyDto.notifyId == widget.param.notifyDto!.notifyId){
          foundIndex = i;
          break;
        }
      }
      if(foundIndex>-1){
        setState(() {
          _viewModel.updateNotifyIndex(foundIndex);
        });
      }
      widget.param.notifyDto = null;
    }
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
          onRetry: () => {},
        ),
      ),
    );
  }

  Widget _buildLayout() => Container(
    decoration: getBg(),
    child: Column(
      children: <Widget>[
        _buildAppBar('การแจ้งเตือน'),
        Expanded(
          child: Container(
            color: AppColor.white_bg,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: RefreshIndicator(
              child:  ListView.builder(
                itemCount: _viewModel.notifications.length,
                itemBuilder: (context, index) => _getListItem(context, index, _viewModel.notifications,),
              ),
              onRefresh: _refreshData,
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
            onTap: (){}, //_backToHomeScreen(),
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

  Widget _getListItem(BuildContext context, int index, List<NotifyDto> array) {
    NotifyDto notifyDto = array[index];
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        onTap: (){
          _selectItem(context, notifyDto, index);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        if(notifyDto.readFlag == 'false')
                          CircleAvatar(
                              radius: 4.w,
                              backgroundColor: AppColor.green_noti,
                              child: Container()
                          ),
                        if(notifyDto.readFlag == 'true')
                          CircleAvatar(
                              radius: 4.w,
                              backgroundColor: AppColor.grey_noti,
                              child: Container()
                          ),
                        SizedBox(width: 8.w),
                        Expanded(
                            child: Text(
                              "${notifyDto.title}",
                              style: TextStyles.bodyBold.copyWith(color: Colors.black,),
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                        ),
                        Text(
                          "${notifyDto.readDate}",
                          style: TextStyles.smallSemi.copyWith(color: AppColor.grey_noti,fontSize: 12),
                        )
                      ],
                    ),
                    Text(
                      "${notifyDto.content}",
                      style: TextStyles.bodySemi.copyWith(color: AppColor.grey_noti_text,fontSize: 12),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                color: Colors.grey.shade200,
                height: 1,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectItem(BuildContext context, NotifyDto notifyDto, int index) {
    ScreenNavigator.navigateTo(Routes.notificationDetail, param: NotificationDetailScreenParam(notifyDto, _viewModel.userDto));
    setState(() {
      _viewModel.updateNotifyIndex(index);
    });
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
