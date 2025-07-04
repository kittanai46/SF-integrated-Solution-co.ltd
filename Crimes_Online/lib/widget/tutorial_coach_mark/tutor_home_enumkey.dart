import 'package:flutter/cupertino.dart';

class TutorHomeEnumKey{
  final GlobalKey _keyNoti = new GlobalKey();
  final GlobalKey _keyMenu = new GlobalKey();
  final GlobalKey _keyFavourite = new GlobalKey();
  final GlobalKey _keyInfomation = new GlobalKey();
  final GlobalKey _keyDataSource = new GlobalKey();
  final GlobalKey _keyScanCardId = new GlobalKey();

  GlobalKey get keyNoti => this._keyNoti;
  GlobalKey get keyMenu => this._keyMenu;
  GlobalKey get keyFavourite => this._keyFavourite;
  GlobalKey get keyInfomation => this._keyInfomation;
  GlobalKey get keyDataSource => this._keyDataSource;
  GlobalKey get keyScanCardId => this._keyScanCardId;
}