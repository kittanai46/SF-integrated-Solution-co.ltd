import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/database.dart';
import 'package:crimes/data/entity/source_db.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/favorite/db/favorite_db_screen_view_model.dart';
import 'package:crimes/screen/favorite/title/favorite_title_screen.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/search/db/search_db_screen_view_model.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/screen/search/result/search_result_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/custom_notification.dart';
import 'package:crimes/widget/custom_text_field.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteDBScreenParam extends NavigationParameter {
  FavoriteDBScreenParam(this.type, this.userDto, this.paramScope, this.favoriteDto, this.editIndex);

  final String type;
  final UserDto userDto;
  final ParamScope paramScope;
  final FavoriteDto favoriteDto;
  final int editIndex;
}

class FavoriteDBScreen extends StatefulWidget {
  FavoriteDBScreen(this.param, {Key? key}) : super(key: key);

  final FavoriteDBScreenParam param;

  @override
  _FavoriteDBScreenState createState() => _FavoriteDBScreenState();
}

class _FavoriteDBScreenState extends State<FavoriteDBScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavoriteDBScreenViewModel _viewModel = FavoriteDBScreenViewModel();

  @override
  void initState() {
    _viewModel.searchType = widget.param.type;
    _viewModel.userDto = widget.param.userDto;
    _viewModel.paramScope = widget.param.paramScope;
    _viewModel.favoriteDto = widget.param.favoriteDto;
    _refreshAll();

    StringUtils.log("scope: ${_viewModel.paramScope.toString()}");
    super.initState();
  }

  void _refreshAll() {
    _viewModel.clearAll();
    _viewModel.getListDB();
  }

  Future<void> _confirmDB() async{
    if(!_viewModel.isEnableButton) return;
    
    _viewModel.confirmDB();
    ScreenNavigator.navigateTo(Routes.favoriteTitle, param: FavoriteTitleScreenParam(_viewModel.userDto!, _viewModel.favoriteDto, widget.param.editIndex));
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
        ),
      ),
    );
  }

  Widget _buildLayout() => Container(
    decoration: getBg(),
    child: Column(
      children: <Widget>[
        _buildAppBar('เพิ่มรายการโปรด'),
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
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              "กรุณาเลือกแหล่งข้อมูล",
              style: TextStyles.titleBold.copyWith(color: Colors.black),
            ),
            Text(
              "ท่านสามารถเลือกแหล่งข้อมูลได้สูงสุดไม่เกิน 4 ข้อมูล",
              style: TextStyles.small.copyWith(color: Colors.black),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              height: 0.5,
              color: AppColor.grey_line,
            ),

            SizedBox(height: 24.h),
            Text(
              (_viewModel.innerDbs.length>0) ? 'หน่วยงานภายใน' : '',
              style: TextStyles.bodyBold.copyWith(color: Colors.black),
            ),
            for(int i=0; i<_viewModel.innerDbs.length; i++)
              _getListItem(context, i, true),

            SizedBox(height: 24.h),
            Text(
              (_viewModel.outerDbs.length>0) ? 'หน่วยงานภายนอก' : '',
              style: TextStyles.bodyBold.copyWith(color: Colors.black),
            ),
            for(int i=0; i<_viewModel.outerDbs.length; i++)
              _getListItem(context, i, false),

            SizedBox(height: 32.h,),
          ],
        ),
      ),
    ),
  );

  void _selectItem(int index, bool isInnerDb) {
    setState(() {
      _viewModel.selectItem(index, isInnerDb);
    });
  }

  Widget _getListItem(BuildContext context, int index, bool isInnerDb) {
    Database? dbModel = null;
    if(isInnerDb) {
      dbModel = _viewModel.innerDbs[index];
    }else {
      dbModel = _viewModel.outerDbs[index];
    }
    if(dbModel.checked){
      return Column(
        children: [
          SizedBox(height: 15.h,),
          Material(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: (){
                _selectItem(index, isInnerDb);
              },
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.transparent,
                  border: Border.all(
                    color: AppColor.grey_line,
                    style: BorderStyle.solid,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      child: Image.asset(AppImage.ic_radio_check, fit: BoxFit.contain, width: 20.w),
                    ),
                    Expanded(
                      child: Text(
                        '${dbModel.title}',
                        style: TextStyles.bodySemi.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }else {
      return Column(
        children: [
          SizedBox(height: 15.h,),
          Material(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              onTap: (){
                _selectItem(index, isInnerDb);
              },
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.white,
                  border: Border.all(
                    color: AppColor.grey_line,
                    style: BorderStyle.solid,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      child: Image.asset(AppImage.ic_radio, fit: BoxFit.contain, width: 20.w),
                    ),
                    Expanded(
                      child: Text(
                        '${dbModel.title}',
                        style: TextStyles.bodySemi.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

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
      child: Row(
        children: [
          Expanded(
            child: PrimaryCustomButton(
              'ถัดไป',
              onPressed: () =>  _confirmDB(),
              isEnabled: _viewModel.isEnableButton,
            ),
          ),
        ],
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