class ApiRequestException implements Exception {
  ApiRequestException({this.errorType, this.message});

  final ApiErrorType? errorType;
  final String? message;

  @override
  String toString() => 'ApiRequestException: type: $errorType, message: $message';
}

enum ApiErrorType {
  unknown,
  badRequest,
  unauthorized,
  notPermission,
  notFound,
  accessExpired,
  authenticationFailed,
  internalServerError,
}
