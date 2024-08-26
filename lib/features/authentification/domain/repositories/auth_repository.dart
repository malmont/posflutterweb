
import 'package:dartz/dartz.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/authentification/domain/entities/user.dart';
import 'package:pos_flutter/features/authentification/domain/usecases/sign_in_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn(SignInParams params);
   Future<Either<Failure, NoParams>> signOut();
   Future<Either<Failure, bool>> isTokenValid(); 
}
