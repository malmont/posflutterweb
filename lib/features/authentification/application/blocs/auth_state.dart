// features/authentication/application/blocs/auth_state.dart
part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  final Failure failure;
  AuthFailure(this.failure);
  @override
  List<Object> get props => [failure];
}

class TokenInvalid extends AuthState {  // Nouvel état pour gérer les tokens invalides
  @override
  List<Object> get props => [];
}
