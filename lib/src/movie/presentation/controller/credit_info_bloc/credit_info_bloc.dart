import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/movie/domain/entity/person.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/usecases/credits_info.dart';


part 'credit_info_event.dart';

part 'credit_info_state.dart';

class CreditInfoBloc extends Bloc<CreditInfoEvent, CreditInfoState> {
  CreditInfoBloc(this.getCreditInfoUseCase)
      : super(CreditInfoState()) {
    on<GetCreditInfoEvent>(_getCreditMovies);
  }

  final GetCreditInfoUseCase getCreditInfoUseCase;

  FutureOr<void> _getCreditMovies(
      GetCreditInfoEvent event, Emitter<CreditInfoState> emit) async {
    final result =
        await getCreditInfoUseCase(CreditInfoParameters(event.id));

    result.fold(
      (l) => emit(
        state.copWith(
          personState: RequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copWith(
          personState: RequestState.loaded,
          person: r,
        ),
      ),
    );
  }
}
