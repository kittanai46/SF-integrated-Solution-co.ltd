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
import 'package:crimes/screen/favorite/criteria/favorite_criteria_screen_view_model.dart';
import 'package:crimes/screen/favorite/db/favorite_db_screen.dart';
import 'package:crimes/screen/favorite/title/favorite_title_screen_view_model.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/search/db/search_db_screen_view_model.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/screen/search/result/search_result_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
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

class FavoriteTitleScreenParam extends NavigationParameter {
  FavoriteTitleScreenParam(this.userDto, this.favoriteDto, this.editIndex,);

  final UserDto userDto;
  final FavoriteDto favoriteDto;
  final int editIndex;
}

class FavoriteTitleScreen extends StatefulWidget {
  FavoriteTitleScreen(this.param, {Key? key}) : super(key: key);

  final FavoriteTitleScreenParam param;

  @override
  _FavoriteTitleScreenState createState() => _FavoriteTitleScreenState();
}

class _FavoriteTitleScreenState extends State<FavoriteTitleScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FavoriteTitleScreenViewModel _viewModel = FavoriteTitleScreenViewModel();

  @override
  void initState() {
    _viewModel.userDto = widget.param.userDto;
    _viewModel.setFavorite(widget.param.favoriteDto);
    _viewModel.editIndex = widget.param.editIndex;
    _tcTitle.text =  '${_viewModel.favoriteDto.title}';
    _viewModel.setTitle('${_viewModel.favoriteDto.title}');
    if(_viewModel.editIndex == -2){
      _confirm();
    }
    super.initState();
  }

  Future<void> _confirm() async{
    if(!_viewModel.isEnableButton) return;

    await _viewModel.requestAddFavorite();
    if (_viewModel.status == ActionStatus.success) {
      if(_viewModel.editIndex == -1){
        ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto!, fromCreateFav: true));
      }else{
        ScreenNavigator.replaceEntireStackTo(Routes.main, param: MainScreenParam(_viewModel.userDto!, fromCreateFav: true, fromEditFav: true));
      }

    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
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
              "ตั้งชื่อรายการโปรด",
              style: TextStyles.titleBold.copyWith(color: Colors.black),
            ),
            _buildFormTitle(),
            SizedBox(height: 47.h),
            Text(
                "แหล่งข้อมูลที่เลือก",
              style: TextStyles.bodySemi.copyWith(color: Colors.black),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: -8,
                      blurRadius: 24,
                      offset: Offset(0.0, 12.0)// changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(int i=0; i<_viewModel.titleDBs.length; i++)
                    Column(
                      children: [
                        if(i>0)
                          Container(
                            color: AppColor.grey_line,
                            height: 0.5,
                            width: double.infinity,
                          ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Text(
                            "${_viewModel.titleDBs[i]}",
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.bodyBold.copyWith(color: AppColor.blue_text),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            SizedBox(height: 32.h,),
          ],
        ),
      ),
    ),
  );

  TextEditingController _tcTitle = TextEditingController();
  Widget _buildFormTitle() => Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 16.h, 0.w, 0),
      child: CustomTextField(
        keyboardType: TextInputType.text,
        labelText: 'ชื่อรายการโปรด',
        controller: _tcTitle,
        bgColor: Colors.white,
        textColor: Colors.black,
        textInputAction: TextInputAction.next,
        onChanged: (text) => {
          _viewModel.setTitle(text)
        },
        maxLength: 25
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
      child: Row(
        children: [
          Expanded(
            child: PrimaryCustomButton(
              'บันทึก',
              onPressed: () =>  _confirm(),
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