import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/repositories/caisse_repository.dart';

@lazySingleton
class WithDrawCaisseUseCase implements UseCase<bool, double> {
  final CaisseRepository repository;
  WithDrawCaisseUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(double amount) async {
    return await repository.withdrawCaisse(amount);
  }
}
