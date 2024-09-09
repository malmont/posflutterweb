import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/features/authentification/application/blocs/auth_bloc.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/sign_in_params.dart';

@injectable
class SignInViewModel extends ChangeNotifier {
  final AuthBloc authBloc;
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;

  SignInViewModel(this.authBloc);

  // Getters
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> signIn() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    authBloc.add(SignInEvent(SignInParams(
      username: _email,
      password: _password,
    )));

    _isLoading = false;
    notifyListeners();
  }

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  // Méthode pour réinitialiser les champs
  void resetFields() {
    _email = '';
    _password = '';
    _errorMessage = null;
    notifyListeners();
  }
}
