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

class SearchDBScreenParam extends NavigationParameter {
  SearchDBScreenParam(this.type, this.userDto, this.paramScope, {this.favoriteDto});

  final String type;
  final UserDto userDto;
  final ParamScope paramScope;
  final FavoriteDto? favoriteDto;
}

class SearchDBScreen extends StatefulWidget {
  SearchDBScreen(this.param, {Key? key}) : super(key: key);

  final SearchDBScreenParam param;

  @override
  _SearchDBScreenState createState() => _SearchDBScreenState();
}

class _SearchDBScreenState extends State<SearchDBScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SearchDBScreenViewModel _viewModel = SearchDBScreenViewModel();
  String _title = '';

  @override
  void initState() {
    _viewModel.setType(widget.param.type);
    _viewModel.userDto = widget.param.userDto;
    _viewModel.paramScope = widget.param.paramScope;
    if(widget.param.favoriteDto != null){
      _viewModel.favoriteDto = widget.param.favoriteDto!;
    }else{
      _viewModel.favoriteDto.choices = [];
      _viewModel.favoriteDto.innerDbs = [];
      _viewModel.favoriteDto.outerDbs = [];
    }
    _title = _viewModel.title;
    _refreshAll();

    StringUtils.log("scope: ${_viewModel.paramScope.toString()}");
    super.initState();
  }

  void _refreshAll() {
    _viewModel.clearAll();
    _viewModel.getListDB();

    if(!AppConstant.isMockUser){
      //TODO: Auto search if come from favorite ?
      if(_viewModel.favoriteDto.choices!.length>0 && _viewModel.selectDbArray.length>0){
        _search();
      }else{
        _viewModel.refreshCanAddFavorite();
      }
    }else{
      _viewModel.isEnableFavButton = false;
    }

  }

  Future<void> _addToFavorite() async{
    _viewModel.refreshCanAddFavorite();
    if(!_viewModel.isEnableFavButton) return;

    //Show dialog create favorite title
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FavTitleDialogContent(_onGetTitle);
        });
  }

  Future<void> _onGetTitle(String title) async{
    if(title == null || title.isEmpty) return;

    await _viewModel.addFavorite(title);
    if (_viewModel.status == ActionStatus.success) {
      _showToastNotification('เพิ่มรายการโปรดสำเร็จ');
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

  Future<void> _search() async{
    if(!_viewModel.isEnableButton) return;
    
    await _viewModel.search();
    if (_viewModel.status == ActionStatus.success) {
      if(_viewModel.groupResultArray.length > 0){
        if(_viewModel.favoriteDto.choices!.length > 0) {
          ScreenNavigator.navigateReplaceTo(Routes.searchResult, param: SearchResultScreenParam(_viewModel.searchType, _viewModel.groupResultArray, _viewModel.userDto!));
        }else{
          ScreenNavigator.navigateTo(Routes.searchResult, param: SearchResultScreenParam(_viewModel.searchType, _viewModel.groupResultArray, _viewModel.userDto!));
        }
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
        if(widget.param.favoriteDto!=null && widget.param.favoriteDto!.choices != null && widget.param.favoriteDto!.choices!.length > 0)
          _buildAppBar(widget.param.favoriteDto!.title!),
        if(!(widget.param.favoriteDto!=null && widget.param.favoriteDto!.choices != null && widget.param.favoriteDto!.choices!.length > 0))
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
    Database? dbModel;
    if(isInnerDb) {
      dbModel = _viewModel.innerDbs[index];
    }else {
      dbModel = _viewModel.outerDbs[index];
    }
    if(dbModel.checked){
      return Column(
        children: [
          SizedBox(height: 15.h,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColor.grey_line,
                style: BorderStyle.solid,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: dbModel.enable
              ? Material(
                color: Colors.transparent,

                child: InkWell(
                    splashColor: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: (){
                      _selectItem(index, isInnerDb);
                    },
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
              )
              : Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
                onTap: (){
                  _openDialogDetail(dbModel!.title, dbModel.hintKeyword);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      child: Image.asset(AppImage.ic_lock_grey, fit: BoxFit.contain, width: 20.w),
                    ),
                    Expanded(
                      child: Text(
                        '${dbModel.title}',
                        style: TextStyles.bodySemi.copyWith(
                          color: Colors.grey,
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
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColor.grey_line,
                style: BorderStyle.solid,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child:  dbModel.enable
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: (){
                        _selectItem(index, isInnerDb);
                      },
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
                )
              : Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
                onTap: (){
                  _openDialogDetail(dbModel!.title, dbModel.hintKeyword);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      child: Image.asset(AppImage.ic_lock_grey, fit: BoxFit.contain, width: 20.w),
                    ),
                    Expanded(
                      child: Text(
                        '${dbModel.title}',
                        style: TextStyles.bodySemi.copyWith(
                          color: Colors.grey,
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
          if(_viewModel.favoriteDto.choices!.length == 0)
            Expanded(
              child: SecondaryCustomButton(
                '+เพิ่มรายการโปรด',
                onPressed: () => _addToFavorite(),
                isEnabled: _viewModel.isEnableFavButton,
              ),
            ),
          if(_viewModel.favoriteDto.choices!.length == 0)
            SizedBox(width: 16.w),
          Expanded(
            child: PrimaryCustomButton(
              'ค้นหา',
              onPressed: () =>  _search(),
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


class FavTitleDialogContent extends StatefulWidget {
  FavTitleDialogContent(this.callback, {Key? key}): super(key: key);

  final Function callback;

  @override
  _FavTitleDialogContentState createState() => new _FavTitleDialogContentState();
}

class _FavTitleDialogContentState extends State<FavTitleDialogContent> {

  String _title = '';

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
                    "ตั้งชื่อรายการโปรด",
                    textAlign: TextAlign.center,
                    style: TextStyles.titleBold.copyWith(color: AppColor.blue_text_dialog)
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'ชื่อรายการโปรด',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  onChanged: (text){
                    setState(() {
                      _title = text;
                    });
                  },
                  maxLength: 25,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryCustomButton(
                        AppMessage.cancel,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: PrimaryCustomButton(
                        AppMessage.ok,
                        isEnabled: _title.trim().isNotEmpty,
                        onPressed: (){
                          Navigator.pop(context);
                          widget.callback(_title);
                        },
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
