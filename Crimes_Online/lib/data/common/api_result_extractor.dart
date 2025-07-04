import 'package:crimes/data/common/api_request_exception.dart';
import 'package:crimes/data/common/api_status_response.dart';
import 'package:dio/dio.dart';

const apiSuccessCode = 'success'; //200;

mixin ApiResultExtractor {
  ApiErrorType _mapStatusCodeToErrorType(int statusCode) {
    ApiErrorType type;
    switch (statusCode) {
      case 400:
        type = ApiErrorType.badRequest;
        break;
      case 401:
        type = ApiErrorType.unauthorized;
        break;
      case 403:
        type = ApiErrorType.notPermission;
        break;
      case 404:
        type = ApiErrorType.notFound;
        break;
      case 419:
        type = ApiErrorType.accessExpired;
        break;
      case 420:
        type = ApiErrorType.authenticationFailed;
        break;
      case 500:
        type = ApiErrorType.internalServerError;
        break;
      default:
        type = ApiErrorType.unknown;
    }
    return type;
  }

  // Future<R> extractApiResult<R extends ApiStatusResponse>(Future<R> apiCall) async {
  //   try {
  //     final ApiStatusResponse response = await apiCall;
  //     //handle API custom status code
  //     if (response.status != apiSuccessCode) {
  //       throw convertApiStatusResponseToException(response);
  //     }
  //     return response;
  //   } on DioError catch (e) {
  //     throw _convertDioErrorToException(e);
  //   }
  // }
  //
  // ApiRequestException convertApiStatusResponseToException(ApiStatusResponse response) {
  //   final errorType = _mapStatusCodeToErrorType(response.status);
  //   return ApiRequestException(errorType: errorType, message: response.message);
  // }

  // ApiRequestException _convertDioErrorToException(DioError error) {
  //   if (error.response != null) {
  //     final errorType = _mapStatusCodeToErrorType(error.response.statusCode);
  //     return ApiRequestException(errorType: errorType, message: error.response.statusMessage);
  //   } else {
  //     return ApiRequestException(errorType: ApiErrorType.unknown, message: error.message);
  //   }
  // }
}
