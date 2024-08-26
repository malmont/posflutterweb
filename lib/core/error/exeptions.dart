
class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class DatabaseException implements Exception {}

class AuthException implements Exception {}

class ConnectionException implements Exception {}

class NotFoundException implements Exception {}

class BadRequestException implements Exception {}

class UnauthorisedException implements Exception {}

class ForbiddenException implements Exception {}

class InvalidInputException implements Exception {}


class ValidationException implements Exception {
  final String message;
  const ValidationException(this.message);
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}