
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/authentification/domain/entities/user.dart';
import 'package:pos_flutter/features/authentification/domain/repositories/auth_repository.dart';
import 'package:pos_flutter/features/authentification/infrastucture/models/user/sign_in_params.dart';

@lazySingleton
class SignInUseCase implements UseCase<User, SignInParams> {
  final AuthRepository repository;
  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    return await repository.signIn(params);
  }
}

