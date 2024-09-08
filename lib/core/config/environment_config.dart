import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/config/environment_repository.dart';


@lazySingleton
class EnvironmentConfig {
  final EnvironmentRepository _envRepo;

  EnvironmentConfig(this._envRepo);

  String get backendRestUri => _envRepo.backendRestUri;
  String get env => _envRepo.env;
}
