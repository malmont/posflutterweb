import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_flutter/core/error/failures.dart';
import 'package:pos_flutter/core/usecases/usecases.dart';
import 'package:pos_flutter/features/Caisse/domain/entities/caisse.dart';
import 'package:pos_flutter/features/Caisse/domain/usecases/clear_local_caisse_use_case.dart';
import 'package:pos_flutter/features/Caisse/domain/usecases/close_caisse_use_case.dart';
import 'package:pos_flutter/features/Caisse/domain/usecases/deposit_caisse_use_case.dart';
import 'package:pos_flutter/features/Caisse/domain/usecases/get_cached_caisse_use_case.dart';
import 'package:pos_flutter/features/Caisse/domain/usecases/get_remote_caisse_use_case.dart';
import 'package:pos_flutter/features/Caisse/domain/usecases/open_caisse_use_case.dart';
import 'package:pos_flutter/features/Caisse/domain/usecases/with_draw_caisse_use_case.dart';

part 'caisse_state.dart';
part 'caisse_event.dart';

@injectable
class CaisseBloc extends Bloc<CaisseEvent, CaisseState> {
  final GetRemoteCaisseUseCase _getRemoteCaisseUseCase;
  final GetCachedCaisseUseCase _getCachedCaisseUseCase;
  final ClearLocalCaisseUseCase _clearLocalCaisseUseCase;
  final CloseCaisseUseCase _closeCaisseUseCase;
  final OpenCaisseUseCase _openCaisseUseCase;
  final WithDrawCaisseUseCase _withDrawCaisseUseCase;
  final DepositCaisseUseCase _depositCaisseUseCase;

  CaisseBloc(
      this._getRemoteCaisseUseCase,
      this._getCachedCaisseUseCase,
      this._clearLocalCaisseUseCase,
      this._closeCaisseUseCase,
      this._openCaisseUseCase,
      this._withDrawCaisseUseCase,
      this._depositCaisseUseCase)
      : super(const CaisseInitial(caisses: [], days: 15, amount: 0)) {
    on<GetCaisse>(_onGetCaisse);
    on<ClearLocalCaisse>(_onClearLocalCaisse);
    on<CloseCaisse>(_onCloseCaisse);
    on<OpenCaisse>(_onOpenCaisse);
    on<WithDrawCaisse>(_onWithDrawCaisse);
    on<DepositCaisse>(_onDepositCaisse);
  }

  void _onGetCaisse(GetCaisse event, Emitter<CaisseState> emit) async {
    try {
      emit(CaisseLoading(
          caisses: state.caisses, days: state.days, amount: state.amount));
      final cachedResult = await _getCachedCaisseUseCase(NoParams());
      cachedResult.fold(
        (failure) => _emitError(emit, failure),
        (caisse) => emit(CaisseSuccess(
            caisses: caisse, days: state.days, amount: state.amount)),
      );
      final remoteResult = await _getRemoteCaisseUseCase(event.days);
      remoteResult.fold(
        (failure) => _emitError(emit, failure),
        (caisse) => emit(CaisseSuccess(
            caisses: caisse, days: state.days, amount: state.amount)),
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(CaisseFail(
          failure: ServerFailure(),
          caisses: state.caisses,
          days: state.days,
          amount: state.amount));
    }
  }

  void _onClearLocalCaisse(
      ClearLocalCaisse event, Emitter<CaisseState> emit) async {
    try {
      emit(CaisseLoading(
          caisses: state.caisses, days: state.days, amount: state.amount));
      final cachedResult = await _clearLocalCaisseUseCase(NoParams());
      cachedResult.fold(
        (failure) => _emitError(emit, failure),
        (result) => emit(const CaisseInitial(caisses: [], days: 1, amount: 0)),
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(CaisseFail(
          failure: ServerFailure(),
          caisses: state.caisses,
          days: state.days,
          amount: state.amount));
    }
  }

  void _onCloseCaisse(CloseCaisse event, Emitter<CaisseState> emit) async {
    try {
      emit(CaisseLoading(
          caisses: state.caisses, days: state.days, amount: state.amount));
      final remoteResult = await _closeCaisseUseCase(NoParams());
      remoteResult.fold(
        (failure) => _emitError(emit, failure),
        (result) {
          emit(CaisseMouvement(
              isSucces: result,
              caisses: state.caisses,
              days: state.days,
              amount: state.amount));
          add(GetCaisse(days: state.days));
        },
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(CaisseFail(
          failure: ServerFailure(),
          caisses: state.caisses,
          days: state.days,
          amount: state.amount));
    }
  }

  void _onOpenCaisse(OpenCaisse event, Emitter<CaisseState> emit) async {
    try {
      emit(CaisseLoading(
          caisses: state.caisses, days: state.days, amount: state.amount));
      final remoteResult = await _openCaisseUseCase(NoParams());
      remoteResult.fold(
        (failure) => _emitError(emit, failure),
        (result) {
          emit(CaisseMouvement(
              isSucces: result,
              caisses: state.caisses,
              days: state.days,
              amount: state.amount));
          add(GetCaisse(days: state.days));
        },
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(CaisseFail(
          caisses: state.caisses,
          days: state.days,
          amount: state.amount,
          failure: ServerFailure()));
    }
  }

  void _onWithDrawCaisse(
      WithDrawCaisse event, Emitter<CaisseState> emit) async {
    try {
      emit(CaisseLoading(
          caisses: state.caisses, days: state.days, amount: state.amount));
      final remoteResult = await _withDrawCaisseUseCase(event.amount);
      remoteResult.fold(
        (failure) => _emitError(emit, failure),
        (result) {
          emit(CaisseMouvement(
              isSucces: result,
              caisses: state.caisses,
              days: state.days,
              amount: state.amount));
          add(GetCaisse(days: state.days));
        },
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(CaisseFail(
          caisses: state.caisses,
          days: state.days,
          amount: state.amount,
          failure: ServerFailure()));
    }
  }

  void _onDepositCaisse(DepositCaisse event, Emitter<CaisseState> emit) async {
    try {
      emit(CaisseLoading(
          caisses: state.caisses, days: state.days, amount: event.amount));
      final remoteResult = await _depositCaisseUseCase(event.amount);
      remoteResult.fold(
        (failure) => _emitError(emit, failure),
        (result) {
          emit(CaisseMouvement(
              caisses: state.caisses,
              days: state.days,
              amount: state.amount,
              isSucces: result));
          add(GetCaisse(days: state.days));
        },
      );
    } catch (e, stackTrace) {
      print('Erreur: $e, stack: $stackTrace');
      emit(CaisseFail(
          caisses: state.caisses,
          days: state.days,
          amount: state.amount,
          failure: ServerFailure()));
    }
  }

  void _emitError(Emitter<CaisseState> emit, Failure failure) {
    emit(CaisseFail(
      failure: failure,
      caisses: state.caisses,
      days: state.days,
      amount: state.amount,
    ));
  }
}
