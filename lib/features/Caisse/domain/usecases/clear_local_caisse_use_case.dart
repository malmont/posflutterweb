import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/repositories/caisse_repository.dart';

@lazySingleton
class ClearLocalCaisseUseCase implements UseCase<NoParams, NoParams> {
  final CaisseRepository repository;
  ClearLocalCaisseUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.clearLocalCaisse(params);
  }
}
