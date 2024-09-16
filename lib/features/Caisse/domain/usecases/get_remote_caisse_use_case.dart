import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/caisse.dart';
import 'package:pos_flutter/features/Caisse/domain/repositories/caisse_repository.dart';

@lazySingleton
class GetRemoteCaisseUseCase implements UseCase<List<Caisse>, int> {
  final CaisseRepository repository;
  GetRemoteCaisseUseCase(this.repository);

  @override
  Future<Either<Failure, List<Caisse>>> call(int days) async {
    return await repository.getRemoteCaisse(days);
  }
}
