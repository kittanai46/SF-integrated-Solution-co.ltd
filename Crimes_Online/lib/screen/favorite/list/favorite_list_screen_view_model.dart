import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/data/dto/profile/policestation_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';

part 'favorite_list_screen_view_model.g.dart';

class FavoriteListScreenViewModel = FavoriteListScreenViewModelBase with _$FavoriteListScreenViewModel;

abstract class FavoriteListScreenViewModelBase with Store {
  FavoriteListScreenViewModelBase();

  @observable FavoriteDto defaultFavorite = FavoriteDto();
  @observable List<FavoriteDto> favorites = [];
  @observable UserDto? userDto = UserDto();
  @observable bool isEdit = false;
  ListPoliceStationDto listPoliceStationDto = ListPoliceStationDto(data: []);

  @action
  Future<void> refreshData() async {
    favorites = await KeyUtils.getFavoriteList();
    defaultFavorite = favorites[0];
    favorites.removeAt(0);
  }

  @action
  Future<void> toggleEdit() async{
    isEdit = !isEdit;

    status = ActionStatus.inProgress;
    if(!isEdit){
      try {
        await ApiClient().updateFavorite(favorites);
        final _getUserResponse = await ApiClient().getUser();
        userDto = _getUserResponse.user;
        refreshData();
        status = ActionStatus.success;
      } on Exception catch (obj) {
        await _handleException(obj);
      }
    }else{
      status = ActionStatus.success;
    }
  }

  @action
  Future<void> deleteFavorite(int index) async{
    favorites.removeAt(index);
    favorites.insert(0, defaultFavorite);

    status = ActionStatus.inProgress;
    try {
      await ApiClient().updateFavorite(favorites);
      final _getUserResponse = await ApiClient().getUser();
      userDto = _getUserResponse.user;
      refreshData();
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
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
