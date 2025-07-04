import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/collect_cookie_interceptor.dart';
import 'package:crimes/data/client/service_api.dart';
import 'package:dio/dio.dart';

class ClientBuilder {
  
  Future<ServiceApi> createService() async {
    //Duration timeoutDuration = Duration(milliseconds: 2 * 60 * 1000);
    Duration timeoutDuration = Duration(minutes: 2);
    Dio dio = Dio(BaseOptions(baseUrl: AppConstant.apiUrl, connectTimeout: timeoutDuration));
    await _createClientWithInterceptors(dio);
    return ServiceApi(dio);
  }

  _createClientWithInterceptors(Dio dio) async {
    dio.interceptors.add(CookieInterceptors());
    if(AppConstant.isDebug) {
      dio.interceptors.add(LogInterceptor(responseBody: AppConstant.isDebug, requestBody: AppConstant.isDebug));
    }
  }
}
