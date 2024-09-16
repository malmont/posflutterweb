import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/order/domain/entities/filter_order_params.dart';
import 'package:pos_flutter/features/payment/domain/entities/payment_details.dart';
import 'package:pos_flutter/features/payment/domain/repositories/payment_repository.dart';

@lazySingleton
class GetRemotePaymentUsecase
    implements UseCase<List<PaymentDetails>, FilterOrderParams> {
  final PaymentRepository repository;
  GetRemotePaymentUsecase(this.repository);

  @override
  Future<Either<Failure, List<PaymentDetails>>> call(
      FilterOrderParams params) async {
    return await repository.getPayments(params);
  }
}
