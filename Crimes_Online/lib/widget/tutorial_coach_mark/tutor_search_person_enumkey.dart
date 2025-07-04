import 'package:flutter/cupertino.dart';

class TutorSPerosnEnumKey{
  final GlobalKey _keyPersonScanCardId = new GlobalKey();
  final GlobalKey _keyPersonParams1 = new GlobalKey();
  final GlobalKey _keyPersonParams2 = new GlobalKey();
  final GlobalKey _keyPersonParams3 = new GlobalKey();
  final GlobalKey _keyPersonParams4 = new GlobalKey();
  final GlobalKey _keyPersonParams5 = new GlobalKey();
  final GlobalKey _keyPersonActionClear = new GlobalKey();
  final GlobalKey _keyPersonActionNext = new GlobalKey();

  GlobalKey get keyPersonScanCardId => this._keyPersonScanCardId;
  GlobalKey get keyPersonParams1 => this._keyPersonParams1;
  GlobalKey get keyPersonParams2 => this._keyPersonParams2;
  GlobalKey get keyPersonParams3 => this._keyPersonParams3;
  GlobalKey get keyPersonParams4 => this._keyPersonParams4;
  GlobalKey get keyPersonParams5 => this._keyPersonParams5;
  GlobalKey get keyPersonActionClear => this._keyPersonActionClear;
  GlobalKey get keyPersonActionNext => this._keyPersonActionNext;
}