
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EnvironmentRepository {
  String get backendRestUri => dotenv.env['BACKEND_REST_URI'] ?? 'https://default-backend.com';
  String get env => dotenv.env['ENV'] ?? 'development';
}
