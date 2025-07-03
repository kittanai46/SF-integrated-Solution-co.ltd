import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'status_screen_view_model.g.dart';

class StatusScreenViewModel = StatusScreenViewModelBase with _$StatusScreenViewModel;

abstract class StatusScreenViewModelBase with Store {
  StatusScreenViewModelBase();

  @observable String? title = '';
  @observable String? image = '';
  @observable String? message = '';
  @observable String? confirmButtonText = '';

  @observable String version="";
  @observable String buildnumber="";

  @action
  Future<void> checkAuthenticate() async{
    final username = await KeyUtils.getUsername();
    if(username.isEmpty) return;

    status = ActionStatus.inProgress;
    try {
      await ApiClient().checkActivateDevice(username);  //Check Authenticate api
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }


  // ---- COMMON ------

  @observable ActionStatus status = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  bool openLogin = false;
  // bool openWaitSMS = false;
  // bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;

  @action
  void resetStatus() {
    status = ActionStatus.idle;
    showError = false;
  }

  Future<void> getVersionInfo() async{
    // status = ActionStatus.inProgress;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildnumber=packageInfo.buildNumber;
    print("get version => "+version+" "+buildnumber);
  }

  Future<void> _handleException(Object obj) async{
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
              image = AppImage.ic_status_pending;
              title = AppMessage.titleChangePhone;
              message = errorMessage!;
            } else if (statusCode == 402) {
              // openWaitSMS = true;
              image = AppImage.ic_status_pending;
              title = AppMessage.titleWaitSMS;
              message = errorMessage!;
            } else if (statusCode == 403) {
              // openWaitAdmin = true;
              image = AppImage.ic_status_pending;
              title = AppMessage.titleWaitAdmin;
              message = errorMessage!;
            } else if (statusCode == 404) {
              openRegisterPin = true;
            } else if (statusCode == 405) {
              openRegisterBiometrics = true;
            }
          }else{
            showError = true;
            errorTitle = AppMessage.error;
            errorMessage = AppMessage.pleaseTryAgain;
          }
        }

        break;
      default:
        showError = true;
        errorTitle = AppMessage.error;
        errorMessage = AppMessage.pleaseTryAgain;
        break;
    }
    status = ActionStatus.error;
  }
}
