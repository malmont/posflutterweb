part of 'caisse_bloc.dart';

abstract class CaisseState extends Equatable {
  final List<Caisse> caisses;
  final int days;
  final double amount;
  const CaisseState({
    required this.caisses,
    required this.days,
    required this.amount,
  });
  @override
  List<Object> get props => [caisses, days, amount];
}

class CaisseInitial extends CaisseState {
  const CaisseInitial({
    required super.caisses,
    required super.days,
    required super.amount,
  });
}

class CaisseLoading extends CaisseState {
  const CaisseLoading({
    required super.caisses,
    required super.days,
    required super.amount,
  });
}

class CaisseMouvement extends CaisseState {
  final bool isSucces;
  const CaisseMouvement({
    required super.caisses,
    required super.days,
    required super.amount,
    required this.isSucces,
  });
}

class CaisseSuccess extends CaisseState {
  const CaisseSuccess({
    required super.caisses,
    required super.days,
    required super.amount,
  });
}

class CaisseFail extends CaisseState {
  final Failure failure;
  const CaisseFail({
    required super.caisses,
    required super.days,
    required super.amount,
    required this.failure,
  });
}
