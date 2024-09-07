// features/authentication/application/blocs/auth_bloc.dart
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/authentification/domain/usecases/is_signed_usecase.dart';

import 'package:pos_flutter/features/authentification/domain/usecases/sign_in_usecase.dart';
import 'package:pos_flutter/core/services/data_sources/local/user_local_data_source.dart';
import 'package:pos_flutter/features/authentification/domain/entities/user.dart';
import 'package:pos_flutter/features/authentification/domain/usecases/sign_out_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckTokenValidityUseCase checkTokenValidityUseCase;
  final SignInUseCase signInUseCase;
  final UserLocalDataSource localDataSource;
  final SignOutUseCase signOutUseCase;

  AuthBloc({
    required this.checkTokenValidityUseCase,
    required this.signInUseCase,
    required this.localDataSource,
    required this.signOutUseCase,
  }) : super(AuthInitial()) {
    on<CheckAuthenticationEvent>(_onCheckAuthentication);
    on<SignInEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onCheckAuthentication(CheckAuthenticationEvent event, Emitter<AuthState> emit) async 
  {
    try {
      emit(AuthLoading());

      final tokenResult = await checkTokenValidityUseCase(NoParams());

      await tokenResult.fold(
        (failure) async {
          emit(Unauthenticated());
        },
        (isValid) async {
          if (isValid) {
            final user = await localDataSource.getUser();
            emit(Authenticated(user));
          } else {
            emit(Unauthenticated());
          }
        },
      );
    } catch (e) {
      emit(AuthFailure(ExceptionFailure()));
    }
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final result = await signInUseCase(event.params);
      emit(result.fold(
        (failure) => AuthFailure(failure),
        (user) => Authenticated(user),
      ));
    } catch (e) {
      emit(AuthFailure(ExceptionFailure()));
    }
  }

  void _onSignOut (SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await signOutUseCase(NoParams());
      emit(Unauthenticated());
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthFailure(ExceptionFailure()));
    }
  }
}
