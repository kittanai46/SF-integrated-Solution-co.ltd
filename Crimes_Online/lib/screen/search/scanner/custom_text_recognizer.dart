import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crimes/util/string_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CustomFirebaseVision {
  CustomFirebaseVision._();

  static const MethodChannel channel = MethodChannel('th.go.police.crimes/google_ml');
  static int nextHandle = 0;

  static final CustomFirebaseVision instance = CustomFirebaseVision._();

  CustomTextRecognizer textRecognizer(bool fromCamera) {
    return CustomTextRecognizer._(
      fromCamera: fromCamera,
      handle: nextHandle++,
    );
  }
}


class CustomTextRecognizer {
  final int _handle;

  CustomTextRecognizer._({
    required bool fromCamera,
    required int handle,
  })  : _handle = handle, _fromCamera = fromCamera;

  bool _fromCamera = false;
  bool _hasBeenOpened = false;
  bool _isClosed = false;

  /// Detects [VisionText] from a [FirebaseVisionImage].
  Future<String?> processImage(Map<String, dynamic>? maps) async {
    if(maps==null) return null;

    assert(!_isClosed);
    assert(maps != null);
    _hasBeenOpened = true;

    String? reply;

    // Map<String, dynamic> maps = visionImage.serialize();
    if(_fromCamera){
      StringUtils.log("-------------- START --------------");
      Uint8List bytes = maps['bytes'];
      if(bytes.length > 0){
        String base64 = Base64Encoder().convert(/*newBytes*/bytes);
        StringUtils.log("base64 encode ok..");

        //fortest
        // reply = base64;

        reply = await CustomFirebaseVision.channel.invokeMethod(
            'processImage', <String, dynamic>{'base64': base64});

      }
    }
    else{
      String path = maps['path'];
      StringUtils.log("path: ${path}");
      final file = File(path);
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      Uint8List bytes = await file.readAsBytes();
      StringUtils.log("bytes.length == ${bytes.length}");

      String base64 = Base64Encoder().convert(bytes);
      StringUtils.log("base64 encode ok..");

      reply = await CustomFirebaseVision.channel.invokeMethod(
          'processImage', <String, dynamic>{'base64': base64});
    }

    return reply;
  }

  // Future<File> _compressAndGetFile(File file) async {
  //   // StringUtils.log("_compressAndGetFile");
  //   final dir = await path_provider.getTemporaryDirectory();
  //   final targetPath = dir.absolute.path + "/temp_cam.jpg";
  //
  //   final result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 94,
  //   );
  //   StringUtils.log("... compressAndGetFile ok..");
  //
  //   // final resultLength = await result.length();
  //   // StringUtils.log("... file.lengthSync(): ${file.lengthSync()}");
  //   // StringUtils.log("... result.length: ${resultLength}");
  //
  //   return result;
  // }

  Future<void> _deleteTempFullFile() async {
    StringUtils.log("start delete temp full file..");
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path + "/temp_full.jpg";
    File oldFile = File(targetPath);
    bool hasOld = await oldFile.exists();
    if(hasOld){
      await oldFile.delete();
      StringUtils.log("... delete temp full file ok..");
    }else{
      StringUtils.log("... not found temp full file..");
    }
  }

  Future<void> _deleteTempCamFile() async {
    StringUtils.log("start delete temp cam file..");
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path + "/temp_cam.jpg";
    File oldFile = File(targetPath);
    bool hasOld = await oldFile.exists();
    if(hasOld){
      await oldFile.delete();
      StringUtils.log("... delete temp cam file ok..");
    }else{
      StringUtils.log("... not found temp cam file..");
    }
  }

  static Future<Uint8List> _comporessByte(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
    );
    return result;
  }

  /// Releases resources used by this recognizer.
  Future<void> close() {
    if (!_hasBeenOpened) _isClosed = true;
    if (_isClosed) return Future<void>.value(null);

    _isClosed = true;
    return CustomFirebaseVision.channel.invokeMethod<void>(
      'close',
      <String, dynamic>{'handle': _handle},
    );
  }
}

String _enumToString(dynamic enumValue) {
  final String enumString = enumValue.toString();
  return enumString.substring(enumString.indexOf('.') + 1);
}
