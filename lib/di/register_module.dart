// lib/di/register_module.dart
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

@module
abstract class RegisterModule {
  
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker => InternetConnectionChecker();

  @preResolve // Attend l'initialisation de SharedPreferences
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  http.Client get httpClient => http.Client();
}
