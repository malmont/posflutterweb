// features/authentication/application/viewmodels/signin_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/features/authentification/application/blocs/auth_bloc.dart';
import 'package:pos_flutter/features/authentification/domain/entities/user.dart';
import 'package:pos_flutter/features/authentification/domain/usecases/sign_in_usecase.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/sign_in_params.dart';

@injectable
class SignInViewModel extends ChangeNotifier {
  final AuthBloc authBloc;
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  SignInViewModel(this.authBloc);

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

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

    await for (final state in authBloc.stream) {
      if (state is AuthFailure) {
        _errorMessage = "Failed to sign in";
        _isLoading = false;
        notifyListeners();
        break;
      } else if (state is Authenticated) {
        _user = state.user;
        _isLoading = false;
        notifyListeners();
        break;
      }
    }
  }

  Future<void> checkTokenValidity() async {  // Nouvelle méthode pour vérifier la validité du token
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    authBloc.add(TokenValidationEvent());

    await for (final state in authBloc.stream) {
      if (state is TokenInvalid) {
        _errorMessage = "Token is invalid, please sign in again";
        _user = null;
        _isLoading = false;
        notifyListeners();
        break;
      } else if (state is Unauthenticated) {
        _user = null;
        _isLoading = false;
        notifyListeners();
        break;
      } else if (state is Authenticated) {
        _user = state.user;
        _isLoading = false;
        notifyListeners();
        break;
      }
    }
  }
}
