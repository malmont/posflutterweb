import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/caisse.dart';
import 'package:pos_flutter/features/Caisse/domain/repositories/caisse_repository.dart';

@lazySingleton
class GetCachedCaisseUseCase implements UseCase<List<Caisse>, NoParams> {
  final CaisseRepository repository;
  GetCachedCaisseUseCase(this.repository);

  @override
  Future<Either<Failure, List<Caisse>>> call(NoParams params) async {
    return await repository.getCachedCaisse(params);
  }
}
