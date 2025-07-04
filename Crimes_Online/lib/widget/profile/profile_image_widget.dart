import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/profile/profile_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../status_popup.dart';

class ProfileImageWidget extends StatefulWidget {
  final BuildContext mContext;
  final Function(String?)? onAfterRead;

  const ProfileImageWidget({Key? key, this.onAfterRead, required this.mContext}) : super(key: key);
  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  String? _image;
  bool isNeedStoragePermission = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async{
    _image = await ProfileUtils.getImageProfileBase64();
    setState(() {

    });
  }

  void showMenu(){
    showDialog(
        context: widget.mContext,
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
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildRowItem('เลือกจากคลังภาพ',true,(){
                          Navigator.pop(context);
                          //showSelectPicture(ImageSource.gallery);
                          _checkPermissionGallery();
                        }),
                        _buildRowItem('เปิดกล้อง',false,(){
                          Navigator.pop(context);
                          //showSelectPicture(ImageSource.camera);
                          _checkPermissionCamera();
                        }),
                        _buildRowItem('ใช้รูปเริ่มต้น',false,(){
                          _clearImageProfile();
                          Navigator.pop(context);
                        }),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }

  Widget _buildRowItem(String title,bool isFirst, Function? callback) => Material(
    color: Colors.transparent,
    child: InkWell(
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      onTap: (){
        if(callback!=null) callback.call();
      },
      child: Container(
        child: Column(
          children: [
            isFirst == false ? Container(
              color: AppColor.grey_line2,
              height: 1,
              width: double.infinity,
            ) : Container(),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${title}',
                      style: TextStyles.body.copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Image.asset(AppImage.ic_chevron_right, fit: BoxFit.contain, width: 14,),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    ),
  );

  void _onImageAvatarPressed() async{
    try {
      showMenu();
    }catch(error){}
  }

  void _clearImageProfile() async{
    ProfileUtils.saveImageProfile('');
    widget.onAfterRead!('');
    setState(() {
      this._image = '';
    });
  }

  void showSelectPicture(ImageSource source) async{
    try {
      var pickedFile = await ImagePicker().pickImage(source: source , maxWidth: 512);
      if (pickedFile == null) return;
      Navigator.of(context).pop();

      // TODO: Crop image
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        compressFormat: ImageCompressFormat.jpg,
        // maxWidth: 200,
        // maxHeight: 200,
        compressQuality: 80,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop your image.',
              toolbarColor: AppColor.primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          )
        ],
      );

      if(croppedFile!=null){
        // final base64File = base64Encode(croppedFile.readAsBytesSync());
        File imageFile = File(croppedFile.path);
        Uint8List imagebytes = await imageFile.readAsBytes();
        String base64File = base64.encode(imagebytes);
        StringUtils.log("base64File: ${base64File}");

        ProfileUtils.saveImageProfile(base64File);
        widget.onAfterRead!(base64File);
        setState(() {
          this._image = base64File;
        });
      }

    }catch(error){
      print('${error}');
    }
  }

  Future<void> _checkPermissionCamera() async{
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus microphoneStatus = await Permission.microphone.status;
    StringUtils.log('_checkPermissionCamera - cameraStatus: ${cameraStatus}');
    StringUtils.log('_checkPermissionCamera - microphoneStatus: ${microphoneStatus}');

    List<Permission> _permissions = [];
    if(!cameraStatus.isGranted){
      _permissions.add(Permission.camera);
    }
    if(!microphoneStatus.isGranted){
      _permissions.add(Permission.microphone);
    }

    if(_permissions.length > 0){
      if(cameraStatus.isPermanentlyDenied || microphoneStatus.isPermanentlyDenied) {
        _askOpenSettingCamera();
      }else{
        _requestPermissionCamera(cameraStatus, microphoneStatus, _permissions);
      }
    }else if(_permissions.length == 0){
      //_openCamera();
      showSelectPicture(ImageSource.camera);
    }
  }

  Future<void> _requestPermissionCamera(PermissionStatus cameraStatus, PermissionStatus microphoneStatus, List<Permission> _permissions) async{
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if(!cameraStatus.isGranted) {
      cameraStatus = statuses[Permission.camera] as PermissionStatus;
    }
    if(!microphoneStatus.isGranted) {
      microphoneStatus = statuses[Permission.microphone] as PermissionStatus;
    }
    StringUtils.log('_requestPermissionCamera - cameraStatus: ${cameraStatus}');
    StringUtils.log('_requestPermissionCamera - microphoneStatus: ${microphoneStatus}');

    if(cameraStatus.isPermanentlyDenied || microphoneStatus.isPermanentlyDenied){
      _askOpenSettingCamera();
    }else{
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
                  title: AppMessage.askPermissionCameraProfile,
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

  Future<void> checkAndroid() async {
    if(!Platform.isAndroid) return;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      /// use [Permissions.storage.status]
      isNeedStoragePermission = true;
    }
  }

  Future<void> _checkPermissionGallery() async{
    await checkAndroid();
    PermissionStatus photoStatus = await (isNeedStoragePermission ? Permission.storage.status:Permission.photos.status);
    StringUtils.log('_checkPermissionGallery - photoStatus: ${photoStatus}');

    List<Permission> _permissions = [];
    if(!photoStatus.isGranted){
      _permissions.add(isNeedStoragePermission ? Permission.storage:Permission.photos);
    }

    if(_permissions.length > 0){
      if(photoStatus.isPermanentlyDenied) {
        _askOpenSettingGallery();
      }else {
        _requestPermissionGallery(photoStatus, _permissions);
      }
    }else if(_permissions.length == 0){
      //_openGallery();
      showSelectPicture(ImageSource.gallery);
    }
  }

  Future<void> _requestPermissionGallery(PermissionStatus photoStatus, List<Permission> _permissions) async{
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if(!photoStatus.isGranted) {
      photoStatus = statuses[isNeedStoragePermission ? Permission.storage:Permission.photos] as PermissionStatus;
    }
    StringUtils.log('_requestPermissionGallery - photoStatus: ${photoStatus}');

    if(photoStatus.isPermanentlyDenied){
      _askOpenSettingGallery();
    }else{
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
                  title: AppMessage.askPermissionGalleryProfile,
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

  @override
  Widget build(BuildContext context) {
    var size = 100.0;
    return ClipRRect (
      borderRadius: BorderRadius.circular(size),
      child: Container(
          height: size,
          width: size,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                Positioned(
                  child: Material(
                    elevation: 4.0,
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    child: (_image!=null && _image != '')
                      ? Ink.image(
                          image: ProfileUtils.imageFromBase64String(_image!),
                          fit: BoxFit.cover,
                          width: size-4,
                          height: size-4,
                          child: InkWell(
                            onTap: _onImageAvatarPressed,
                          ),
                        )
                      : Ink.image(
                          image: AssetImage(AppImage.ic_profile),
                          fit: BoxFit.cover,
                          width: size-4,
                          height: size-4,
                          child: InkWell(
                            onTap: _onImageAvatarPressed,
                          ),
                        ),

                  ),
                ),
                Positioned(
                  child: new Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: InkWell(
                        onTap: _onImageAvatarPressed,
                        child: Container(
                          color: Colors.black.withOpacity(0.8),
                          height: 25,
                          width: double.infinity,
                          child: Center(child: Text('แก้ไข',style: TextStyles.body.copyWith(color: Colors.white,fontSize: 10),)),
                        ),
                      )
                  ),
                )
              ],
            ),
          )),
    );
  }
}

