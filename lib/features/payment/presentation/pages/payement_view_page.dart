import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/features/payment/presentation/widgets/payments_list_page_view.dart';

import '../../application/blocs/payment_bloc.dart';

class PaymentViewPage extends StatefulWidget {
  const PaymentViewPage({super.key});

  @override
  State<PaymentViewPage> createState() => _PaymentViewPageState();
}

class _PaymentViewPageState extends State<PaymentViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentFetchLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PaymentFetchSuccess) {
            return PaymentsListPage(
              payments: state.payments,
              onSelectPayment: (payment) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment ${payment.id} selected')),
                );
              },
            );
          }

          if (state is PaymentFecthFail) {
            return Center(
              child: Text('Failed to load payments: ${state.failure}'),
            );
          }

          return const Center(
            child: Text('Unknown state'),
          );
        },
      ),
    );
  }
}
