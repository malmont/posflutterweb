// features/authentication/application/blocs/auth_event.dart
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckAuthenticationEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final SignInParams params;
  SignInEvent(this.params);
}
class SignOutEvent extends AuthEvent {}

class TokenValidationEvent extends AuthEvent {}  // Nouvel événement pour vérifier la validité du token
