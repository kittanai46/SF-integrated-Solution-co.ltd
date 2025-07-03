import 'package:crimes/config/app_constant.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CookieInterceptors extends InterceptorsWrapper {

  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? sessionId = await FlutterSecureStorage().read(key: AppConstant.kCookie);
     StringUtils.log("======>  CookieInterceptors onRequest sessionId: $sessionId");
    if (sessionId != null) {
      options.headers[AppConstant.kHeaderAuthorization] = 'Bearer $sessionId';
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) async {
    String? sessionId = response.headers.value(AppConstant.kHeaderAuthorization);
     StringUtils.log("======>  CookieInterceptors onResponse sessionId: $sessionId");
    if (sessionId != null && sessionId.isNotEmpty) {
      await FlutterSecureStorage().write(key: AppConstant.kCookie, value: sessionId);
    }
    return super.onResponse(response, handler);
  }
}
