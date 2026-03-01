class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, [this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

/// Network related error
class FetchDataException extends AppException {
  FetchDataException([String message = "Error During Communication"])
      : super(message, "Network Error: ");
}

/// Bad request error
class BadRequestException extends AppException {
  BadRequestException([String message = "Invalid Request"])
      : super(message, "Bad Request: ");
}

/// Unauthorized request
class UnauthorizedException extends AppException {
  UnauthorizedException([String message = "Unauthorized Request"])
      : super(message, "Unauthorized: ");
}

/// Resource not found
class NotFoundException extends AppException {
  NotFoundException([String message = "Resource Not Found"])
      : super(message, "Not Found: ");
}

/// Internal server error
class ServerException extends AppException {
  ServerException([String message = "Internal Server Error"])
      : super(message, "Server Error: ");
}

/// Cache error
class CacheException extends AppException {
  CacheException([String message = "Cache Error"])
      : super(message, "Cache Error: ");
}