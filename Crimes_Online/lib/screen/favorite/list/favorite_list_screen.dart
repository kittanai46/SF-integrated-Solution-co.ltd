import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/data/dto/profile/policestation_dto.dart';
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
import 'package:crimes/screen/favorite/criteria/favorite_criteria_screen.dart';
import 'package:crimes/screen/favorite/db/favorite_db_screen.dart';
import 'package:crimes/screen/favorite/list/favorite_list_screen_view_model.dart';
import 'package:crimes/screen/notification/detail/notification_detail_screen.dart';
import 'package:crimes/screen/notification/list/notification_list_screen_view_model.dart';
import 'package:crimes/screen/search/criteria/search_criteria_screen.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/custom_notification.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FavoriteListScreenParam extends NavigationParameter {
  FavoriteListScreenParam(this.userDto, this.listPoliceStationDto, this.fromEditFav);

  final UserDto userDto;
  final ListPoliceStationDto listPoliceStationDto;
  final bool fromEditFav;
}

class FavoriteListScreen extends StatefulWidget {
  FavoriteListScreen(this.param, {Key? key}) : super(key: key);

  final FavoriteListScreenParam param;

  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavoriteListScreenViewModel _viewModel = FavoriteListScreenViewModel();

  @override
  void initState() {
    _viewModel.userDto = widget.param.userDto;
    _viewModel.listPoliceStationDto = widget.param.listPoliceStationDto;
    _refreshData();

    if(widget.param.fromEditFav){
      _showToastNotification('แก้ไขรายการโปรดสำเร็จ');
    }

    super.initState();
  }

  Future<void> _refreshData() async {
    await _viewModel.refreshData();
  }

