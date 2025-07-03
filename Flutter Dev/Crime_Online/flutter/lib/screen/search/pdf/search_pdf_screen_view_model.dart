import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

part 'search_pdf_screen_view_model.g.dart';


class SearchPdfScreenViewModel = SearchPdfScreenViewModelBase with _$SearchPdfScreenViewModel;

abstract class SearchPdfScreenViewModelBase with Store {
  SearchPdfScreenViewModelBase(){
  }

  UserDto? userDto;
  @observable String url = '';

  // --------- COMMON ------------

  @observable ActionStatus status = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  bool openLogin = false;
  bool openWaitSMS = false;
  bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;
  bool openVerifyPin = false;

  @action
  void resetStatus() {
    status = ActionStatus.idle;
    showError = false;
  }

  Future<void> _handleError(Object obj) async{
    switch (obj.runtimeType) {
      case DioError:
        final type = (obj as DioError).type;
        if(type == DioErrorType.connectionTimeout){
          showError = true;
          errorTitle = AppMessage.error;
          errorMessage = AppMessage.connectedTimeout;

        }else {
          final response = (obj as DioError).response;
          final statusCode = response!.statusCode!;

          if(statusCode>=400 && statusCode<500) {
            final responseDto = CommonResponseDto.fromJson(
                gsonDecode(response.data.toString()));
            errorTitle = AppMessage.error;
            errorMessage = responseDto.message;

            if (statusCode == 400) {
              showError = true;
            } else if (statusCode == 401) {
              await KeyUtils.clearAll();
              openLogin = true;
            } else if (statusCode == 402) {
              openWaitSMS = true;
            } else if (statusCode == 403) {
              openWaitAdmin = true;
            } else if (statusCode == 404) {
              openRegisterPin = true;
            } else if (statusCode == 405) {
              openRegisterBiometrics = true;
            } else if (statusCode == 406) {
              openVerifyPin = true;
            }
          }else{
            showError = true;
            errorTitle = AppMessage.error;
            errorMessage = AppMessage.pleaseTryAgain;
          }
        }

        break;
      default:
        final exception = obj as Exception;
        String message = exception.toString();
        if(message == null || message.isEmpty){
          message = AppMessage.pleaseTryAgain;
        }else if(message.indexOf("Exception: ")>-1){
          message = message.substring(message.indexOf("Exception: ")+"Exception: ".length);
        }
        showError = true;
        errorTitle = AppMessage.error;
        errorMessage = message;
        break;
    }
    status = ActionStatus.error;
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();
    var status = await Permission.storage.status;

    if (status == PermissionStatus.granted) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }

      try {
        // FileUtils.mkdir([dirloc]);
        var randid = Random().nextInt(10000);
        var pathFile = dirloc + randid.toString() + ".pdf";
        await dio.download(url, pathFile,
            onReceiveProgress: (receivedBytes, totalBytes) {
             /* setState(() {
                downloading = true;
                progress = ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
              });*/
              var progress = ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
              print('progress : ${progress}');
            });

        print('download file : ${pathFile}');
      } catch (e) {
        print(e);
      }


/*      setState(() {
        downloading = false;
        progress = "Download Completed.";
        path = dirloc + randid.toString() + ".jpg";
      });*/
    } else {
      /*setState(() {
        progress = "Permission Denied!";
        _onPressed = () {
          downloadFile();
        };
      });*/
    }
  }
}
