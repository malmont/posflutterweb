import 'package:dartz/dartz.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/caisse.dart';

abstract class CaisseRepository {
  Future<Either<Failure, bool>> openCaisse(noParams);
  Future<Either<Failure, List<Caisse>>> getRemoteCaisse(int days);
  Future<Either<Failure, bool>> closeCaisse(noParams);
  Future<Either<Failure, bool>> depositCaisse(double amount);
  Future<Either<Failure, bool>> withdrawCaisse(double amount);
  Future<Either<Failure, List<Caisse>>> getCachedCaisse(noParams);
  Future<Either<Failure, NoParams>> clearLocalCaisse(noParams);
}
