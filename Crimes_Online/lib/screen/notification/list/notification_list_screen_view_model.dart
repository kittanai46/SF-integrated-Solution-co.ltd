import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';

part 'notification_list_screen_view_model.g.dart';

class NotificationListScreenViewModel = NotificationListScreenViewModelBase with _$NotificationListScreenViewModel;

abstract class NotificationListScreenViewModelBase with Store {
  NotificationListScreenViewModelBase();

  @observable List<NotifyDto> notifications = [];
  @observable UserDto userDto = UserDto();

  @action
  Future<void> refreshData() async {
    notifications.clear();
    status = ActionStatus.inProgress;
    try {
      final response = await ApiClient().getNotify();
      notifications = response.listNotifyDto!.data!;
      notifications.sort((a, b) => _convertReadDateSort(b.createdDateSort!).compareTo(_convertReadDateSort(a.createdDateSort!)));
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  int _convertReadDateSort(String readDateSort) {
    if(readDateSort == null || readDateSort.isEmpty) return DateTime.now().millisecondsSinceEpoch;
    // 25640228 18:16
    String hour = readDateSort.substring(readDateSort.indexOf(' ')+1, readDateSort.indexOf(':'));
    String min = readDateSort.substring(readDateSort.indexOf(':')+1);
    String dateWithT = "${readDateSort.substring(0, 8)}T${hour}${min}00";
    DateTime dateTime = DateTime.parse(dateWithT);
    return dateTime.millisecondsSinceEpoch;
  }

  @action
  void updateNotifyIndex(int index) {
    if(notifications == null) return;
    if(notifications.length <= index) return;

    NotifyDto notifyDto = notifications[index];
    print("notifyDto.mxId=${notifyDto.notifyId}");
    notifyDto.readFlag = 'true';
    notifications[index] = notifyDto;
  }

  // ----- COMMON --------

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

          if(statusCode>=400 && statusCode<500){
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
          }else {
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
