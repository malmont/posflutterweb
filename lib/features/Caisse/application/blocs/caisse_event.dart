part of 'caisse_bloc.dart';

abstract class CaisseEvent extends Equatable {
  const CaisseEvent();
}

class GetCaisse extends CaisseEvent {
  final int days;
  const GetCaisse({required this.days});

  @override
  List<Object> get props => [days];
}

class ClearLocalCaisse extends CaisseEvent {
  const ClearLocalCaisse();

  @override
  List<Object> get props => [];
}

class CloseCaisse extends CaisseEvent {
  const CloseCaisse();

  @override
  List<Object> get props => [];
}

class OpenCaisse extends CaisseEvent {
  const OpenCaisse();

  @override
  List<Object> get props => [];
}

class WithDrawCaisse extends CaisseEvent {
  final double amount;
  const WithDrawCaisse(this.amount);

  @override
  List<Object> get props => [amount];
}

class DepositCaisse extends CaisseEvent {
  final double amount;
  const DepositCaisse(this.amount);

  @override
  List<Object> get props => [amount];
}
