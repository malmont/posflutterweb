part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthenticationEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final SignInParams params;

  const SignInEvent(this.params);

  @override
  List<Object> get props => [params];
}

class SignOutEvent extends AuthEvent {}