  Future<void> _askDeleteFavorite(int index) async{
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: "ยืนยันลบรายการโปรด?",
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    _deleteFavorite(index);
                  }
              ),
            )
        )
    );
  }

  Future<void> _toggleEdit() async {
    await _viewModel.toggleEdit();
    if (_viewModel.status == ActionStatus.success) {
      // _showToastNotification('ลบรายการโปรดสำเร็จ');
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
  }

  Future<void> _deleteFavorite(int index) async{
    await _viewModel.deleteFavorite(index);
    if (_viewModel.status == ActionStatus.success) {
      _showToastNotification('ลบรายการโปรดสำเร็จ');
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
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

  void _editFavorite(int index) {
    if(index > -2){
      FavoriteDto favoriteDto = _viewModel.favorites[index];
      ScreenNavigator.navigateTo(Routes.favoriteCriteria, param: FavoriteCriteriaScreenParam(favoriteDto.category!, _viewModel.userDto!, favoriteDto, index));
    }else{
      FavoriteDto favoriteDto = _viewModel.defaultFavorite;
      ParamScope scope = ParamScope();
      scope.showInputPid = true;
      scope.hasInputPid = true;
      scope.pid = '1234567890123';
      ScreenNavigator.navigateTo(Routes.favoriteDB, param: FavoriteDBScreenParam(favoriteDto.category!, _viewModel.userDto!, scope, favoriteDto, index));
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
        _buildAppBar('รายการโปรดทั้งหมด'),
        Expanded(
          child: Container(
            color: AppColor.white_bg,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 16.h,),

                // Normal Mode
                if(!_viewModel.isEdit)
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: (){
                            _toggleEdit();
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Image.asset(AppImage.ic_setting, fit: BoxFit.contain, width: 24.w,),
                                SizedBox(width: 8.w,),
                                Text(
                                  'จัดการรายการโปรด',
                                  style: TextStyles.bodyBold.copyWith(color: AppColor.blue_text),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if(!_viewModel.isEdit)
                  _getListItem(context, _viewModel.defaultFavorite,),
                if(!_viewModel.isEdit)
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        for(int i=0; i<_viewModel.favorites.length; i++)
                          _getListItem(context, _viewModel.favorites[i],),
                      ],
                    ),
                  ),

                // Edit Mode
                if(_viewModel.isEdit)
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: (){
                            _toggleEdit();
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Image.asset(AppImage.ic_check, fit: BoxFit.contain, width: 24.w,),
                                SizedBox(width: 8.w,),
                                Text(
                                  'บันทึก',
                                  style: TextStyles.bodyBold.copyWith(color: AppColor.blue_text),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if(_viewModel.isEdit)
                  _getEditListItem(context, -2, _viewModel.defaultFavorite,),
                if(_viewModel.isEdit)
                  Expanded(
                    child: ReorderableListView(
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
                        for(int i=0; i<_viewModel.favorites.length; i++)
                          _getEditListItem(context, i, _viewModel.favorites[i],)
                      ],
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final item = _viewModel.favorites.removeAt(oldIndex);
                          _viewModel.favorites.insert(newIndex, item);
                        });
                      },
                    ),
                  ),

                SizedBox(height: 16.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColor.orange_bg,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppImage.ic_info, fit: BoxFit.contain, width: 24.w,),
                      SizedBox(width: 8.w,),
                      Text(
                        '5 รายการแรกจะแสดงที่หน้า Home',
                        style: TextStyles.body.copyWith(color: AppColor.orange_text),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h,),
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

  Widget _getEditListItem(BuildContext context, int index, FavoriteDto favoriteDto) {
    return Material(
      key: ValueKey(favoriteDto),
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        // onTap: (){ _selectItem(context, favoriteDto, index); },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  children: [
                    if(index>-2)
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: (){
                            _askDeleteFavorite(index);
                          },
                          child: Container(
                            child: Image.asset(AppImage.ic_delete, fit: BoxFit.contain, width: 23.w,),
                          )
                        ),
                      ),
                    if(index==-2)
                      SizedBox(width: 23.w,),
                    SizedBox(width: 19.w,),

                    if(favoriteDto.category == AppConstant.kSearchPerson)
                      Image.asset(AppImage.ic_fav_person, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchCar)
                      Image.asset(AppImage.ic_fav_car, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchWeapon)
                      Image.asset(AppImage.ic_fav_weapon, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchInfo)
                      Image.asset(AppImage.ic_fav_info, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchFirm)
                      Image.asset(AppImage.ic_fav_firm, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchAsset)
                      Image.asset(AppImage.ic_fav_asset, fit: BoxFit.contain),
                    SizedBox(width: 16.w,),
                    Expanded(
                        child: Text(
                          '${favoriteDto.title}',
                          style: TextStyles.body.copyWith(color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ),
                    SizedBox(width: 16.w,),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: (){
                          _editFavorite(index);
                        },
                        child: Container(
                          child: Image.asset(AppImage.ic_edit, fit: BoxFit.contain, width: 20.w, height: 20.h,),
                        )
                      ),
                    ),
                    SizedBox(width: 12.w,),
                    if(index>-2)
                      Image.asset(AppImage.ic_drag, fit: BoxFit.contain, width: 23.w),
                    if(index==-2)
                      SizedBox(width: 23.w,),
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

  Widget _getListItem(BuildContext context, FavoriteDto favoriteDto) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        onTap: (){
          _selectItem(context, favoriteDto);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  children: [
                    if(favoriteDto.category == AppConstant.kSearchPerson)
                      Image.asset(AppImage.ic_fav_person, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchCar)
                      Image.asset(AppImage.ic_fav_car, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchWeapon)
                      Image.asset(AppImage.ic_fav_weapon, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchInfo)
                      Image.asset(AppImage.ic_fav_info, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchFirm)
                      Image.asset(AppImage.ic_fav_firm, fit: BoxFit.contain),
                    if(favoriteDto.category == AppConstant.kSearchAsset)
                      Image.asset(AppImage.ic_fav_asset, fit: BoxFit.contain),
                    SizedBox(width: 16.w,),
                    Expanded(
                      child: Text(
                        '${favoriteDto.title}',
                        style: TextStyles.body.copyWith(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 16.w,),
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

  void _selectItem(BuildContext context, FavoriteDto favoriteDto) {
    ScreenNavigator.navigateTo(Routes.searchCriteria, param: SearchCriteriaScreenParam(favoriteDto.category!, _viewModel.userDto!, _viewModel.listPoliceStationDto, favoriteDto: favoriteDto));
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
