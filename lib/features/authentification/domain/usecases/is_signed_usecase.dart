// features/authentication/domain/usecases/check_token_validity_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/authentification/domain/repositories/auth_repository.dart';

@lazySingleton
class CheckTokenValidityUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  CheckTokenValidityUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.isTokenValid();
  }
}
