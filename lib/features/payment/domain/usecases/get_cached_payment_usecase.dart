import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/payment/domain/entities/payment_details.dart';
import 'package:pos_flutter/features/payment/domain/repositories/payment_repository.dart';

@lazySingleton
class GetCachedPaymentUsecase
    implements UseCase<List<PaymentDetails>, NoParams> {
  final PaymentRepository repository;
  GetCachedPaymentUsecase(this.repository);

  @override
  Future<Either<Failure, List<PaymentDetails>>> call(NoParams params) async {
    return await repository.getCachedPayments();
  }
}
