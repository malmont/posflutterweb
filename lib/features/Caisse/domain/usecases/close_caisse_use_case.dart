import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/repositories/caisse_repository.dart';

@lazySingleton
class CloseCaisseUseCase implements UseCase<bool, NoParams> {
  final CaisseRepository repository;
  CloseCaisseUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.closeCaisse(params);
  }
}
